%%% Funcion principal
% Programaci�n din�mica

clc; clear all; close all;

%% Cargar datos
% Se debe cambiar el n�mero del d�a que se va a usar como el d�a actual
load ('C:\Users\james\Documents\ShallowBayDEV\tangente-penitente\variablesEntrada.mat')

TemperaturaAmbiente_DiaActual = TemperaturaAmbiente_Dia1;
Irradiancia_DiaActual = Irradiancia_Dia1;
VelocidadViento_DiaActual = VelocidadViento_Dia1;

%%
parameters;                                                                % Cargar parametros
deltaT = 60;                                                               % Delta de tiempo
N = 1441;                                                                  % Numero de pasos 24*60 + 1

%% Tiempos

% Los perfiles meteorol�gicos tienen una resoluci�n de 10 minutos durante
% un d�a, sin contar el primer y �ltimo paso de cada d�a

tiempo10min24h = 0:600:85200;                                              % Vector de tiempo para un perfil de un d�a, con 143 pasos
tiempo = linspace(0, tiempo10min24h(end), N);                              % Vector de cantidad N entre 0 y longitud del vector del perfil de un d�a espaciados uniformemente

%% D�as

% Interpolacion de los datos importados
% Las variables al ser interpoladas tienen N datos
temperaturaAmbiente = interp1(tiempo10min24h, TemperaturaAmbiente_DiaActual, tiempo); % Temperatura ambiente
irradiancia = interp1(tiempo10min24h, Irradiancia_DiaActual, tiempo); % Irradiancia
velocidadViento = interp1(tiempo10min24h, VelocidadViento_DiaActual, tiempo); % Veloicdad del viento

%% Programaci�n din�mica
calcJmax;
calcIrrigationProfile;
graphProfile;

%% Guardar perfiles generados
% Guarda variables del espacio de trabajo en un archivo y guarda gr�ficas
% Se debe cambiar el n�mero del d�a que se va a usar como el d�a actual

% nombreArchivo = 'Perfil_Dia1';
% 
% save(nombreArchivo, 'irradiancia', 'temperaturaAmbiente', 'velocidadViento',...
%     'control', 'ejeTiempo', 'ejeTiempo_b', 'temperaturaPanel', 'temperaturaPanel_NoIrrigation'...
%     , 'Pben', 'Pgen_NoIrrigation', 'energiaBeneficio', 'energiaNoBeneficio'...
%     , 'razon_Irrigacion', 'razon_NoIrrigation');





