%% FUNCI�N PRINCIPAL PROGRAMACION DINAMICA
% Modificada para llamar a una funcion de forma iterativa y guardar los
% perfiles generados

tic
clc; clear all; close all;

%% Cargar datos
% Importa la matriz con los datos de todos los dias
rutaCarga = 'C:\Users\james\Documents\GitHub\tangente-penitente\';
rutaGuardadoPerfiles = 'C:\Users\james\Documents\GitHub\chispa-culpable\perfiles\';

load ([rutaCarga, 'MatricesDelArca.mat']);

%%
fprintf('Total de dias: %d \n\n', size(Irradiancia_Matriz, 1));

for i = 1 : 1 : size(Irradiancia_Matriz, 1)
    
    %% Invocar la programacion dinamica
    TemperaturaAmbiente_DiaActual = TemperaturaAmbiente_Matriz(i, :);
    Irradiancia_DiaActual = Irradiancia_Matriz(i, :);
    VelocidadViento_DiaActual = VelocidadViento_Matriz(i, :);

    [irradiancia, temperaturaAmbiente, velocidadViento,...
        control, temperaturaPanel, temperaturaPanel_NoIrrigation, Pben, ...
        Pgen_NoIrrigation, energiaBeneficio, energiaNoBeneficio, razon_Irrigacion, ...
        razon_NoIrrigation, tiempo] = dynamicProgamming_MainFunction(...
        TemperaturaAmbiente_DiaActual, Irradiancia_DiaActual, VelocidadViento_DiaActual, i);

    %% Graficar datos
    graphProfiles(irradiancia, temperaturaAmbiente, velocidadViento, control, ...
        temperaturaPanel, temperaturaPanel_NoIrrigation, Pben, Pgen_NoIrrigation, ...
        energiaBeneficio, energiaNoBeneficio, i, tiempo);
    
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
end
toc