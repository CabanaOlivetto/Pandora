// Verifica se o jogador existe na sala antes de medir a distância
if (instance_exists(obj_player)) {
    // Se o jogador estiver perto (raio de 50 pixels) e apertar a tecla E
    if (point_distance(x, y, obj_player.x, obj_player.y) < 50) {
        if (keyboard_check_pressed(ord("E"))) {
            // Dispara o User Event 0 para criar a caixa de texto
            event_user(0); 
        }
    }
}

// NOVIDADE: Se a caixa de texto sumiu do jogo, o vulto fica pronto para conversar de novo
if (!instance_exists(obj_caixa_vulto)) {
    dialogo_feito = false;
}