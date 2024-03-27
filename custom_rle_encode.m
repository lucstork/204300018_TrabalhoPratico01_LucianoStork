function encoded_data = custom_rle_encode(message)
    % Inicializa a vari�vel para armazenar os dados codificados
    encoded_data = [];
    
    % Inicializa a vari�vel para contar as repeti��es de cada valor
    count = 1;
    
    % Percorre a mensagem para codifica��o RLE
    for i = 1:length(message)
        % Verifica se o elemento atual � igual ao pr�ximo
        if i < length(message) && message(i) == message(i+1)
            % Incrementa a contagem de repeti��es
            count = count + 1;
        else
            % Adiciona o par (contagem, valor) � mensagem codificada
            encoded_data = [encoded_data, count, message(i)];
            % Reinicia a contagem para o pr�ximo valor
            count = 1;
        end
    end
end
