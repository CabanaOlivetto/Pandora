// Impede que o texto seja desenhado quando o jogador estiver na sala principal "Cidade"
if (room != Cidade) {
    
    // Descobre automaticamente o nome em texto da sala atual (Ex: "Casa", "Escola")
    var _nome_fase = room_get_name(room);
    var _chave_atual = _nome_fase + "_atual";
    var _chave_total = _nome_fase + "_total";
    
    // O GameMaker só vai desenhar se a sala atual tiver uma contagem configurada no Create
    if (global.fases != undefined && ds_map_exists(global.fases, _chave_atual)) {
        var _atual = ds_map_find_value(global.fases, _chave_atual);
        var _total = ds_map_find_value(global.fases, _chave_total);
        
        // Configura a fonte e a cor do texto da interface
        draw_set_font(fnt_dialogo);
        draw_set_color(c_white);
        draw_set_halign(fa_right);
        draw_set_valign(fa_top);
        
        // Desenha no canto superior direito da tela
        var _texto_progresso = "Minigames: " + string(_atual) + " / " + string(_total);
        draw_text(display_get_gui_width() - 32, 32, _texto_progresso);
        
        // Se o jogador completou todas as tarefas daquela sala específica
        if (_atual >= _total) {
            draw_text(display_get_gui_width() - 32, 60, "FASE CONCLUÍDA!");
        }
    }
}