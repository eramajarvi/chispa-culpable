%% Datos meteorologicos del día

ejeTiempo = tiempo/60/60 + 6;
ejeTiempo_b = (linspace(0, tiempo10min24h(end), N-1))/60/60 + 6;

% Irradiancia
graphIrradiancia(ejeTiempo, irradiancia)

% Temperatura ambiente
graphTemperaturaAmbiente(ejeTiempo, temperaturaAmbiente)

% Velocidad del viento
graphVelocidadViento(ejeTiempo, velocidadViento)

%% Potencia de irrigacion
graphPotenciaIrrigacion(ejeTiempo_b, control)

%% Temperatura del panel FV
graphTemps(ejeTiempo, [temperaturaAmbiente; temperaturaPanel; temperaturaPanel_NoIrrigation]);

%% Potencia generada
graphPotencias(ejeTiempo_b, [Pben; Pgen_NoIrrigation]);

%% Energía
graphEnergia(ejeTiempo_b, [energiaBeneficio; energiaNoBeneficio]);