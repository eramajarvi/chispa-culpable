function [Irradiancia, TemperaturaAmbiente, VelocidadViento,...
    temperaturaPanel_NoIrrigation, Pgen_NoIrrigation, energiaNoBeneficio, ...
    razon_IrrigacionSBR, razon_NoIrrigation, tiempo, controlSBR, ...
    temperaturaPanelSBR, PbenSBR, energiaBeneficioSBR, PgenSBR] = dynamicProgamming_MainFunction(TemperaturaAmbiente_DiaActual, Irradiancia_DiaActual, VelocidadViento_DiaActual, d, IrrigacionSBR)

%PROGRAMACI�N DIN�MICA Crea los perfiles �ptimos de irrigaci�n de un panel
%FV a partir de los datos de entrada

%%
parameters; % Cargar parametros
deltaT = 60; % Delta de tiempo
N = 73; % Numero de pasos 12*60 + 1 (minutos)

%% Tiempos

% Los perfiles meteorol�gicos tienen una resoluci�n de 10 minutos durante
% un d�a, sin contar el primer y �ltimo paso de cada d�a

tiempo10min12h = 0:600:43200; % Vector de tiempo para un perfil de un d�a, con 73 pasos (43200 segundos en 12 horas)
tiempo = linspace(0, tiempo10min12h(end), N); % Vector de cantidad N entre 0 y longitud del vector del perfil de un d�a espaciados uniformemente

%% D�as
% Interpolacion de los datos importados
% Las variables al ser interpoladas tienen N datos

TemperaturaAmbiente = TemperaturaAmbiente_DiaActual; % Temperatura ambiente
Irradiancia = Irradiancia_DiaActual; % Irradiancia
VelocidadViento = VelocidadViento_DiaActual; % Veloicdad del viento

disp(strjoin({'Calculando perfil �ptimo para el d�a ', num2str(d), '...'}));

%% Programaci�n din�mica
calcIrrigationProfile;

disp(strjoin({'Perfil del d�a ', num2str(d), 'calculado'}));
fprintf('\n');

end

