function [irradiancia, temperaturaAmbiente, velocidadViento,...
    control, temperaturaPanel, temperaturaPanel_NoIrrigation, Pben, ...
    Pgen_NoIrrigation, energiaBeneficio, energiaNoBeneficio, razon_Irrigacion, ...
    razon_NoIrrigation, tiempo] = dynamicProgamming_MainFunction(TemperaturaAmbiente_DiaActual, Irradiancia_DiaActual, VelocidadViento_DiaActual, d)
%PROGRAMACI�N DIN�MICA Crea los perfiles �ptimos de irrigaci�n de un panel
%FV a partir de los datos de entrada

%%
parameters;                                                                % Cargar parametros
deltaT = 60;                                                               % Delta de tiempo
N = 721;                                                                   % Numero de pasos 12*60 + 1 (minutos)

%% Tiempos

% Los perfiles meteorol�gicos tienen una resoluci�n de 10 minutos durante
% un d�a, sin contar el primer y �ltimo paso de cada d�a

tiempo10min12h = 0:600:43200;                                              % Vector de tiempo para un perfil de un d�a, con 73 pasos (segundos)
tiempo = linspace(0, tiempo10min12h(end), N);                              % Vector de cantidad N entre 0 y longitud del vector del perfil de un d�a espaciados uniformemente

%% D�as
% Interpolacion de los datos importados
% Las variables al ser interpoladas tienen N datos


temperaturaAmbiente = interp1(tiempo10min12h, TemperaturaAmbiente_DiaActual, tiempo); % Temperatura ambiente
irradiancia = interp1(tiempo10min12h, Irradiancia_DiaActual, tiempo); % Irradiancia
velocidadViento = interp1(tiempo10min12h, VelocidadViento_DiaActual, tiempo); % Veloicdad del viento

disp(strjoin({'Calculando perfil �ptimo para el d�a ', num2str(d), '...'}));

%% Programaci�n din�mica
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

disp(strjoin({'Perfil del d�a ', num2str(d), 'calculado'}));
fprintf('\n');

end

