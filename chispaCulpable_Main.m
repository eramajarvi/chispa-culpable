%%% FUNCIÓN PRINCIPAL PROGRAMACIÓN DINÁMICA
% Modificada para llamar a una función de forma iterativa y guardar los
% perfiles generados

clc; clear all; close all;

%% Cargar datos
% Importa la matriz con los datos de todos los días
load ('C:\Users\james\Documents\ShallowBayDEV\tangente-penitente\MatricesDelArca.mat')

%%

for i = 1 : 1 : size(Irradiancia_Matriz, 1)
    
    %% Invocar la programación dinámica
    TemperaturaAmbiente_DiaActual = TemperaturaAmbiente_Matriz(i, [36:108]);
    Irradiancia_DiaActual = Irradiancia_Matriz(i, [36:108]);
    VelocidadViento_DiaActual = VelocidadViento_Matriz(i, [36:108]);

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

    nombreArchivo = ['perfil_Dia', num2str(i)];

    save(nombreArchivo, 'irradiancia', 'temperaturaAmbiente', 'velocidadViento',...
        'control', 'temperaturaPanel', 'temperaturaPanel_NoIrrigation'...
        , 'Pben', 'Pgen_NoIrrigation', 'energiaBeneficio', 'energiaNoBeneficio'...
        , 'razon_Irrigacion', 'razon_NoIrrigation', 'tiempo');
    
    clear irradiancia temperaturaAmbiente velocidadViento control ...
        ejeTiempo ejeTiempo_b temperaturaPanel temperaturaPanel_NoIrrigation ...
        Pben Pgen_NoIrrigation energiaBeneficio energiaNoBeneficio razon_Irrigacion ...
        razon_NoIrrigation tiempo;
end