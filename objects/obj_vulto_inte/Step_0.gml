// Verifica se o objeto do player existe na sala
if (instance_exists(obj_player)) {
    
    // Calcula a distancia ate o player
    var distancia = distance_to_object(obj_player);
    
    // Se estiver perto e pressionar a tecla 'E'
    if (distancia < 40 && keyboard_check_pressed(ord("E"))) {
        // Inverte o estado (se estiver aberto, fecha; se estiver fechado, abre)
        exibir_texto = !exibir_texto;
        
        // Se acabou de abrir e nunca foi explorado antes...
        if (exibir_texto && !ja_explorado) {
            ja_explorado = true; // Marca para nunca mais pontuar este objeto
            
            // ALTERADO: Avisa o controlador correto (obj_controle_escola)
            if (instance_exists(obj_controle_escola)) {
                
                // ALTERADO: A nova missão começa testando o estado_missao igual a 0
                if (obj_controle_escola.estado_missao == 0) {
                    
                    // ALTERADO: Usa a variável certa de contagem (objetos_feitos)
                    obj_controle_escola.objetos_feitos += 1;
                    
                    // ALTERADO: Se atingiu a meta (6 objetos), avança a missão para o estado 1
                    if (obj_controle_escola.objetos_feitos >= obj_controle_escola.objetos_total) {
                        obj_controle_escola.estado_missao = 1;
                    }
                }
            }
        }
    }
    
    // Se o player se afastar da mesa, a caixa fecha automaticamente
    if (distancia >= 40) {
        exibir_texto = false;
    }
}