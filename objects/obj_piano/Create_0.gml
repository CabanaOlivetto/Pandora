// --- SISTEMA DE AVISO EM TELA ---
mostrar_aviso_quadro = false;
tempo_aviso_quadro = 0;

minigame_ativo = false;

sequencia_correta = ["M", "E", "D", "O"];
sequencia_jogador = array_create(0);

tecla_destacada = -1;  
tempo_destaque = 0;    
piscar_erro = false;   
tempo_erro = 0;        

// Configurações de tamanho (Garante que o Draw GUI encontre todas elas)
tecla_largura = 12;  
tecla_altura = 140;  
tecla_preta_largura = 8;
tecla_preta_altura = 85; // Certifique-se de usar este nome exato para não dar erro de "not set"

// Padrão do piano de 88 teclas
padrao_piano = ["W", "B", "W",
                "W", "B", "W", "B", "W", "W", "B", "W", "B", "W", "B", "W",
                "W", "B", "W", "B", "W", "W", "B", "W", "B", "W", "B", "W",
                "W", "B", "W", "B", "W", "W", "B", "W", "B", "W", "B", "W",
                "W", "B", "W", "B", "W", "W", "B", "W", "B", "W", "B", "W",
                "W", "B", "W", "B", "W", "W", "B", "W", "B", "W", "B", "W",
                "W", "B", "W", "B", "W", "W", "B", "W", "B", "W", "B", "W",
                "W", "B", "W", "B", "W", "W", "B", "W", "B", "W", "B", "W",
                "W"];