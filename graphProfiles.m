function [] = graphProfiles(irradiancia, temperaturaAmbiente, velocidadViento, ...
        temperaturaPanel_NoIrrigation, Pgen_NoIrrigation, ...
        energiaNoBeneficio, i, tiempo, controlSBR, temperaturaPanelSBR, PbenSBR, energiaBeneficioSBR)
    
%% Datos meteorologicos del d�a
% controlSBR, temperaturaPanelSBR, PbenSBR, energiaBeneficioSBR
tiempo10min12h = 0:600:43200;
N = 73;  

ejeTiempo = tiempo/60/60 + 6;
ejeTiempo_b = (linspace(0, tiempo10min12h(end), N-1))/60/60 + 6;

disp(strjoin({'Generando gr�ficas para el d�a ', num2str(i), '...'}));

%% Grafica de las variables b�sicas
% Irradiancia
graphIrradiancia(ejeTiempo, irradiancia, i);

% Temperatura ambiente
graphTemperaturaAmbiente(ejeTiempo, temperaturaAmbiente, i)

% Velocidad del viento
graphVelocidadViento(ejeTiempo, velocidadViento, i)

%% Grafica de resultados de interes 
% Potencia de irrigacion - Programacion dinamica
graphPotenciaIrrigacionSBR(ejeTiempo_b, controlSBR, i)

% Temperatura del panel FV (incluye SBR)
graphTemps(ejeTiempo, [temperaturaAmbiente; temperaturaPanelSBR; temperaturaPanel_NoIrrigation], i);

% Potencia generada (incluye SBR)
graphPotencias(ejeTiempo_b, [PbenSBR; Pgen_NoIrrigation], i);

% Energ�a (incluye SBR)
graphEnergia(ejeTiempo_b, [energiaBeneficioSBR; energiaNoBeneficio], i);

disp(strjoin({'Gr�ficas del d�a ', num2str(i), 'generadas y guardadas'}));
fprintf('\n \n');

end

