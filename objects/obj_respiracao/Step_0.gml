if (mecanica_ativa) {
    tempo += 1;
    
    // 1. Oscilação natural
    var _oscilacao = sin(tempo * frequencia_oscilacao) * 0.4;
    respiracao_atual += _oscilacao;
    
    // 2. Controle do jogador (Segurar ESPAÇO sobe, soltar desce)
    if (keyboard_check(vk_space)) {
        respiracao_atual += 0.8; 
    } else {
        respiracao_atual -= 0.6; 
    }
    
    // Garante que o valor fica entre 0 e 100
    respiracao_atual = clamp(respiracao_atual, 0, 100);
    
    if (velocidade_surgimento < 1) {
        velocidade_surgimento += 0.05;
    }
    
    // --- ❌ CONDIÇÃO DE DERROTA (A BARRA TOCOU NOS EXTREMOS) ---
    if (respiracao_atual <= 0 || respiracao_atual >= 100) {
        
        if (instance_exists(obj_vulto)) {
            var _npc = instance_nearest(obj_player.x, obj_player.y, obj_vulto);
            if (_npc != noone) {
                _npc.dialogo_feito = false;      
                _npc.minigame_iniciado = false;  
                _npc.alarm[1] = -1; // Desliga o alarme correto do vulto (Alarm 1)
            }
        }
        
        keyboard_clear(vk_space);
        global.controle_travado = false; 
        instance_destroy();              
        exit;                            
    }
    
    // --- 🏆 LÓGICA DOS 5 SEGUNDOS (CONDIÇÃO DE VITÓRIA) ---
    if (respiracao_atual >= 35 && respiracao_atual <= 65) {
        if (cronometro_iniciado == false) {
            alarm[0] = 180; // Configurado para 3 segundos (180 frames)
            cronometro_iniciado = true;
        }
    } 
    else {
        alarm[0] = -1; 
        cronometro_iniciado = false;
    }
}