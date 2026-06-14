if (estado == "menu_principal") {
    if (keyboard_check_pressed(vk_up)) indice--;
    if (keyboard_check_pressed(vk_down)) indice++;
    indice = clamp(indice, 0, array_length(opcoes_menu) - 1);
    
    if (keyboard_check_pressed(vk_enter)) {
        var _sel = opcoes_menu[indice];
        if (_sel == "Novo Jogo") {
            acao = "novo";
            estado = "escolher_slot";
            indice = 0;
        } else if (_sel == "Continuar") {
            acao = "continuar";
            estado = "escolher_slot";
            indice = 0;
        } else if (_sel == "Sair") {
            game_end();
        }
    }
} else if (estado == "escolher_slot") {
    if (keyboard_check_pressed(vk_up)) indice--;
    if (keyboard_check_pressed(vk_down)) indice++;
    indice = clamp(indice, 0, array_length(opcoes_slot) - 1);
    
    if (keyboard_check_pressed(vk_enter)) {
        if (opcoes_slot[indice] == "Voltar") {
            estado = "menu_principal";
            indice = 0;
        } else {
            var _slot = indice + 1;
            if (acao == "novo") {
                show_debug_message("Novo Jogo no slot " + string(_slot));
               room_goto(Cidade);
            } else if (acao == "continuar") {
                var _dados = carregar_jogo(_slot);
                if (_dados != undefined) {
                    show_debug_message("Carregando slot " + string(_slot));
                    room_goto(Cidade);
                }
            }
        }
    }
}

// Se o jogador apertar a tecla F11
if (keyboard_check_pressed(vk_f11)) {
    // Se estiver em tela cheia, muda para janela. Se estiver em janela, muda para tela cheia.
    if (window_get_fullscreen()) {
        window_set_fullscreen(false);
    } else {
        window_set_fullscreen(true);
    }
}