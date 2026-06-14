// Só cria a caixa se ela já não existir e se o diálogo ainda não tiver sido feito
if (!instance_exists(obj_caixa_vulto) && dialogo_feito == false) {
    
    // Cria o objeto da caixa e guarda a ID dela na variável _caixa
    var _caixa = instance_create_layer(0, 0, layer, obj_caixa_vulto);
    
    // Alimenta o array de textos da caixa criada
    _caixa.dialogo[0] = "Ainda na primeira parte do relatório? Eu passei na sua mesa na hora do almoço e achei que essa demanda já estaria no meu e-mail.";
    _caixa.dialogo[1] = "Bate na mesa...!! impaciente — Todo mundo aqui tem demandas altas. Isso se chama mercado de trabalho.";
    _caixa.dialogo[2] = "Eu não tenho tempo para o seu drama emocional agora. Resiliência é uma competência básica para quem quer crescer nesta empresa";
    _caixa.dialogo[3] = "Eu me importo com os resultados. E os resultados dependem desse relatório pronto.";
    _caixa.dialogo[4] = "Quero isso na minha mesa na segunda-feira, impreterivelmente às 8h. Bom fim de semana.";
    _caixa.dialogo[5] = "Vira as costas e sai andando.";
   
    // Bloqueia para não reativar o diálogo enquanto fala ou após terminar
    dialogo_feito = true; 
}