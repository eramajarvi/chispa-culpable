function [] = graphProfiles(irradiancia, temperaturaAmbiente, velocidadViento, control, temperaturaPanel, temperaturaPanel_NoIrrigation, Pben, Pgen_NoIrrigation, energiaBeneficio, energiaNoBeneficio, i, tiempo, controlSBR, temperaturaPanelSBR, PbenSBR, energiaBeneficioSBR)
%% Datos meteorologicos del día
% controlSBR, temperaturaPanelSBR, PbenSBR, energiaBeneficioSBR
tiempo10min12h = 0:600:43200;
N = 721;  

ejeTiempo = tiempo/60/60 + 6;
ejeTiempo_b = (linspace(0, tiempo10min12h(end), N-1))/60/60 + 6;

disp(strjoin({'Generando gráficas para el día ', num2str(i), '...'}));

%% Grafica de las variables básicas
% Irradiancia
graphIrradiancia(ejeTiempo, irradiancia, i);

% Temperatura ambiente
graphTemperaturaAmbiente(ejeTiempo, temperaturaAmbiente, i)

% Velocidad del viento
graphVelocidadViento(ejeTiempo, velocidadViento, i)

%% Grafica de resultados de interes 
% Potencia de irrigacion - Programacion dinamica
graphPotenciaIrrigacion(ejeTiempo_b, control, i)
graphPotenciaIrrigacionSBR(ejeTiempo_b, controlSBR, i)

% Temperatura del panel FV (incluye SBR)
graphTemps(ejeTiempo, [temperaturaAmbiente; temperaturaPanel; temperaturaPanel_NoIrrigation; temperaturaPanelSBR], i);

% Potencia generada (incluye SBR)
graphPotencias(ejeTiempo_b, [Pben; Pgen_NoIrrigation; PbenSBR], i);

% Energía (incluye SBR)
graphEnergia(ejeTiempo_b, [energiaBeneficio; energiaNoBeneficio; energiaBeneficioSBR], i);

disp(strjoin({'Gráficas del día ', num2str(i), 'generadas y guardadas'}));
fprintf('\n \n');

end

