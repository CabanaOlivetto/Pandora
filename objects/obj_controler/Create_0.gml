// Inicializa o mapa de progresso das fases
global.fases = ds_map_create();

// CONFIGURAÇÃO DOS TOTAIS DE CADA FASE
ds_map_add(global.fases, "Casa_total", 3);        


// Inicializa o progresso atual de cada uma em 0
ds_map_add(global.fases, "Casa_atual", 0);


// Controle se a sala atual já foi colorida (Começa em preto e branco)
cenario_colorido = false;