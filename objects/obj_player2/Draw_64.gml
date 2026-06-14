// Renderiza a caixa de diálogo na tela enquanto estiver ativo
if (exibir_dialogo) {
    var _gui_w = display_get_gui_width();
    var _gui_h = display_get_gui_height();
    
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
    
    if (font_exists(fnt_dialogo)) {
        draw_set_font(fnt_dialogo);
    }
    
    var _largura_max_texto = (_caixa_x2 - _caixa_x1) - 40;
    var _texto_centro_x = (_caixa_x1 + _caixa_x2) / 2;
    var _texto_centro_y = (_caixa_y1 + _caixa_y2) / 2;
    
    // Pega o texto atual baseado no índice da fala
    var _texto_atual = dialogo[indice_fala];
    draw_text_ext(_texto_centro_x, _texto_centro_y, _texto_atual, 22, _largura_max_texto);
    
    // Reseta propriedades para não quebrar outros textos do jogo
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_font(-1); 
    draw_set_color(c_white);
}