%% FUNCI�N PRINCIPAL PROGRAMACI�N DIN�MICA
% Modificada para llamar a una funci�n de forma iterativa y guardar los
% perfiles generados
tic
clc; clear all; close all;

%% Cargar datos
% Importa la matriz con los datos de todos los dias, llamada
% matricesDelArca.mat
% rutaCarga = '/MATLAB Drive/tangente-penitente';
rutaCarga = 'C:\Users\james\Documents\GitHub\tangente-penitente\';

% rutaGuardadoPerfiles = '/MATLAB Drive/tangente-penitente/perfiles';
rutaGuardadoPerfiles = 'C:\Users\james\Documents\GitHub\tangente-penitente\perfiles\';

load ([rutaCarga, 'MatricesDelArca.mat']);

posicion6AM = 36;
posicion6PM = 108;

% Carga de las predicciones de irrigacion dadas por Tangente Penitente
load([rutaCarga, 'control.mat']);

%%
fprintf('Total de dias: %d \n\n', size(Irradiancia_Matriz,1));
for i = 7 : 1 : 8
    % Perfiles de irrigacion predichos
    j = 1;
    IrrigacionDiaActual = controlIrrigacion(:, j).';
    IrrigacionDiaActual(IrrigacionDiaActual == 1 ) = 15;
    
    %% Invocar la programaci�n dinamica
    TemperaturaAmbiente_DiaActual = TemperaturaAmbiente_Matriz(i, [posicion6AM:posicion6PM]);
    Irradiancia_DiaActual = Irradiancia_Matriz(i, [posicion6AM:posicion6PM]);
    VelocidadViento_DiaActual = VelocidadViento_Matriz(i, [posicion6AM:posicion6PM]);

    [irradiancia, temperaturaAmbiente, velocidadViento,...
        control, temperaturaPanel, temperaturaPanel_NoIrrigation, Pben, ...
        Pgen_NoIrrigation, energiaBeneficio, energiaNoBeneficio, razon_Irrigacion, ...
        razon_NoIrrigation, tiempo, ...
        controlSBR, temperaturaPanelSBR, PbenSBR, energiaBeneficioSBR] = dynamicProgamming_MainFunction(...
        TemperaturaAmbiente_DiaActual, Irradiancia_DiaActual, VelocidadViento_DiaActual, i, IrrigacionDiaActual);

    %% Graficar datos
    graphProfiles(irradiancia, temperaturaAmbiente, velocidadViento, control, ...
        temperaturaPanel, temperaturaPanel_NoIrrigation, Pben, Pgen_NoIrrigation, ...
        energiaBeneficio, energiaNoBeneficio, i, tiempo, controlSBR, temperaturaPanelSBR, PbenSBR, energiaBeneficioSBR);

    numeroDia = i;
    
    %% Guardar datos
    
    nombreArchivo = [rutaGuardadoPerfiles, 'perfil_Dia', num2str(i)];

    save(nombreArchivo, 'irradiancia', 'temperaturaAmbiente', 'velocidadViento',...
        'control', 'temperaturaPanel', 'temperaturaPanel_NoIrrigation'...
        , 'Pben', 'Pgen_NoIrrigation', 'energiaBeneficio', 'energiaNoBeneficio'...
        , 'razon_Irrigacion', 'razon_NoIrrigation', 'tiempo');
    
    clear irradiancia temperaturaAmbiente velocidadViento control ...
        ejeTiempo ejeTiempo_b temperaturaPanel temperaturaPanel_NoIrrigation ...
        Pben Pgen_NoIrrigation energiaBeneficio energiaNoBeneficio razon_Irrigacion ...
        razon_NoIrrigation tiempo;
    
    j = j + 1;
end
toc