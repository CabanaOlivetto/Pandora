// --- VARIÁVEIS DE INTERAÇÃO ---
minigame_vencido = false;
dialogo_feito = false;
jogando = false; 

// --- VARIÁVEIS DA LANTERNA (INTERFACE) ---
senha_escondida_x = 450; 
senha_escondida_y = 300;
raio_descoberta = 60; 

tempo_focado = 0;
tempo_necessario = 60; 

alpha_tela = 0; // Evita o erro do Draw_64 line 5!
ganhou = false;

global.melodia_correta = [1, 5, 6, 4];