if (exibir_dialogo) {
    var _gui_w = display_get_gui_width();
    var _gui_h = display_get_gui_height();
    
    // 1. Configurações da Caixa (Centralizada embaixo)
    var _box_w = _gui_w * 0.8; // Ocupa 80% da largura da tela
    var _box_h = 100;
    var _box_x = (_gui_w - _box_w) / 2;
    var _box_y = _gui_h - _box_h - 50; 

    // 2. Desenha o fundo (Preto com transparência)
    draw_set_alpha(0.8);
    draw_set_color(c_black);
    draw_rectangle(_box_x, _box_y, _box_x + _box_w, _box_y + _box_h, false);
    
    // 3. Desenha a borda (Branca)
    draw_set_alpha(1);
    draw_set_color(c_white);
    draw_rectangle(_box_x, _box_y, _box_x + _box_w, _box_y + _box_h, true);
    
    // 4. Configura o texto
    draw_set_font(fnt_dialogo); // Use a sua fonte de diálogo
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    
    // Desenha o texto centralizado dentro da caixa
    // O draw_text_ext faz o texto quebrar linha se for muito grande
    draw_text_ext(_box_x + (_box_w/2), _box_y + (_box_h/2), texto_dialogo, 25, _box_w - 40);
    
    // Reseta o alinhamento para não bugar o resto do jogo
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}