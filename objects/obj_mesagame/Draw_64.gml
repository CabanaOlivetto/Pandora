if (exibir_texto) {
    // 1. Pegamos o tamanho exato da tela do jogo atual
    var tela_largura = display_get_gui_width();
    var tela_altura = display_get_gui_height();
    
    // 2. Definimos o tamanho da caixa para ocupar quase toda a largura da tela
    var caixa_largura = tela_largura - 40; // Deixa uma pequena borda de 20px nas laterais da tela
    var caixa_altura = 130;                // Altura ideal para duas ou tres linhas de texto
    
    // 3. Calculamos a posicao para centralizar na horizontal e colar na parte inferior
    var caixa_x = (tela_largura - caixa_largura) / 2;
    var caixa_y = tela_altura - caixa_altura - 20; // 20 pixels de distancia do fundo da tela
    
    // 4. Desenha o fundo da caixa (Preto)
    draw_set_color(c_black);
    draw_rectangle(caixa_x, caixa_y, caixa_x + caixa_largura, caixa_y + caixa_altura, false);
    
    // Desenha a borda fina (Branca)
    draw_set_color(c_white);
    draw_rectangle(caixa_x, caixa_y, caixa_x + caixa_largura, caixa_y + caixa_altura, true);
    
    // 5. CONFIGURAÇÕES DE TEXTO (IGUAL À IMAGEM)
    // Margem interna para o texto respirar dentro do box
    var margem_esquerda = 40; 
    var largura_max_texto = caixa_largura - (margem_esquerda * 2);
    
    // Alinhamento vertical no meio para o texto não ficar colado no topo da caixa
    draw_set_valign(fa_middle);
    draw_set_halign(fa_left);
    draw_set_color(c_white);
    
    // A posicao Y do texto agora aponta para o centro vertical da caixa preta
    var texto_x = caixa_x + margem_esquerda;
    var texto_y = caixa_y + (caixa_altura / 2);
    
    // Desenha o texto
    draw_text_ext(texto_x, texto_y, texto_burnout, 24, largura_max_texto);
    
    // MUITO IMPORTANTE: Reseta o alinhamento padrão do GameMaker para não bugar outros textos do jogo
    draw_set_valign(fa_top);
}