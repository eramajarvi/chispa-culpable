%% Datos meteorologicos del día

ejeTiempo = tiempo/60/60 + 6;
ejeTiempo_b = (linspace(0, tiempo10min24h(end), N-1))/60/60 + 6;

% Irradiancia
graphIrradiancia(ejeTiempo, irradiancia, k);

% Temperatura ambiente
graphTemperaturaAmbiente(ejeTiempo, temperaturaAmbiente, k)

% Velocidad del viento
graphVelocidadViento(ejeTiempo, velocidadViento, k)

%% Potencia de irrigacion
graphPotenciaIrrigacion(ejeTiempo_b, control, k)

%% Temperatura del panel FV
graphTemps(ejeTiempo, [temperaturaAmbiente; temperaturaPanel; temperaturaPanel_NoIrrigation], k);

%% Potencia generada
graphPotencias(ejeTiempo_b, [Pben; Pgen_NoIrrigation], k);

%% Energía
graphEnergia(ejeTiempo_b, [energiaBeneficio; energiaNoBeneficio], k);