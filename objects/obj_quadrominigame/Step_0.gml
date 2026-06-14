// --- 1. SEGURANÇA: Garante que as variáveis essenciais existem no objeto ---
if (!variable_instance_exists(id, "minigame_vencido")) minigame_vencido = false;
if (!variable_instance_exists(id, "jogando")) jogando = false;
if (!variable_instance_exists(id, "ganhou")) ganhou = false;
if (!variable_instance_exists(id, "alpha_tela")) alpha_tela = 0;
if (!variable_instance_exists(id, "tempo_focado")) tempo_focado = 0;
if (!variable_instance_exists(id, "tempo_necessario")) tempo_necessario = 60;
if (!variable_instance_exists(id, "senha_escondida_x")) senha_escondida_x = 450;
if (!variable_instance_exists(id, "senha_escondida_y")) senha_escondida_y = 300;
if (!variable_instance_exists(id, "raio_descoberta")) raio_descoberta = 60;

// --- 2. LÓGICA PRINCIPAL ---
if (instance_exists(obj_player)) {
    
    // --- ESTADO 1: JOGANDO O MINIJOGO DO QUADRO ---
    if (jogando == true) {
        if (ganhou == true) {
            if (keyboard_check_pressed(ord("E")) || keyboard_check_pressed(vk_space) || mouse_check_button_pressed(mb_left)) {
                
                // =======================================================
                // 🏆 SALVA A VITÓRIA DO QUADRO NO CONTROLADOR GLOBAL 🏆
                // =======================================================
                var _nome_fase = room_get_name(room);
                var _chave_atual = _nome_fase + "_atual";

                if (global.fases != undefined && ds_map_exists(global.fases, _chave_atual)) {
                    var _completos = ds_map_find_value(global.fases, _chave_atual);
                    ds_map_replace(global.fases, _chave_atual, _completos + 1);
                    show_debug_message("Progresso do QUADRO salvo! Total na fase: " + string(_completos + 1));
                }
                // =======================================================
                
                global.controle_travado = false;
                jogando = false;
                keyboard_clear(ord("E")); // Limpa para não repassar o clique
            }
            exit;
        }

        if (alpha_tela < 1) alpha_tela += 0.05;

        var _mouse_x = device_mouse_x_to_gui(0);
        var _mouse_y = device_mouse_y_to_gui(0);
        var _distancia = point_distance(_mouse_x, _mouse_y, senha_escondida_x, senha_escondida_y);

        if (_distancia <= raio_descoberta) {
            tempo_focado += 1;
            if (tempo_focado >= tempo_necessario) {
                ganhou = true;
                minigame_vencido = true; // Salva o estado interno sem dar missão concluída de imediato
            }
        } else {
            if (tempo_focado > 0) tempo_focado -= 0.5;
        }
        exit;
    }
    
    // --- ESTADO 2: ESPERANDO INTERAÇÃO NA PAREDE ---
    else {
        var _dist_player = point_distance(x, y, obj_player.x, obj_player.y);
        
        // Se afastar libera o controle travado por segurança
        if (_dist_player > 48) {
            if (!instance_exists(obj_caixa_texto) && global.controle_travado) {
                global.controle_travado = false;
            }
        }
        
        // Se o player estiver colado no quadro
        if (_dist_player < 48) {
            // Se o minijogo do vulto ou outra caixa de texto estiverem ativos, o quadro se desliga para não chocar
            if (instance_exists(obj_respiracao) || instance_exists(obj_caixa_texto)) exit;
            
            if (keyboard_check_pressed(ord("E"))) {
                keyboard_clear(ord("E")); // Consome o clique do teclado imediatamente
                
                var _nome_fase = room_get_name(room);
                var _chave_atual = _nome_fase + "_atual";
                var _pontos_atuais = 0;
                
                if (global.fases != undefined && ds_map_exists(global.fases, _chave_atual)) {
                    _pontos_atuais = ds_map_find_value(global.fases, _chave_atual);
                }
                
                // TRAVA DE ORDEM: Só abre o minijogo se o contador for maior ou igual a 1
                if (minigame_vencido == false) {
                    if (_pontos_atuais >= 1) {
                        global.controle_travado = true;
                        alpha_tela = 0;
                        tempo_focado = 0;
                        jogando = true;
                    } else {
                        // Se for 0, mostra a mensagem de bloqueio apontando pro sofá
                        if (!instance_exists(obj_caixa_texto)) {
                            global.controle_travado = true;
                            var _caixa = instance_create_layer(0, 0, layer, obj_caixa_texto);
                            _caixa.dialogo[0] = "Uma pintura misteriosa... Mas sinto que preciso investigar aquela presença no sofa primeiro.";
                        }
                    }
                } 
                else {
                    // Se já tiver vencido o minijogo antes, apenas relê as notas reveladas
                    if (!instance_exists(obj_caixa_texto)) {
                        global.controle_travado = true;
                        var _caixa = instance_create_layer(0, 0, layer, obj_caixa_texto);
                        _caixa.dialogo[0] = "As notas reveladas na pintura eram:E - D - O - M";
                        _caixa.dialogo[1] = "Preciso usá-las no piano.";
                    }
                }
            }
        }
    }
}