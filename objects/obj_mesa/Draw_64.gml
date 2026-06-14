if (janela_aberta) {
    var _gui_w = display_get_gui_width();
    var _gui_h = display_get_gui_height();
    
    // Escurece o fundo
    draw_set_alpha(0.75);
    draw_set_color(c_black);
    draw_rectangle(0, 0, _gui_w, _gui_h, false);
    draw_set_alpha(1.0); 
    
    // Desenha a imagem centralizada calculando o tamanho dela
    if (sprite_exists(sprite_exibir)) {
        var _escala = 1.8; 
        
        var _spr_w = sprite_get_width(sprite_exibir) * _escala;
        var _spr_h = sprite_get_height(sprite_exibir) * _escala;
        
        var _desenho_x = (_gui_w / 2) - (_spr_w / 2);
        var _desenho_y = (_gui_h / 2) - (_spr_h / 2) - 30; 
        
        draw_sprite_ext(sprite_exibir, 0, _desenho_x, _desenho_y, _escala, _escala, 0, c_white, 1.0);
    }
    
    // Caixa de texto inferior
    var _caixa_x1 = 60;
    var _caixa_y1 = _gui_h - 130;
    var _caixa_x2 = _gui_w - 60;
    var _caixa_y2 = _gui_h - 30;
    
    draw_set_color(c_black);
    draw_rectangle(_caixa_x1, _caixa_y1, _caixa_x2, _caixa_y2, false);
    draw_set_color(c_white);
    draw_rectangle(_caixa_x1, _caixa_y1, _caixa_x2, _caixa_y2, true);
    
    // Configurações de alinhamento e escrita
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(c_yellow); 
    
    // Ativa a sua fonte antes dos cálculos de texto (Substitua pelo nome real da sua fonte)
    if (font_exists(fnt_dialogo)) {
        draw_set_font(fnt_dialogo);
    }
    
    var _largura_max_texto = (_caixa_x2 - _caixa_x1) - 40;
    var _texto_centro_x = (_caixa_x1 + _caixa_x2) / 2;
    var _texto_centro_y = (_caixa_y1 + _caixa_y2) / 2;
    
    draw_text_ext(_texto_centro_x, _texto_centro_y, texto_exibir, 22, _largura_max_texto);
    
    // Reseta propriedades
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_font(-1); 
    draw_set_color(c_white);
}