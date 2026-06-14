// Pega a largura e altura da interface da sua tela automaticamente
var _largura_gui = display_get_gui_width();
var _altura_gui = display_get_gui_height();

// Define a posição da caixa (um retângulo na parte inferior da tela)
var _x1 = 32;
var _y1 = _altura_gui - 120;
var _x2 = _largura_gui - 32;
var _y2 = _altura_gui - 24;

// 1. Desenha o fundo da caixa (Retângulo preto com borda branca)
draw_set_color(c_black);
draw_rectangle(_x1, _y1, _x2, _y2, false);

draw_set_color(c_white);
draw_rectangle(_x1, _y1, _x2, _y2, true);

// 2. Recorta o texto baseado no progresso do efeito de máquina de escrever
var _texto_completo = dialogo[pagina];
var _texto_parcial = string_copy(_texto_completo, 1, floor(caractere_atual));

// --- 3. CONFIGURAÇÃO DA FONTE ACENTUADA ---
draw_set_font(fnt_dialogo); // Usa a fonte configurada com acentos!
draw_set_color(c_white);    // Garante que o texto seja desenhado em branco
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// Desenha o texto aplicando quebra de linha automática
draw_text_ext(_x1 + 16, _y1 + 16, _texto_parcial, 22, (_x2 - _x1) - 32);

