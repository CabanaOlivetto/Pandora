// Se por acaso o array de diálogo estiver vazio, se destrói por segurança
if (array_length(dialogo) == 0) {
    global.controle_travado = false;
    instance_destroy();
    exit;
}

// Pega o texto completo da página atual
var _texto_completo = dialogo[pagina];

// Efeito de máquina de escrever
if (caractere_atual < string_length(_texto_completo)) {
    caractere_atual += velocidade_texto;
}

// Quando o jogador apertar E para avançar
if (keyboard_check_pressed(vk_space)) {
    keyboard_clear(vk_space); // Limpa o espaço para não dar conflito
    
    // Se ainda estiver digitando, pula direto para o final da frase
    if (caractere_atual < string_length(_texto_completo)) {
        caractere_atual = string_length(_texto_completo);
    } 
    // Se a frase já terminou de ser digitada por completo...
    else {
        // Se ainda houver mais páginas de diálogo, avança para a próxima
        if (pagina < array_length(dialogo) - 1) {
            pagina++;
            caractere_atual = 0; 
        } 
        // --- SE ERA A ÚLTIMA FRASE, APENAS FECHA ---
        else {
            // Se você quiser que o controle destrave por padrão:
            global.controle_travado = false; 
            
            instance_destroy();
        }
    }
}