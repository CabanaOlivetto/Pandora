var tamanho_atual = array_length(sequencia_jogador);

// Se a última letra digitada estiver errada em relação à palavra "MEDO"
if (sequencia_jogador[tamanho_atual - 1] != sequencia_correta[tamanho_atual - 1]) {
    piscar_erro = true;
    tempo_erro = 45; 
    exit;
}

// Se digitou as 4 letras certas: VITÓRIA!
if (tamanho_atual == array_length(sequencia_correta)) {
    show_debug_message("Acertou a sequência MEDO!");
    
    // --- SISTEMA DE CONTADOR DO PROGRESSO ---
    if (variable_global_exists("fases")) {
        // Descobre o nome da sala atual (ex: "Casa", "Escola")
        var nome_fase = room_get_name(room);
        var chave_atual = nome_fase + "_atual";
        
        // Se a fase existir no seu mapa do obj_controler, adiciona +1 minigame concluído
        if (ds_map_exists(global.fases, chave_atual)) {
            var valor_antigo = ds_map_find_value(global.fases, chave_atual);
            ds_map_replace(global.fases, chave_atual, valor_antigo + 1);
            show_debug_message("Progresso atualizado para a fase: " + chave_atual);
        }
    }
    
    // Fecha o minigame
    minigame_ativo = false; 
}