% Trabalho Pratico 01;
% Processamento de audio e Video;
% Aluno: Luciano Stork, matricula 204300018.

clear; close all; clc;

% Carregar a imagem
imagem_original = imread('praia.jpg');

% Converter a imagem para tons de cinza
imagem_cinza = rgb2gray(imagem_original);

% Codificar a imagem usando a função custom_rle_encode
imagem_codificada = custom_rle_encode(imagem_cinza(:));

% Decodificar os dados codificados usando a função custom_rle_decode
imagem_decodificada = custom_rle_decode(imagem_codificada);

% Salvar os metadados em um arquivo de texto
metadados = struct();
metadados.Formato = 'RLE';
metadados.Largura = size(imagem_original, 2);
metadados.Altura = size(imagem_original, 1);
metadados.Tamanho_Comprimido = numel(imagem_codificada);
metadados.Taxa_Compressao = numel(imagem_original) / numel(imagem_decodificada);

% Converter os dados comprimidos em uma sequência de caracteres
dados_comprimidos_str = sprintf('%d,', imagem_codificada);
dados_comprimidos_str = dados_comprimidos_str(1:end-1); % Remover a vírgula final

% Escrever os metadados e os dados comprimidos no arquivo de texto
nome_arquivo_metadados = 'metadados.txt';
fid = fopen(nome_arquivo_metadados, 'w');
campos = fieldnames(metadados);
for i = 1:numel(campos)
    fprintf(fid, '%s: %s\n', campos{i}, num2str(metadados.(campos{i})));
end
fprintf(fid, 'Dados_Comprimidos: %s\n', dados_comprimidos_str);
fclose(fid);

% Exibir a imagem original e a imagem decodificada lado a lado para comparação
subplot(1, 2, 1);
imshow(imagem_original);
title('Imagem Original');

subplot(1, 2, 2);
imshow(uint8(reshape(imagem_decodificada, size(imagem_original, 1), size(imagem_original, 2))));
title('Imagem Decodificada');
