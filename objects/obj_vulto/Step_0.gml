if (instance_exists(obj_player)) {
    var _distancia = point_distance(x, y, obj_player.x, obj_player.y);
    
    // Pega o estado se já venceu (Garante que a variável existe)
    var _ja_venceu = false;
    if (variable_instance_exists(id, "minigame_vencido")) {
        _ja_venceu = minigame_vencido;
    }
    
    // ==========================================
    // 1. CHECAGEM DA RESPIRAÇÃO (Bloqueada se já venceu)
    // ==========================================
    // ADICIONADO: && _ja_venceu == false
    if (dialogo_feito == true && !instance_exists(obj_caixa_texto) && minigame_iniciado == false && _ja_venceu == false) {
        if (!instance_exists(obj_respiracao) && alarm[1] <= 0) {
            minigame_iniciado = true; 
            alarm[1] = 2; // Ativa o ALARM 1 para criar a respiração
        }
    }
    
    // ==========================================
    // 2. INTERAÇÃO DIRETA (Botão E)
    // ==========================================
    // Só permite interagir se NÃO tiver vencido o minigame ainda
    if (_distancia < 50 && minigame_iniciado == false && !instance_exists(obj_caixa_texto) && _ja_venceu == false) { 
        if (keyboard_check_pressed(ord("E"))) {
            keyboard_clear(ord("E")); 
            global.controle_travado = true; 
            event_user(0); // Inicia o diálogo
        }
    }
}