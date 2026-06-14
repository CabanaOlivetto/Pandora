// Esse código roda quando o jogador consegue ficar na zona verde pelo tempo do alarme!

// --- 1. REGISTRA A VITÓRIA NO CONTROLADOR GLOBAL ---
var _nome_fase = room_get_name(room);
var _chave_atual = _nome_fase + "_atual";

if (global.fases != undefined && ds_map_exists(global.fases, _chave_atual)) {
    var _completos = ds_map_find_value(global.fases, _chave_atual);
    ds_map_replace(global.fases, _chave_atual, _completos + 1);
    show_debug_message("Progresso em " + _nome_fase + " atualizado para: " + string(_completos + 1));
}

// --- 2. AVISA O NPC VULTO ESPECÍFICO ---
if (instance_exists(obj_vulto) && instance_exists(obj_player)) {
    // Procura o vulto mais próximo do jogador e marca como vencido definitivamente
    var _npc = instance_nearest(obj_player.x, obj_player.y, obj_vulto);
    if (_npc != noone) {
        _npc.minigame_vencido = true;
        _npc.dialogo_feito = true;
        _npc.minigame_iniciado = false; // Garante que a trava interna do vulto resete também
    }
}

// --- 3. FINALIZA O MINIGAME ---
global.controle_travado = false; // Libera o jogador para voltar a andar
instance_destroy();              // Remove o minijogo de respiração da tela