// Verifica se o objeto do player existe na sala
if (instance_exists(obj_player)) {
    // Calcula a distancia ate o player
    var distancia = distance_to_object(obj_player);
    
    // Se estiver perto e pressionar a tecla 'E'
    if (distancia < 40 && keyboard_check_pressed(ord("E"))) {
        // Inverte o estado (se estiver aberto, fecha; se estiver fechado, abre)
        exibir_texto = !exibir_texto;
        
        // NOVIDADE: Se acabou de abrir e nunca foi explorado antes...
        if (exibir_texto && !ja_explorado) {
            ja_explorado = true; // Marca para nunca mais pontuar este PC
            
            // Avisa o controlador para somar 1 computador feito
            if (instance_exists(obj_controlador_hud)) {
                if (obj_controlador_hud.estado_missao == 0) {
                    obj_controlador_hud.computadores_feito += 1;
                    
                    // Se atingiu os 2 computadores, avança a missão para o vulto
                    if (obj_controlador_hud.computadores_feito >= 2) {
                        obj_controlador_hud.estado_missao = 1;
                    }
                }
            }
        }
    }
    
    // Se o player se afastar da mesa, a caixa fecha automaticamente
    if (distancia >= 40) {
        exibir_texto = false;
    }
}