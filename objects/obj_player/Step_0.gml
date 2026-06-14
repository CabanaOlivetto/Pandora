// --- TRAVA DO MINIGAME DO PIANO ---
if (instance_exists(obj_piano)) {
    if (obj_piano.minigame_ativo) {
        velh = 0; velv = 0;
        sprite_index = spr_warden_parado; image_index = 0; image_speed = 0;
        exit;
    }
}

// --- TRAVA PARA A CAMA ---
if (instance_exists(obj_cama)) {
    if (obj_cama.mostrar_texto_cama) {
        velh = 0; velv = 0;
        sprite_index = spr_warden_parado; image_index = 0; image_speed = 0;
        exit; 
    }
}



// --- SEU CÓDIGO NORMAL DE MOVIMENTAÇÃO COMEÇA AQUI ---
// Controler dos inputs
var _left, _right, _up, _down;

_left  = keyboard_check(inputs.left);
_right = keyboard_check(inputs.right);
_up    = keyboard_check(inputs.up);
_down  = keyboard_check(inputs.down);

// =========================================================================
// INJEÇÃO DA MECÂNICA: Inverte os botões se estiver na escola e ativado
if (room == Escola && variable_instance_exists(id, "controles_invertidos")) {
    if (controles_invertidos) {
        var _temp_left  = _left;
        var _temp_right = _right;
        var _temp_up    = _up;
        var _temp_down  = _down;
        
        _left  = _temp_right; // Esquerda vira Direita
        _right = _temp_left;  // Direita vira Esquerda
        _up    = _temp_down;  // Cima vira Baixo
        _down  = _temp_up;    // Baixo vira Cima
    }
}
// =========================================================================

// Cálculo da velocidade livre (Top-Down)
velh = (_right - _left) * vel;
velv = (_down - _up) * vel;

// CONTROLADOR DE SPRITES (4 DIREÇÕES)
if (velh != 0) {
    sprite_index = spr_player_andaD;
    image_xscale = sign(velh);
    image_speed = 1; 
} 
else if (velv < 0) {
    sprite_index = spr_andando_cima; 
    image_speed = 1;
} 
else if (velv > 0) {
    sprite_index = spr_andando_baixo; 
    image_speed = 1;
} 
else {
    image_speed = 0; 
    
    if (sprite_index == spr_player_andaD) {
        image_index = 0; 
    }
    else if (sprite_index == spr_andando_cima) {
        image_index = 0; 
    }
    else if (sprite_index == spr_andando_baixo) {
        sprite_index = spr_warden_parado;
        image_index = 0;
    }
}