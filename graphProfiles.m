function [] = graphProfiles(irradiancia, temperaturaAmbiente, velocidadViento, i, tiempo)
%% Datos meteorologicos del d�a

tiempo10min12h = 0:600:43200;
N = 73;  

ejeTiempo = tiempo/60/60 + 6;
ejeTiempo_b = (linspace(0, tiempo10min12h(end), N-1))/60/60 + 6;

disp(strjoin({'Generando gr�ficas para el d�a ', num2str(i), '...'}));

%% Grafica de las variables b�sicas
% Irradiancia, Temperatura ambiente, Velocidad del viento
graphVariablesBasicas(ejeTiempo, [irradiancia, temperaturaAmbiente, velocidadViento], i);

%% Grafica de resultados de interes
% Potencia de irrigacion
% graphPotenciaIrrigacion(ejeTiempo_b, control, i)
% 
% % Temperatura del panel FV
% graphTemps(ejeTiempo, [temperaturaAmbiente; temperaturaPanel; temperaturaPanel_NoIrrigation], i);
% 
% % Potencia generada
% graphPotencias(ejeTiempo_b, [Pben; Pgen_NoIrrigation], i);
% 
% % Energ�a
% graphEnergia(ejeTiempo_b, [energiaBeneficio; energiaNoBeneficio], i);
% 
% disp(strjoin({'Gr�ficas del d�a ', num2str(i), 'generadas y guardadas'}));
% fprintf('\n \n');

end

