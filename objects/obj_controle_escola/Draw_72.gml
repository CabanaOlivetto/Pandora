// Se a escola NÃO estiver purificada, desenha tudo em preto e branco
if (escritorio_colorido == false) {
    shader_set(sh_preto_e_branco);
} else {
    // Se foi purificada, desliga o shader para voltar a cor original
    shader_reset();
}