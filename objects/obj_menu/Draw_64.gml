draw_set_halign(fa_center);
draw_set_valign(fa_middle);

if (estado == "menu_principal") {
    draw_text_transformed(room_width/2, 160, "Pandora", 8, 6, 0);
    for (var i = 0; i < array_length(opcoes_menu); i++) {
        var _cor = (i == indice) ? c_yellow : c_white;
        draw_text_color(room_width/2, 250 + (i * 60), opcoes_menu[i], _cor, _cor, _cor, _cor, 1);
    }
} else if (estado == "escolher_slot") {
    var _titulo = (acao == "novo") ? "NOVO JOGO" : "CONTINUAR";
    draw_text(room_width/2, 120, _titulo);
    
    for (var i = 0; i < array_length(opcoes_slot); i++) {
        var _cor = (i == indice) ? c_yellow : c_white;
        var _texto = opcoes_slot[i];
        
        if (i < 3 && file_exists("save" + string(i + 1) + ".json")) {
            _texto += " (Ocupado)";
        }
        
        draw_text_color(room_width/2, 250 + (i * 60), _texto, _cor, _cor, _cor, _cor, 1);
    }
}