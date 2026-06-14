// sh_preto_e_branco.fsh
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 texColor = texture2D(gm_BaseTexture, v_vTexcoord);
    
    // Calcula a luminosidade (média ponderada dos canais RGB)
    float gray = dot(texColor.rgb, vec3(0.299, 0.587, 0.114));
    
    // Aplica o tom de cinza mantendo o canal Alpha (transparência) original
    gl_FragColor = v_vColour * vec4(gray, gray, gray, texColor.a);
}