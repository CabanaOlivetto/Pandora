if (instance_exists(obj_player2)) {
    var _dist = distance_to_object(obj_player2);
    
    // Se o jogador estiver perto e apertar 'E'
    if (_dist < 40 && keyboard_check_pressed(ord("E"))) {
        
        // Se a janela não estava aberta, abre ela e reseta o diálogo
        if (!janela_aberta) {
            janela_aberta = true;
            indice_fala = 0;
        } 
        // Se a janela já estava aberta, avança o diálogo
        else {
            if (indice_fala < array_length(dialogo) - 1) {
                indice_fala += 1;
            } else {
                // Se era a última fala, fecha a janela!
                janela_aberta = false;
                
                // Avisa o controlador da cafeteria que o diálogo acabou e pode colorir
                if (instance_exists(obj_controler_cafeteria)) {
                    obj_controler_cafeteria.cafeteria_colorida = true;
                }
            }
        }
    }
    
    // Se o jogador se afastar, fecha a janela automaticamente
    if (_dist >= 40) {
        janela_aberta = false;
    }
} 