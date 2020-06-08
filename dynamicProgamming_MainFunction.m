function [irradiancia, temperaturaAmbiente, velocidadViento,...
    control, temperaturaPanel, temperaturaPanel_NoIrrigation, Pben, ...
    Pgen_NoIrrigation, energiaBeneficio, energiaNoBeneficio, razon_Irrigacion, ...
    razon_NoIrrigation, tiempo] = dynamicProgamming_MainFunction(TemperaturaAmbiente_DiaActual, Irradiancia_DiaActual, VelocidadViento_DiaActual, d)

%PROGRAMACION DINAMICA Crea los perfiles optimos de irrigacion de un panel
%FV a partir de los datos de entrada

%%
parameters; % Cargar parametros
deltaT = 60; % Delta de tiempo
N = 73; % Numero de pasos 12*60 + 1 (minutos)

%% Tiempos

% Los perfiles meteorologicos tienen una resolucion de 10 minutos durante
% un dia, sin contar el primer y ultimo paso de cada dia

tiempo10min12h = 0:600:43200; % Vector de tiempo para un perfil de un dia, con 73 pasos (43200 segundos en 12 horas)
tiempo = linspace(0, tiempo10min12h(end), N); % Vector de cantidad N entre 0 y longitud del vector del perfil de un dia espaciados uniformemente

%% Dis
% Interpolacion de los datos importados
% Las variables al ser interpoladas tienen N datos

temperaturaAmbiente = interp1(tiempo10min12h, TemperaturaAmbiente_DiaActual, tiempo); % Temperatura ambiente
irradiancia = interp1(tiempo10min12h, Irradiancia_DiaActual, tiempo); % Irradiancia
velocidadViento = interp1(tiempo10min12h, VelocidadViento_DiaActual, tiempo); % Veloicdad del viento

disp(strjoin({'Calculando perfil optimo para el dia ', num2str(d), '...'}));

%% Programacion dinamica
calcJmax;
calcIrrigationProfile;

%% Devolver datos procesados

irradiancia;
temperaturaAmbiente;
velocidadViento;

control;

temperaturaPanel;
temperaturaPanel_NoIrrigation;

Pben;
Pgen_NoIrrigation;

energiaBeneficio;
energiaNoBeneficio;

razon_Irrigacion;
razon_NoIrrigation;

disp(strjoin({'Perfil del dia ', num2str(d), 'calculado'}));
fprintf('\n');

end

