// --- 1. CONFIGURAÇÃO DA CÂMERA DINÂMICA ---
if (room == Casa) {
    // Câmera segue o jogador na Casa
    camera_set_view_target(view_camera[0], id);
    camera_set_view_border(view_camera[0], 240, 135); // Metade de 480x270
} 
else if (room == Cafeteria) {
    // Câmera segue o jogador na Cafeteria
    camera_set_view_target(view_camera[0], id);
    camera_set_view_border(view_camera[0], 320, 180); // Metade de 640x360 (Menos zoom)
}


// --- 2. CONTROLE DE ESCALA DO PERSONAGEM ---
if (room == Casa) { 
    // Configurações de tamanho exclusivas da Casa
    image_xscale = 1.5; 
    image_yscale = 1.5;
} 
else if (room == Cafeteria) {
    // Configurações de tamanho exclusivas da Cafeteria
    // Como tiramos o zoom da câmera nesta sala, você pode ajustar esses números
    // para mais ou para menos se quiser equilibrar o tamanho do boneco na tela!
    image_xscale = 3; 
    image_yscale = 3;
} 
else {
    // Escola e qualquer outro cenário do jogo mantêm o tamanho padrão (100%)
    image_xscale = 1; 
    image_yscale = 1;
}