if (instance_exists(obj_player)) {
    // Procura o vulto do tipo 3 mais próximo do jogador
    var _vulto_perto = instance_nearest(obj_player.x, obj_player.y, obj_vulto3);
    
    if (_vulto_perto != noone) {
        // Calcula a distância até esse vulto
        var _distancia = point_distance(obj_player.x, obj_player.y, _vulto_perto.x, _vulto_perto.y);
        
        // Se estiver perto do refeitório, ativa e recarrega o tempo (60 frames = 1 segundo)
        if (_distancia < 150) {
            tempo_confusao = 180; // Dá 3 segundos de efeito garantidos para ele conseguir andar
        }
    }
    
    // Gerencia o cronômetro do efeito
    if (tempo_confusao > 0) {
        tempo_confusao -= 1; // Diminui o tempo a cada frame
        
        obj_player.controles_invertidos = true;
        exibir_aviso_confusao = true;
    } else {
        // Quando o tempo acabar, limpa o efeito completamente
        obj_player.controles_invertidos = false;
        exibir_aviso_confusao = false;
    }
}
// Verifica se o jogador já interagiu com os 5 vultos iniciais
if (estado_missao == 0 && objetos_feitos >= objetos_total) {
    estado_missao = 1; // Libera a mesa do diretor!
}

// 1. Avança do estado 0 para o estado 1 quando interagir com os 5 vultos
if (estado_missao == 0 && objetos_feitos >= objetos_total) {
    estado_missao = 1; 
}

// 2. Se a missão foi concluída (estado 2), garante que o cenário fique colorido
if (estado_missao == 2) {
    escritorio_colorido = true;
}