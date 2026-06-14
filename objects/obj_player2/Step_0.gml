// Avança o diálogo ao apertar a tecla E apenas se o diálogo estiver ativo
if (exibir_dialogo) {
    if (keyboard_check_pressed(ord("E"))) {
        // Se ainda houverem falas no array, passa para a próxima
        if (indice_fala < array_length(dialogo) - 1) {
            indice_fala += 1;
        } else {
            // Se era a última fala, encerra o diálogo!
            exibir_dialogo = false;
        }
    }
}