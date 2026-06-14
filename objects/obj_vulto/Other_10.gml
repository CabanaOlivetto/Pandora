// 🔒 TRAVA IMEDIATA: Impede o jogador de andar ou interagir com o quadro
global.controle_travado = true;

// Primeiro garante que a variável existe no objeto para não dar erro
if (!variable_instance_exists(id, "dialogo_feito")) {
    dialogo_feito = false;
}

// --- PASSO 1: SE O DIÁLOGO AINDA NÃO FOI FEITO, CRIA A CAIXA DE TEXTO ---
if (!instance_exists(obj_caixa_texto) && dialogo_feito == false) {
    
    var _caixa = instance_create_layer(0, 0, layer, obj_caixa_texto);
    _caixa.dialogo[0] = "Você se move rápido, mas parece que está sempre correndo de algo que não dá para ver, não é!?";
    _caixa.dialogo[1] = "Eu conheço esse peso...";
    _caixa.dialogo[2] = "...";
    _caixa.dialogo[3] = "O mundo acelera, o peito aperta e você sente que vai desabar a qualquer momento.";
    _caixa.dialogo[4] = "Não é só tristeza. É um vazio cinzento, tirando a cor de tudo que antes tinha graça.";
    _caixa.dialogo[5] = "Olha... Eu não tenho uma poção mágica para curar isso.";
    _caixa.dialogo[6] = "Mas sei de uma coisa: você não precisa carregar o mundo nas costas o tempo todo.";
    _caixa.dialogo[7] = "Se o próximo passo parecer grande demais agora... Foque no ar entrando e saindo do seu peito!!!";
    
    // Marca que o diálogo foi disparado
    dialogo_feito = true; 
}

// PASSO 2: SE O DIÁLOGO JÁ ACABOU (A CAIXA SUMIU), INICIA A RESPIRAÇÃO
if (dialogo_feito == true && !instance_exists(obj_caixa_texto)){
    if (!instance_exists(obj_respiracao)) {
        // CORREÇÃO AQUI: Mudado de "instances" para 'layer' dinâmico!
        instance_create_layer(0, 0, layer, obj_respiracao); 
    }
}