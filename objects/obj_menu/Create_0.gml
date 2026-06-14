estado = "menu_principal";
acao = "";
indice = 0;

// Montagem do menu principal
opcoes_menu = ["Novo Jogo"];
if (existe_algum_save()) {
    array_push(opcoes_menu, "Continuar");
}
array_push(opcoes_menu, "Configurar", "Sair");

opcoes_slot = ["Slot 1", "Slot 2", "Slot 3", "Voltar"];