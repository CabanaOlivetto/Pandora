if (instance_exists(obj_player)) {
    var _dist = point_distance(x, y, obj_player.x, obj_player.y);
    
    // Se o jogador estiver perto e apertar 'E'
    if (_dist < 60 && keyboard_check_pressed(ord("E"))) {
        
        if (instance_exists(obj_controle_escola)) {
            
            // Só acontece se estiver no estado 1 (após falar com os vultos)
            if (obj_controle_escola.estado_missao == 1) {
                
                // Ativa o diálogo com a sua frase
                exibir_dialogo = true;
                texto_dialogo = "A nossa fase da escola é complicada. Passamos por diversos problemas, mas tudo isso passa, mesmo que doa.";
                
                // Muda a missão e LIBERA AS CORES
                obj_controle_escola.estado_missao = 2;
                obj_controle_escola.escritorio_colorido = true;
                
                // Limpa os efeitos do player
                obj_player.controles_invertidos = false;
                obj_controle_escola.exibir_aviso_confusao = false;
                
                // Reset imediato do shader
                shader_reset();
            } 
            // Se já estiver purificado e apertar 'E' de novo, fecha/abre a caixa
            else if (obj_controle_escola.estado_missao == 2) {
                exibir_dialogo = !exibir_dialogo;
            }
        }
    }
    
    // Se o player se afastar, a caixa fecha sozinha
    if (_dist >= 80) {
        exibir_dialogo = false;
    }
}