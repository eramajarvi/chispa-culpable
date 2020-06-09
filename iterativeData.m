%% Procesamiento de datos necesarios en varias iteraciones
temperaturaAmbiente_i = temperaturaAmbiente(k);
irradiancia_i = irradiancia(k);
velocidadViento_i = velocidadViento(k);

temperaturaAguaRiego = temperaturaAmbiente_i; % Temperatura del agua de riego y cava
irradianciaPanel = areaPanel * irradiancia_i; % Irradiancia sobre el panel FV
temperaturaCielo = 0.0552 * temperaturaAmbiente_i.^1.5; % Temperatura del cielo
nubosidad = 1 - (temperaturaAmbiente_i./ irradianciaMaxima); % Nubosidad
        
temperaturaCieloC = (1 - nubosidad) .* temperaturaCielo + temperaturaAmbiente_i .* nubosidad; % Temperatura del cielo corregida
coeficienteConveccionNoIrrigacion = -0.5345 * velocidadViento_i.^2 + velocidadViento_i.*9.5819 + 2.25; % Coeficiente de convecci�n no irrigaci�n
coeficienteConvectivoAgua = areaPanel * (28.53 * velocidadViento_i + 93.094); % Coeficiente de convecci�n en la pel�cula de agua
        
irradianciaEfectivaPanel = irradianciaPanel * a; % Irradiancia efectiva sobre el panel FV