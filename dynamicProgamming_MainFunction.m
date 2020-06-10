function [Irradiancia, TemperaturaAmbiente, VelocidadViento,...
    temperaturaPanel_NoIrrigation, Pgen_NoIrrigation, energiaNoBeneficio, ...
    razon_IrrigacionSBR, razon_NoIrrigation, tiempo, controlSBR, ...
    temperaturaPanelSBR, PbenSBR, energiaBeneficioSBR, PgenSBR] = dynamicProgamming_MainFunction(TemperaturaAmbiente_DiaActual, Irradiancia_DiaActual, VelocidadViento_DiaActual, d, IrrigacionSBR)

%PROGRAMACIÓN DINÁMICA Crea los perfiles óptimos de irrigación de un panel
%FV a partir de los datos de entrada

%%
parameters; % Cargar parametros
deltaT = 60; % Delta de tiempo
N = 73; % Numero de pasos 12*60 + 1 (minutos)

%% Tiempos

% Los perfiles meteorológicos tienen una resolución de 10 minutos durante
% un día, sin contar el primer y último paso de cada día

tiempo10min12h = 0:600:43200; % Vector de tiempo para un perfil de un día, con 73 pasos (43200 segundos en 12 horas)
tiempo = linspace(0, tiempo10min12h(end), N); % Vector de cantidad N entre 0 y longitud del vector del perfil de un día espaciados uniformemente

%% Días
% Interpolacion de los datos importados
% Las variables al ser interpoladas tienen N datos

TemperaturaAmbiente = TemperaturaAmbiente_DiaActual; % Temperatura ambiente
Irradiancia = Irradiancia_DiaActual; % Irradiancia
VelocidadViento = VelocidadViento_DiaActual; % Veloicdad del viento

disp(strjoin({'Calculando perfil óptimo para el día ', num2str(d), '...'}));

%% Programación dinámica
calcIrrigationProfile;

disp(strjoin({'Perfil del día ', num2str(d), 'calculado'}));
fprintf('\n');

end

