draw_set_color(c_white);
draw_set_halign(fa_right);
draw_set_valign(fa_top);

var _gui_w = display_get_gui_width();
var _pos_x = _gui_w - 20; 
var _pos_y = 60; 

// Mostra o texto correto baseado no progresso atual
switch(estado_missao) {
    case 0:
        draw_text(_pos_x, _pos_y, "Objetivo: Vasculhar computadores (" + string(computadores_feito) + "/2)");
        break;
        
    case 1:
        draw_text(_pos_x, _pos_y, "Objetivo: Investigar a aparição (Vulto)");
        break;
        
    case 2:
        draw_text(_pos_x, _pos_y, "Objetivo: Acessar o Computador Principal");
        break;
}