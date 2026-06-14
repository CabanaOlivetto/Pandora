// --- GATILHO DO MINIJOGO DO QUADRO ---

// 1. Se o minijogo deste quadro específico já foi vencido antes
if (minigame_vencido == true) {
    // Se a caixa de texto ainda não existe na tela, cria uma para dar um feedback ao jogador
    if (!instance_exists(obj_caixa_texto)) {
        global.controle_travado = true; // Trava o player enquanto lê
        
        var _caixa = instance_create_layer(0, 0, layer, obj_caixa_texto);
        _caixa.dialogo[0] = "As notas musicais reveladas na pintura eram: M - O - D - E";
        _caixa.dialogo[1] = "Preciso usá-las no piano agora.";
        
        dialogo_feito = true;
    }
} 

// 2. Se o jogador ainda NÃO venceu o minijogo deste quadro
else {
    // Se a tela do minijogo ainda não está aberta, abre ela agora
    if (!instance_exists(obj_quadrominigame) && dialogo_feito == false) {
        global.controle_travado = true; // Trava o jogador para ele não andar enquanto joga
        
        // Cria a interface do minijogo da lanterna na tela
        instance_create_layer(0, 0, layer, obj_quadrominigame);
        
        dialogo_feito = true;
    }
}