%% FUNCI�N PRINCIPAL PROGRAMACI�N DIN�MICA
% Modificada para llamar a una funci�n de forma iterativa y guardar los
% perfiles generados
tic
clc; clear all; close all;

%% Cargar datos
% Importa la matriz con los datos de todos los dias, llamada
% matricesDelArca.mat

rutaCarga = 'C:\Users\james\Documents\GitHub\tangente-penitente\';

rutaGuardadoPerfiles = 'C:\Users\james\Documents\GitHub\tangente-penitente\perfiles\';

load ([rutaCarga, 'MatricesDelArca.mat']);

% Carga de las predicciones de irrigacion dadas por Tangente Penitente
load([rutaCarga, 'control.mat']);

%%
fprintf('Total de dias: %d \n\n', size(Irradiancia_Matriz,1));
for i = 19 : 1 : 19
    % Perfiles de irrigacion predichos
    j = 1;
    IrrigacionDiaActual = controlIrrigacion(:, j).';
    IrrigacionDiaActual(IrrigacionDiaActual == 1 ) = 15;
    
    %% Invocar la programacion dinamica
    TemperaturaAmbiente_DiaActual = TemperaturaAmbiente_Matriz(i, :);
    Irradiancia_DiaActual = Irradiancia_Matriz(i, :);
    VelocidadViento_DiaActual = VelocidadViento_Matriz(i, :);

    [irradiancia, temperaturaAmbiente, velocidadViento,...
    temperaturaPanel_NoIrrigation, Pgen_NoIrrigation, energiaNoBeneficio, ...
    razon_IrrigacionSBR, razon_NoIrrigation, tiempo, controlSBR, ...
    temperaturaPanelSBR, PbenSBR, energiaBeneficioSBR] = dynamicProgamming_MainFunction(...
        TemperaturaAmbiente_DiaActual, Irradiancia_DiaActual, VelocidadViento_DiaActual, i, IrrigacionDiaActual);

    %% Graficar datos
    graphProfiles(irradiancia, temperaturaAmbiente, velocidadViento, ...
        temperaturaPanel_NoIrrigation, Pgen_NoIrrigation, ...
        energiaNoBeneficio, i, tiempo, controlSBR, temperaturaPanelSBR, PbenSBR, energiaBeneficioSBR);

    numeroDia = i;
    
    %% Guardar datos
    nombreArchivo = [rutaGuardadoPerfiles, 'perfil_Dia', num2str(i)];

    save(nombreArchivo, 'irradiancia', 'temperaturaAmbiente', 'velocidadViento', ...
    'temperaturaPanel_NoIrrigation', 'Pgen_NoIrrigation', 'energiaNoBeneficio', ...
    'razon_IrrigacionSBR', 'razon_NoIrrigation', 'tiempo', 'controlSBR', ...
    'temperaturaPanelSBR', 'PbenSBR', 'energiaBeneficioSBR');
    
    clear irradiancia temperaturaAmbiente velocidadViento...
    temperaturaPanel_NoIrrigation Pgen_NoIrrigation energiaNoBeneficio ...
    razon_IrrigacionSBR razon_NoIrrigation tiempo controlSBR ...
    temperaturaPanelSBR PbenSBR energiaBeneficioSBR;
    
    j = j + 1;
end
toc