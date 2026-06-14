if (instance_exists(obj_player)) {
    var _distancia_individual = point_distance(x, y, obj_player.x, obj_player.y);
    
    // Se o player estiver perto de uma porta comum ou filha dela
    if (_distancia_individual < 32) {
        if (!global.controle_travado) {
            
            // Aceita o obj_porta E também o seu filho obj_Pempresa
            if (object_index == obj_porta || object_is_ancestor(object_index, obj_porta)) {
                if (keyboard_check_pressed(ord("E"))) {
                    if (target_room != noone && room_exists(target_room)) {
                        obj_player.x = target_x;
                        obj_player.y = target_y;
                        room_goto(target_room);
                    }
                }
            }
            
        } // Fim do !global.controle_travado
    }
}