// Se o controlador da empresa existir na sala, ele manda na cor
if (instance_exists(obj_controlador_hud)) {
    if (!obj_controlador_hud.escritorio_colorido) {
        shader_set(sh_preto_e_branco);
    }
} else {
    // Nas outras salas normais, usa o sistema padrão de antes
    if (!cenario_colorido) {
        shader_set(sh_preto_e_branco);
    }
}