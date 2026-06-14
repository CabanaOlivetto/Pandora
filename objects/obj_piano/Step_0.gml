// 1. SISTEMA DE ATIVAÇÃO COM BLOQUEIO E AVISO EM TELA
if (!minigame_ativo) {
    
    if (tempo_aviso_quadro > 0) {
        tempo_aviso_quadro--;
        if (tempo_aviso_quadro == 0) mostrar_aviso_quadro = false;
    }

    var player_inst = noone;
    if (instance_exists(obj_player)) player_inst = obj_player;
    else if (instance_exists(obj_jogador)) player_inst = obj_jogador;

    if (player_inst != noone) {
        if (point_distance(x, y, player_inst.x, player_inst.y) < 250) {
            if (keyboard_check_pressed(ord("E"))) {
                
                var pode_jogar = true;
                
                if (variable_global_exists("fases")) {
                    var nome_fase = room_get_name(room);
                    var chave_atual = nome_fase + "_atual";
                    
                    if (ds_map_exists(global.fases, chave_atual)) {
                        var minigames_concluidos = ds_map_find_value(global.fases, chave_atual);
                        
                        if (minigames_concluidos < 2) {
                            pode_jogar = false;
                            mostrar_aviso_quadro = true;
                            tempo_aviso_quadro = 180; 
                        }
                    }
                }
                
                if (pode_jogar) {
                    minigame_ativo = true;
                    sequencia_jogador = array_create(0);
                    tecla_destacada = -1;
                    tempo_destaque = 0;
                    piscar_erro = false;
                    tempo_erro = 0;
                    
                    // CORREÇÃO AQUI: Reseta e prepara o buffer do teclado de forma limpa
                    keyboard_string = ""; 
                    keyboard_lastchar = ""; 
                }
            }
        }
    }
}
// 2. LÓGICA DO MINIGAME ATIVO (DIGITAÇÃO DO ALFABETO)
else {
    // Controla o tempo do aviso de erro na tela
    if (tempo_erro > 0) {
        tempo_erro--;
        if (tempo_erro == 0) {
            piscar_erro = false;
            sequencia_jogador = array_create(0); 
            keyboard_string = ""; // Limpa o buffer para o próximo teste
        }
    }
    // Controla o tempo que a tecla fica brilhando amarela
    else if (tempo_destaque > 0) {
        tempo_destaque--;
        if (tempo_destaque == 0) {
            tecla_destacada = -1; 
            event_user(0); // Valida se a letra digitada está certa ou errada
        }
    }
    // CORREÇÃO NA CAPTURA: Usar keyboard_string é muito mais estável para o alfabeto!
    else if (string_length(keyboard_string) > 0) {
        // Pega o caractere digitado e transforma em Letra Maiúscula
        var letra = string_upper(string_char_at(keyboard_string, 1));
        
        // Verifica se o caractere é uma letra válida de A a Z
        if (string_ord_at(letra, 1) >= 65 && string_ord_at(letra, 1) <= 90) {
            
            var posicao_alfabeto = string_ord_at(letra, 1) - 65;
            
            // Mapeia para acender uma tecla no piano baseado na letra
            tecla_destacada = 20 + (posicao_alfabeto * 2); 
            
            tempo_destaque = 15; // Mantém aceso por 15 frames
            nota_clicada = letra; 
            
            // Adiciona no visor imediatamente
            array_push(sequencia_jogador, letra);
        }
        
        // Limpa a string para a próxima tecla poder ser lida no próximo frame
        keyboard_string = "";
    }

    // Fechar o minigame se apertar ESC (Evita usar a tecla E para não conflitar com a letra E do alfabeto!)
    if (tempo_destaque == 0 && tempo_erro == 0) {
        if (keyboard_check_pressed(vk_escape)) {
            minigame_ativo = false;
        }
    }
}