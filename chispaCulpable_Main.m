%% FUNCI�N PRINCIPAL PROGRAMACI�N DIN�MICA
% Modificada para llamar a una funci�n de forma iterativa y guardar los
% perfiles generados
tic
clc; clear all; close all;

%% Cargar datos
% Importa la matriz con los datos de todos los dias, llamada
% matricesDelArca.mat

rutaCargaArca = 'C:\Users\james\Documents\GitHub\tangente-penitente\';
rutaCargaPerfiles = 'C:\Users\james\Documents\GitHub\chispa-culpable\perfiles\';
rutaGuardadoPerfilesSBR = 'C:\Users\james\Documents\GitHub\tangente-penitente\perfilesSBR\';

% Carga de las predicciones de irrigacion dadas por Tangente Penitente
load([rutaCargaArca, 'control.mat']);

%%
fprintf('Total de dias: %d \n\n', length(controlIrrigacion));

for i = 48 : 1 : 48
    % Perfiles de irrigacion predichos
    j = 1;
    IrrigacionDiaActual = controlIrrigacion(:, j).';
    IrrigacionDiaActual(IrrigacionDiaActual == 1 ) = 15;
    
    load([rutaCargaPerfiles, 'perfil_Dia', num2str(i), '.mat']);
    
    %% Invocar la programacion dinamica
    TemperaturaAmbiente_DiaActual = temperaturaAmbiente;
    Irradiancia_DiaActual = irradiancia;
    VelocidadViento_DiaActual = velocidadViento;

    [irradiancia, temperaturaAmbiente, velocidadViento,...
    temperaturaPanel_NoIrrigation, Pgen_NoIrrigation, energiaNoBeneficio, ...
    razon_IrrigacionSBR, razon_NoIrrigation, tiempo, controlSBR, ...
    temperaturaPanelSBR, PbenSBR, energiaBeneficioSBR, PgenSBR] = dynamicProgamming_MainFunction(...
        TemperaturaAmbiente_DiaActual, Irradiancia_DiaActual, VelocidadViento_DiaActual, i, IrrigacionDiaActual);

    %% Graficar datos
%     graphProfiles(irradiancia, temperaturaAmbiente, velocidadViento, ...
%         temperaturaPanel_NoIrrigation, Pgen_NoIrrigation, ...
%         energiaNoBeneficio, i, tiempo, controlSBR, temperaturaPanelSBR, PbenSBR, energiaBeneficioSBR);

    numeroDia = i;
    
    %% Guardar datos
    nombreArchivo = [rutaGuardadoPerfilesSBR, 'perfil_Dia', num2str(i)];

    save(nombreArchivo, 'irradiancia', 'temperaturaAmbiente', 'velocidadViento', ...
    'temperaturaPanel_NoIrrigation', 'Pgen_NoIrrigation', 'energiaNoBeneficio', ...
    'razon_IrrigacionSBR', 'razon_NoIrrigation', 'tiempo', 'controlSBR', ...
    'temperaturaPanelSBR', 'PbenSBR', 'energiaBeneficioSBR', 'PgenSBR');
    
    clear irradiancia temperaturaAmbiente velocidadViento...
    temperaturaPanel_NoIrrigation Pgen_NoIrrigation energiaNoBeneficio ...
    razon_IrrigacionSBR razon_NoIrrigation tiempo controlSBR ...
    temperaturaPanelSBR PbenSBR energiaBeneficioSBR PgenSBR;
    
    j = j + 1;
end
toc