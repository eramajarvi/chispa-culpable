%%% Funcion principal
% Programación dinámica

clc; clear all; close all;

%% Cargar datos

% load ('nombredato.mat')

parameters                                                                 % Cargar parametros
deltaT = 60;                                                               % Delta de tiempo
N = 1441;                                                                  % Numero de pasos 24*60 + 1

%% Tiempos

% Los perfiles meteorologicos tienen una resolución de 10 minutos durante
% un día, sin contar el primer y último paso de cada día

tiempo10min24h = 0:600:85200;                                              % Vector de tiempo para un perfil de un día
tiempo = linspace(0, tiempo10min24h(end), N);                              % Vector de cantidad N entre 0 y longitud del vector del perfil de un día espaciados uniformemente

%% Días

% Descripción de esta sección
temperaturaAmbiente = interp1(tiempo10min24h, TemperaturaAmbiente_Dia1, tiempo); % Temperatura ambiente


%% Programación dinámica

