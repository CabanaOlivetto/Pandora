// --- DESLIGA O FILTER/SHADER PARA A INTERFACE FICAR COLORIDA ---
shader_reset();

// Garante o Alpha em 1 e limpa qualquer interferência de cor anterior
draw_set_alpha(1);
draw_set_color(c_white);

// --- CONFIGURAÇÃO DE COORDENADAS ---
var _largura_gui = display_get_gui_width();
var _altura_gui = display_get_gui_height();

// Posição centralizada na metade superior da tela
var _centro_x = _largura_gui / 2;
var _pos_y = 100;

var _barra_largura = 200;
var _barra_altura = 16;

var _x1 = _centro_x - (_barra_largura / 2);
var _y1 = _pos_y;
var _x2 = _centro_x + (_barra_largura / 2);
var _y2 = _pos_y + _barra_altura;


// --- DESENHO DAS FORMAS GEOMÉTRICAS CORES PURAS ---

// 1. Desenha o fundo da barra (Cinza escuro)
draw_set_color(c_dkgray);
draw_rectangle(_x1, _y1, _x2, _y2, false);

// 2. Calcula a posição do medidor atual baseado nos dados do Step
var _preenchimento_x = _x1 + ((respiracao_atual / 100) * _barra_largura);

// 3. Desenha a zona segura/estável no centro da barra (Retângulo Verde)
draw_set_color(c_green);
draw_rectangle(_centro_x - 30, _y1, _centro_x + 30, _y2, false);

// 4. Desenha o marcador da respiração atual do jogador (Linha Branca)
draw_set_color(c_white);
draw_line_width(_preenchimento_x, _y1 - 4, _preenchimento_x, _y2 + 4, 3);


// --- TEXTOS ---
draw_set_font(fnt_dialogo);
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_text(_centro_x, _y1 - 25, "Mantenha a respiração estável [Espaço]");

// Se o cronômetro estiver contando, mostra o tempo restante na tela
if (cronometro_iniciado) {
    var _segundos_restantes = ceil(alarm[0] / 60);
    draw_text(_centro_x, _pos_y + _barra_altura + 15, "Estabilizando em: " + string(_segundos_restantes) + "s");
}

// Reseta os padrões de desenho do GameMaker para os próximos objetos
draw_set_alpha(1);
draw_set_color(c_white);