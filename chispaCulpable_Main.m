%% FUNCI�N PRINCIPAL PROGRAMACI�N DIN�MICA
% Modificada para llamar a una funci�n de forma iterativa y guardar los
% perfiles generados

tic
clc; clear all; close all;

%% Cargar datos
% Importa la matriz con los datos de todos los d�as
% rutaCarga = '/MATLAB Drive/tangente-penitente';
rutaCarga = 'C:\Users\james\Documents\GitHub\tangente-penitente\';

rutaGuardadoPerfiles = 'C:\Users\james\Documents\GitHub\tangente-penitente\perfiles\';

load ([rutaCarga, 'MatricesDelArca.mat']);

posicion6AM = 36;
posicion6PM = 108;

%%
fprintf('Total de dias: %d \n\n', size(Irradiancia_Matriz,1));
for i = 1 : 1 : size(Irradiancia_Matriz, 1)
    
    %% Invocar la programaci�n din�mica
    TemperaturaAmbiente_DiaActual = TemperaturaAmbiente_Matriz(i, [posicion6AM:posicion6PM]);
    Irradiancia_DiaActual = Irradiancia_Matriz(i, [posicion6AM:posicion6PM]);
    VelocidadViento_DiaActual = VelocidadViento_Matriz(i, [posicion6AM:posicion6PM]);

    [irradiancia, temperaturaAmbiente, velocidadViento,...
        control, temperaturaPanel, temperaturaPanel_NoIrrigation, Pben, ...
        Pgen_NoIrrigation, energiaBeneficio, energiaNoBeneficio, razon_Irrigacion, ...
        razon_NoIrrigation, tiempo] = dynamicProgamming_MainFunction(...
        TemperaturaAmbiente_DiaActual, Irradiancia_DiaActual, VelocidadViento_DiaActual, i);

    %% Graficar datos
    graphProfiles(irradiancia, temperaturaAmbiente, velocidadViento, control, ...
        temperaturaPanel, temperaturaPanel_NoIrrigation, Pben, Pgen_NoIrrigation, ...
        energiaBeneficio, energiaNoBeneficio, i, tiempo);

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
end
toc