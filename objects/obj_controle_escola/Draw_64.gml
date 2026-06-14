// =========================================================================
// INTERFACE DE OBJETIVOS (Canto Superior Direito)
// =========================================================================
draw_set_color(c_white);
draw_set_halign(fa_right);
draw_set_valign(fa_top);
draw_set_font(fnt_dialogo);

var _gui_w = display_get_gui_width();
var _pos_x = _gui_w - 20;
var _pos_y = 60;

// Mostra o texto baseado no progresso atual da escola
switch(estado_missao) {
    case 0:
        // Corrigido para objetos_feitos (sem o "s" no meio) para evitar crash
        draw_text(_pos_x, _pos_y, "Objetivo: Investigar a escola (" + string(objetos_feitos) + "/" + string(objetos_total) + ")");
        break;
        
    case 1:
        draw_text(_pos_x, _pos_y, "Objetivo: Vá para a sala em cima da entrada");
        break;
        
    case 2:
        // Muda a cor do texto para verde para celebrar o sucesso!
        draw_set_color(c_lime);
        draw_text(_pos_x, _pos_y, "Objetivo: Entenda!");
        draw_set_color(c_white); // Reseta para branco padrão
        break;
}


// =========================================================================
// EFEITO TURVO E CHIADO DE ESTÁTICA (APENAS PERTO DO VULTO3)
// =========================================================================

// O efeito só deve ser calculado se a escola AINDA NÃO foi purificada
if (!escritorio_colorido && instance_exists(obj_player)) {
    
    var _tela_w = display_get_gui_width();
    var _tela_h = display_get_gui_height();
    
    // Começa estritamente em 0. Sem chiado de fundo na fase inteira!
    var _alfa_final = 0; 
    
    // Procura pelo vulto vivo mais próximo
    var _vulto_perto = instance_nearest(obj_player.x, obj_player.y, obj_vulto3);
    
    // Se houver um vulto no mapa, calcula a proximidade
    if (_vulto_perto != noone) {
        var _dist = point_distance(obj_player.x, obj_player.y, _vulto_perto.x, _vulto_perto.y);
        
        // SÓ ATIVA O CHIADO se o jogador estiver a menos de 160 pixels do vulto
        if (_dist < 160) {
            // O alpha cresce de 0.0 até 0.65 conforme você chega bem perto do vulto
            _alfa_final = clamp((160 - _dist) / 160, 0.0, 0.65);
        }
    }
    
    // O GameMaker SÓ vai desenhar os efeitos se você estiver perto do vulto (_alfa_final > 0)
    if (_alfa_final > 0) {
        
        var _flicker = sin(current_time * 0.02) * 0.05;
        
        // 1. Camada de penumbra escura (vinheta assombrada)
        draw_set_color(c_black); 
        draw_set_alpha(clamp(_alfa_final + _flicker, 0, 0.70));
        draw_rectangle(0, 0, _tela_w, _tela_h, false);
        
        // 2. Desenha as linhas horizontais de estática da TV
        draw_set_color(c_white);
        draw_set_alpha(_alfa_final * 0.30); 
        
        repeat(30) {
            var _rand_y = irandom(_tela_h);
            var _rand_h = irandom_range(1, 3); 
            draw_rectangle(0, _rand_y, _tela_w, _rand_y + _rand_h, false);
        }
        
        // 3. Desenha os chuviscos (pontos/ruído de estática soltos)
        repeat(40) {
            var _rand_x = irandom(_tela_w);
            var _rand_y = irandom(_tela_h);
            draw_rectangle(_rand_x, _rand_y, _rand_x + 2, _rand_y + 2, false);
        }
    }
}

// =========================================================================
// POP-UP DE AVISO DE CONTROLES INVERTIDOS
// =========================================================================
if (exibir_aviso_confusao) {
    var _pop_w = 320;
    var _pop_h = 40;
    var _pop_x = (_gui_w - _pop_w) / 2; 
    var _pop_y = 20;                     
    
    // Fundo do pop-up
    draw_set_color(c_black);
    draw_set_alpha(0.8);
    draw_rectangle(_pop_x, _pop_y, _pop_x + _pop_w, _pop_y + _pop_h, false);
    
    // Borda vermelha
    draw_set_color(c_red); 
    draw_set_alpha(1.0);
    draw_rectangle(_pop_x, _pop_y, _pop_x + _pop_w, _pop_y + _pop_h, true);
    
    // Texto de alerta
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(c_white);
    draw_text(_pop_x + (_pop_w / 2), _pop_y + (_pop_h / 2), "VOCÊ ESTÁ CONFUSO! (Controles Invertidos)");
}

// =========================================================================
// RESET DE CONFIGURAÇÕES DE DESENHO (Padrão do GameMaker)
// =========================================================================
draw_set_alpha(1.0);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(-1);