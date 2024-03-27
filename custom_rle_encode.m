function encoded_data = custom_rle_encode(message)
    % Inicializa a variável para armazenar os dados codificados
    encoded_data = [];
    
    % Inicializa a variável para contar as repetições de cada valor
    count = 1;
    
    % Percorre a mensagem para codificação RLE
    for i = 1:length(message)
        % Verifica se o elemento atual é igual ao próximo
        if i < length(message) && message(i) == message(i+1)
            % Incrementa a contagem de repetições
            count = count + 1;
        else
            % Adiciona o par (contagem, valor) à mensagem codificada
            encoded_data = [encoded_data, count, message(i)];
            % Reinicia a contagem para o próximo valor
            count = 1;
        end
    end
end
