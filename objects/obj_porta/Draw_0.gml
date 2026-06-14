draw_self();

if (instance_exists(obj_player) && !global.controle_travado) {
    if (point_distance(x, y, obj_player.x, obj_player.y) < 32) {
        
        draw_set_halign(fa_center);
        
        // SE FOR A PORTA OU QUALQUER FILHO DELA, mostra o texto de entrar
        if (object_index == obj_porta || object_is_ancestor(object_index, obj_porta)) {
            draw_text(x, y - 20, "Aperte E para Entrar");
        }
        // Se for o vulto/NPC, mostra o texto de falar
        else {
            draw_text(x, bbox_top - 16, "Aperte E para Falar");
        }
    }
}