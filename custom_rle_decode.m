function decoded_data = custom_rle_decode(encoded_data)
    % Inicializa a variável para armazenar os dados decodificados
    decoded_data = [];
    
    % Percorre a mensagem codificada para decodificação RLE
    for i = 1:2:length(encoded_data)
        % Extrai o par (contagem, valor) da mensagem codificada
        count = encoded_data(i);
        value = encoded_data(i+1);
        
        % Adiciona 'count' vezes o 'value' aos dados decodificados
        decoded_data = [decoded_data, repmat(value, 1, count)];
    end
end
