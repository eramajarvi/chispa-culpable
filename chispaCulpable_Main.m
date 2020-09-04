% CHISPA CULPABLE
% Archivo de ejecucion principal
% Debe ejecutarse este archivo para generar las graficas. Los datos deben
% cargarse respectivamente desde las rutas establecidas

tic
clc; clear all; close all;

% -------------------------------------------------------------------------
% Importar datos
% Importa la matriz con los datos de todos los dias
rutaCargaPD = 'C:\Users\James\Desktop\perfiles PD\';
rutaCargaTP = 'C:\Users\James\Documents\Github\tangente-penitente\perfilesSBR\Prueba 5\';

for i = 286 : 1 : 286

    load([rutaCargaPD, 'perfil_Dia', num2str(i)]);
    load([rutaCargaTP, 'perfil_Dia', num2str(i)]);
    
    t = tiempo/60/60 + 6;
    N = 73;
    
    tiempo10min12h = 0:600:43200;
    ejeTiempo_b = (linspace(0, tiempo10min12h(end), N-1))/60/60 + 6;

% -------------------------------------------------------------------------
% Generar las graficas
% Llamada a las funciones que generan las graficas

    graphVariablesBasicas(t, temperaturaAmbiente, irradiancia, velocidadViento)
    graphEnergia(ejeTiempo_b, [energiaBeneficioSBR; energiaBeneficio; energiaNoBeneficio], i);
    graphPotencias(ejeTiempo_b, [Pgen_NoIrrigation; PbenSBR; Pben]);
    graphPotenciaIrrigacion(ejeTiempo_b, controlSBR, ejeTiempo_b, control, i)
    
end
toc