// SE NÃO ESTIVER JOGANDO, NÃO DESENHA A INTERFACE NA TELA!
if (jogando == false) exit;

var _largura_gui = display_get_gui_width();
var _altura_gui = display_get_gui_height();

// 1. Fundo do Quadro Centralizado (Middle Center)
draw_set_alpha(alpha_tela);
if (sprite_exists(spr_quadro)) {
    draw_sprite_ext(spr_quadro, 0, _largura_gui / 2, _altura_gui / 2, _largura_gui / sprite_get_width(spr_quadro), _altura_gui / sprite_get_height(spr_quadro), 0, c_white, alpha_tela);
}

// 2. Tela de Vitória
if (ganhou == true) {
    draw_set_color(c_black);
    draw_set_alpha(0.7);
    draw_rectangle(0, _altura_gui / 2 - 80, _largura_gui, _altura_gui / 2 + 80, false);
    
    draw_set_alpha(1);
    draw_set_font(fnt_dialogo);
    draw_set_color(c_yellow);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    
    draw_text(_largura_gui / 2, _altura_gui / 2 - 20, "NOTAS REVELADAS:E - D - M - O");
    
    draw_set_color(c_white);
    draw_text(_largura_gui / 2, _altura_gui / 2 + 40, "[ Pressione ESPAÇO ou E para fechar ]");
} 
// 3. Efeito da Lanterna ativa
else {
    var _surf = surface_create(_largura_gui, _altura_gui);
    if (surface_exists(_surf)) {
        surface_set_target(_surf);
        draw_clear_alpha(c_black, 0.94); 
        gpu_set_blendmode(bm_subtract);
        
        var _mouse_x = device_mouse_x_to_gui(0);
        var _mouse_y = device_mouse_y_to_gui(0);
        
        if (sprite_exists(spr_lanterna_luz)) {
            draw_sprite_ext(spr_lanterna_luz, 0, _mouse_x, _mouse_y, 2.0, 2.0, 0, c_white, 1);
        }
        
        gpu_set_blendmode(bm_normal);
        surface_reset_target();
        draw_surface(_surf, 0, 0);
        surface_free(_surf);
    }

    draw_set_font(fnt_dialogo);
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_set_valign(fa_top);
    draw_text(_largura_gui / 2, 40, "Investigue o quadro com a lanterna para revelar as notas ocultas.");

    if (tempo_focado > 0) {
        var _barra_w = 150; var _barra_h = 6;
        var _bx = (_largura_gui / 2) - (_barra_w / 2); var _by = 80;
        draw_set_color(c_dkgray);
        draw_rectangle(_bx, _by, _bx + _barra_w, _by + _barra_h, false);
        draw_set_color(c_yellow);
        var _ponto_w = (tempo_focado / tempo_necessario) * _barra_w;
        draw_rectangle(_bx, _by, _bx + _ponto_w, _by + _barra_h, false);
    }
}

draw_set_alpha(1);