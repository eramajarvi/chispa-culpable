%% FUNCION PRINCIPAL PROGRAMACION DINAMICA

tic
clc; clear all; close all;

%% Cargar datos
% Importa la matriz con los datos de todos los dias
rutaCargaPD = 'C:\Users\James\Desktop\perfiles PD\';
rutaCargaTP = 'C:\Users\James\Documents\Github\tangente-penitente\perfilesSBR\Prueba 5\';

for i = 93 : 1 : 93

    load([rutaCargaPD, 'perfil_Dia', num2str(i)]);
    load([rutaCargaTP, 'perfil_Dia', num2str(i)]);
    
    t = tiempo/60/60 + 6;
    N = 73;
    tiempo10min12h = 0:600:43200;
    ejeTiempo_b = (linspace(0, tiempo10min12h(end), N-1))/60/60 + 6;
    
    %% Graficar datos
    graphVariablesBasicas(t, temperaturaAmbiente, t, irradiancia, velocidadViento)
    graphEnergia(ejeTiempo_b, [energiaBeneficioSBR; energiaBeneficio; energiaNoBeneficio]);
    graphPotencias(ejeTiempo_b, [Pgen_NoIrrigation; PbenSBR; Pben]);
    graphPotenciaIrrigacion(ejeTiempo_b, controlSBR)
end
toc