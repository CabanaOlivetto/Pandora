// Gerencia o tempo do texto na tela
if (tempo_texto_cama > 0) {
    tempo_texto_cama--;
    if (tempo_texto_cama == 0) {
        mostrar_texto_cama = false;
        
        // Se o texto acabou e ele tinha conseguido dormir de fato, muda de sala/reinicia
        if (texto_exibido == "O tempo ajuda... Descansar faz bem. Você concluiu esta noite.") {
            // Insira aqui o comando para ir para a próxima sala, ex:
            // room_goto_next(); 
            // Ou apenas reinicia a sala para testar:
            //room_restart();
        }
    }
}

// Procura o jogador na sala
var player_inst = noone;
if (instance_exists(obj_player)) player_inst = obj_player;
else if (instance_exists(obj_jogador)) player_inst = obj_jogador;

if (player_inst != noone) {
    // Se o jogador estiver perto da cama e apertar "E"
    if (point_distance(x, y, player_inst.x, player_inst.y) < 180) {
        if (keyboard_check_pressed(ord("E")) && !mostrar_texto_cama) {
            
            var total_concluido = 0;
            
            // Pega o progresso atual do obj_controler
            if (variable_global_exists("fases")) {
                var nome_fase = room_get_name(room);
                var chave_atual = nome_fase + "_atual";
                
                if (ds_map_exists(global.fases, chave_atual)) {
                    total_concluido = ds_map_find_value(global.fases, chave_atual);
                }
            }
            
            // CASO 1: Já fez os 3 minigames -> Finaliza a fase!
            if (total_concluido >= 3) {
                texto_exibido = "O tempo ajuda... Descansar faz bem. Você concluiu esta noite.";
                mostrar_texto_cama = true;
                tempo_texto_cama = 240; // Fica 4 segundos na tela por ser o final
                
                // ATIVA AS CORES NO CONTROLADOR E DESLIGA O SHADER DAS CAMADAS
                if (instance_exists(obj_controler)) {
                    obj_controler.cenario_colorido = true;
                    
                    var layer_inicio = layer_get_id("Background");
                    var layer_fim    = layer_get_id("interacoes");
                    
                    if (layer_exists(layer_inicio)) layer_script_begin(layer_inicio, -1);
                    if (layer_exists(layer_fim))    layer_script_end(layer_fim, -1);
                }
            } 
            // CASO 2: Tentou deitar sem terminar as tarefas
            else {
                texto_exibido = "Ainda sinto uma forte angústia... Não consigo dormir sem resolver tudo antes.";
                mostrar_texto_cama = true;
                tempo_texto_cama = 180; // Fica 3 segundos na tela
            }
            
            keyboard_clear(ord("E"));
        }
    }
}