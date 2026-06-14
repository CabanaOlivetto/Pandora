// Só desenha se o vulto já tiver enviado os textos para cá
if (array_length(dialogo) > 0) {
    
    // Pega o tamanho atual da tela (Interface)
    var _gui_w = display_get_gui_width();
    var _gui_h = display_get_gui_height();
    
    // Define a posição da caixa (parte inferior da tela)
    var _x1 = 60;
    var _y1 = _gui_h - 160;
    var _x2 = _gui_w - 60;
    var _y2 = _gui_h - 40;
    
    // 1. Desenha o fundo preto da caixa
    draw_set_color(c_black);
    draw_rectangle(_x1, _y1, _x2, _y2, false);
    
    // 2. Desenha o contorno branco da caixa
    draw_set_color(c_white);
    draw_rectangle(_x1, _y1, _x2, _y2, true);
    
    // 3. Configura o alinhamento do texto
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    
    // Calcula a largura máxima que o texto pode ter antes de quebrar a linha
    var _largura_max = (_x2 - _x1) - 40;
    
    // 4. Desenha o texto da página atual
    draw_text_ext(_x1 + 20, _y1 + 20, dialogo[pagina], 22, _largura_max);
}