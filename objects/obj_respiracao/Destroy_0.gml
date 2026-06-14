// Esse evento roda sempre que o objeto some da tela
if (instance_exists(obj_vulto)) {
    var _npc = instance_nearest(obj_player.x, obj_player.y, obj_vulto);
    if (_npc != noone) {
        // SE O JOGADOR FALHOU (A respiração chegou nos limites de 0 ou 100)
        if (respiracao_atual <= 0 || respiracao_atual >= 100) {
            _npc.dialogo_feito = false; // Permite que o NPC fale e dê outra chance
            _npc.minigame_vencido = false;
        }
    }
}