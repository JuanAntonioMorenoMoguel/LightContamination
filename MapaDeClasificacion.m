% Script para calcular el mapa de clasificacion
clear;
clc;

% Ruta del dataset
base_origin_path = fullfile(pwd, 'res');

disp(['Ruta absoluta del dataset: ', base_origin_path]);

particiones = 5
% Recorrer cada año y mes
for year = 2023:2023
    for month = 12:12
        % Crear la ruta completa del archivo
        month_folder = sprintf('%02d', month);
        origin_path = fullfile(base_origin_path, num2str(year), month_folder, 'banda_nir_filtrada.png');

        if exist(origin_path, 'file')
          img = imread(origin_path);
          img = round((img*particiones)/256);

          % Generar histograma
          figure;
          hist(img(:), 'BinLimits', [0, 255], 'BinWidth', 1);
          xlabel('Nivel de Gris');
          ylabel('Frecuencia');
          title('Histograma del Nivel de Gris');
        else
            fprintf('Imagen no encontrada: %s\n', origin_path);
        end
    end
end
