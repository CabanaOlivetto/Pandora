var largura_gui = display_get_gui_width();
var altura_gui = display_get_gui_height();

// ==========================================
// CASO 1: EXIBIR AVISO DE BLOQUEIO DO QUADRO
// ==========================================
if (mostrar_aviso_quadro) {
    // Configura a fonte e alinhamento do texto
    if (asset_get_index("fnt_dialogo") != -1) {
        draw_set_font(fnt_dialogo);
    }
    
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    
    // Posição da caixinha de texto (centralizada na parte inferior da tela)
    var cx = largura_gui / 2;
    var cy = altura_gui - 80;
    
    // Desenha o fundo da caixa de mensagem
    draw_set_color(c_black);
    draw_set_alpha(0.75);
    draw_rectangle(cx - 320, cy - 30, cx + 320, cy + 30, false);
    
    // Desenha a borda fina branca
    draw_set_color(c_white);
    draw_set_alpha(1.0);
    draw_rectangle(cx - 320, cy - 30, cx + 320, cy + 30, true);
    
    // Texto da mensagem indicando o que o jogador deve fazer
    draw_text(cx, cy, "O piano está trancado. Devo investigar o quadro primeiro.");
    
    // Reseta as configurações para o padrão do GameMaker
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}

// ==========================================
// CASO 2: DESENHAR O MINIGAME DO PIANO ATIVO
// ==========================================
else if (minigame_ativo) {
    // 1. Fundo Escuro transparente base
    draw_set_color(c_black);
    draw_set_alpha(0.8);
    draw_rectangle(0, 0, largura_gui, altura_gui, false);
    draw_set_alpha(1.0);

    var largura_total_piano = 52 * tecla_largura;
    var x_inicio = (largura_gui / 2) - (largura_total_piano / 2);
    var y_inicio = (altura_gui / 2) - (tecla_altura / 2);

    // --- DESIGN DO VISOR DE SEQUÊNCIA (Acima do Piano) ---
    var visor_largura = 240;
    var visor_altura = 50;
    var visor_x1 = (largura_gui / 2) - (visor_largura / 2);
    var visor_y1 = y_inicio - visor_altura - 30;
    var visor_x2 = visor_x1 + visor_largura;
    var visor_y2 = visor_y1 + visor_altura;

    // Se errou, pinta o fundo do visor de Vermelho
    if (piscar_erro) {
        draw_set_color(c_red);
        draw_set_alpha(0.3);
        draw_rectangle(0, 0, largura_gui, altura_gui, false); // Flash vermelho na tela inteira
        draw_set_alpha(1.0);
        
        // Fundo do visor vermelho escuro
        draw_set_color(c_maroon);
        draw_rectangle(visor_x1, visor_y1, visor_x2, visor_y2, false);
        
        // Texto de Erro
        draw_set_color(c_white);
        draw_set_halign(fa_center);
        draw_text(largura_gui / 2, visor_y1 + 15, "ERROU! RESETANDO...");
        draw_set_halign(fa_left); 
    } 
    // Se não errou, desenha o visor cinza escuro normal
    else {
        draw_set_color(make_color_rgb(30, 30, 30));
        draw_rectangle(visor_x1, visor_y1, visor_x2, visor_y2, false);
        draw_set_color(c_dkgray); 
        draw_rectangle(visor_x1, visor_y1, visor_x2, visor_y2, true); 

        // Desenha os espaços das 4 letras (_ _ _ _) ou as letras já digitadas
        draw_set_color(c_lime); 
        draw_set_halign(fa_center);
        
        var texto_visor = "";
        for (var slot = 0; slot < 4; slot++) {
            if (slot < array_length(sequencia_jogador)) {
                texto_visor += sequencia_jogador[slot] + " ";
            } else {
                texto_visor += "_ ";
            }
        }
        draw_text_transformed(largura_gui / 2, visor_y1 + 12, texto_visor, 1.5, 1.5, 0);
        draw_set_halign(fa_left); 
    }

    // PASSO 1: Desenhar as Teclas Brancas
    var conta_brancas = 0;
    for (var i = 0; i < 88; i++) {
        if (padrao_piano[i] == "W") {
            var x1 = x_inicio + (conta_brancas * tecla_largura);
            var y1 = y_inicio;
            var x2 = x1 + tecla_largura;
            var y2 = y1 + tecla_altura;

            if (i == tecla_destacada) {
                draw_set_color(c_yellow);
            } else {
                draw_set_color(c_white);
            }
            draw_rectangle(x1, y1, x2, y2, false);
            
            draw_set_color(c_black);
            draw_rectangle(x1, y1, x2, y2, true);

            conta_brancas++;
        }
    }

    // PASSO 2: Desenhar as Teclas Pretas por cima
    conta_brancas = 0;
    for (var i = 0; i < 88; i++) {
        if (padrao_piano[i] == "W") {
            conta_brancas++;
        } else {
            var x_preta = x_inicio + (conta_brancas * tecla_largura) - (tecla_preta_largura / 2);
            var y1 = y_inicio;
            var x2 = x_preta + tecla_preta_largura;
            var y2 = y1 + tecla_preta_altura;

            if (i == tecla_destacada) {
                draw_set_color(c_orange);
            } else {
                draw_set_color(c_black);
            }
            draw_rectangle(x_preta, y1, x2, y2, false);
            
            if (i == tecla_destacada) {
                draw_set_color(c_black);
                draw_rectangle(x_preta, y1, x2, y2, true);
            }
        }
    }
}