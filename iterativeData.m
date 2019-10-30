%% Procesamiento de datos necesarios en varias iteraciones
temperaturaAmbiente_i = temperaturaAmbiente(k);
irradiancia_i = irradiancia(k);
velocidadViento_i = velocidadViento(k);

temperaturaAguaRiego = temperaturaAmbiente_i;
irradianciaPanel = areaPanel * irradiancia_i;
temperaturaCielo = 0.0552 * temperaturaAmbiente_i.^1.5;
nubosidad = 1 - (temperaturaAmbiente_i./ irradianciaMaxima);
        
temperaturaCieloC = (1 - nubosidad).*temperaturaCielo + temperaturaAmbiente_i.*nubosidad;
coeficienteConveccionNoIrrigacion = -0.5345 * velocidadViento_i.^2 + velocidadViento_i.*9.5819 + 2.25;
coeficienteConvectivoAgua = areaPanel * (28.53 * velocidadViento_i + 93.094);
        
irradianciaEfectivaPanel = irradianciaPanel * a;