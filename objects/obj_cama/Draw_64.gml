if (mostrar_texto_cama) {
    var largura_gui = display_get_gui_width();
    var altura_gui = display_get_gui_height();
    
    if (asset_get_index("fnt_dialogo") != -1) {
        draw_set_font(fnt_dialogo);
    }
    
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    
    var cx = largura_gui / 2;
    var cy = altura_gui - 80;
    
    // Fundo da caixinha
    draw_set_color(c_black);
    draw_set_alpha(0.75);
    draw_rectangle(cx - 360, cy - 30, cx + 360, cy + 30, false);
    
    // Borda da caixinha
    draw_set_color(c_white);
    draw_set_alpha(1.0);
    draw_rectangle(cx - 360, cy - 30, cx + 360, cy + 30, true);
    
    // Desenha o texto dinâmico (seja o de sucesso ou o de bloqueio)
    draw_text(cx, cy, texto_exibido);
    
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}