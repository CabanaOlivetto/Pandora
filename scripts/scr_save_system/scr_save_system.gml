// Função para salvar dados
function salvar_jogo(_slot, _dados_struct) {
    var _nome_arquivo = "save" + string(_slot) + ".json";
    var _string = json_stringify(_dados_struct);
    var _buffer = buffer_create(string_byte_length(_string) + 1, buffer_fixed, 1);
    buffer_write(_buffer, buffer_string, _string);
    buffer_save(_buffer, _nome_arquivo);
    buffer_delete(_buffer);
}

// Função para carregar dados
function carregar_jogo(_slot) {
    var _nome_arquivo = "save" + string(_slot) + ".json";
    if (file_exists(_nome_arquivo)) {
        var _buffer = buffer_load(_nome_arquivo);
        var _string = buffer_read(_buffer, buffer_string);
        buffer_delete(_buffer);
        return json_parse(_string);
    }
    return undefined;
}

// Função para verificar se algum save existe
function existe_algum_save() {
    return (file_exists("save1.json") || file_exists("save2.json") || file_exists("save3.json"));
}