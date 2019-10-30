%%% Funcion principal
% Programación dinámica

clc; clear all; close all;

%% Cargar datos

% load ('nombredato.mat')
%% borrar:
load ('Dia1_12horas.mat') % borrar
TemperaturaAmbiente_Dia1 = Tamb;
Irradiancia_Dia1 = Gin;
VelocidadViento_Dia1 = vel;

%%
parameters                                                                 % Cargar parametros
deltaT = 60;                                                               % Delta de tiempo
%N = 1441;                                                                  % Numero de pasos 24*60 + 1
N = 721; % borrar
%% Tiempos

% Los perfiles meteorologicos tienen una resolución de 10 minutos durante
% un día, sin contar el primer y último paso de cada día

tiempo10min24h = 0:300:43200; % borrar
%tiempo10min24h = 0:600:85200;                                             % Vector de tiempo para un perfil de un día
tiempo = linspace(0, tiempo10min24h(end), N);                              % Vector de cantidad N entre 0 y longitud del vector del perfil de un día espaciados uniformemente

%% Días

% Descripción de esta sección
temperaturaAmbiente = interp1(tiempo10min24h, TemperaturaAmbiente_Dia1, tiempo); % Temperatura ambiente
irradiancia = interp1(tiempo10min24h, Irradiancia_Dia1, tiempo);
velocidadViento = interp1(tiempo10min24h, VelocidadViento_Dia1, tiempo);

%% Programación dinámica
calcJmax;
calcIrrigationProfile;
