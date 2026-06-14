if (instance_exists(obj_player)) {
    var _dist = distance_to_object(obj_player);
    
    // Se o jogador estiver perto e apertar 'E'
    if (_dist < 40 && keyboard_check_pressed(ord("E"))) {
        
        if (instance_exists(obj_controlador_hud)) {
            
            // 1. Bloqueado antes de falar com o vulto
            if (obj_controlador_hud.estado_missao < 2) {
                exit; 
            }
            
            // 2. Interagindo no Computador Principal (Fase 2 -> Avança para 3)
            if (obj_controlador_hud.estado_missao == 2) {
                janela_aberta = !janela_aberta;
                
                if (janela_aberta) {
                    obj_controlador_hud.estado_missao = 3;
                    obj_controlador_hud.escritorio_colorido = true; 
                }
            }
            
            // 3. Quando o jogador aperta 'E' para FECHAR a tela na missão 3
            else if (obj_controlador_hud.estado_missao == 3) {
                janela_aberta = !janela_aberta;
                
                // Força o controlador a fixar as cores
                obj_controlador_hud.escritorio_colorido = true;
                
                // DESLIGA O SHADER IMEDIATAMENTE NO FLUXO ATUAL
                shader_reset(); 
            }
        }
    }
    
    if (_dist >= 40) {
        // Se o jogador se afastar, fecha a tela e garante que fica colorido
        if (janela_aberta && instance_exists(obj_controlador_hud)) {
            obj_controlador_hud.escritorio_colorido = true;
            shader_reset();
        }
        janela_aberta = false;
    }
}