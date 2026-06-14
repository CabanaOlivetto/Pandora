// Avança o texto ao apertar E
if (keyboard_check_pressed(ord("E"))) {
    // Se ainda houver frases no array, vai para a próxima página
    if (pagina < array_length(dialogo) - 1) {
        pagina++;
    } else {
        // Se as frases acabaram, limpa o clique do teclado
        io_clear(); 
        
        // Atualiza a missão no controlador para o Computador Principal
        if (instance_exists(obj_controlador_hud)) {
            if (obj_controlador_hud.estado_missao == 1) {
                obj_controlador_hud.estado_missao = 2;
            }
        }
        
        // Destrói a caixa de texto
        instance_destroy();
    }
}