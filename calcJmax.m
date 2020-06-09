%% Proceso de cálculo

vTemperaturaPanel = 20:0.1:80; % Vector de temperatura del panel FV                                       
vPotenciaIrrigacion = [0 15]; % Vector de la potencia de irrigación

Jmax = zeros(length(vTemperaturaPanel), N); % Matriz de costo óptimo                            
Uopt = zeros(length(vTemperaturaPanel), N-1); % Matriz de control óptimo

Jmax(:, N) = 0 * vTemperaturaPanel; % Valor final de la matriz de costo óptimo                 

for k = N-1 : -1 : 1
    for i = 1:length(vTemperaturaPanel)
        
        temperaturaPanel = vTemperaturaPanel(i);   
        iterativeData;

        potenciaGenerada = areaPanel * eficienciaPanel * irradiancia_i .* (1 + b * (temperaturaPanel - 25));
        
        irrigation; % Cálculos de temperatura, potencia generada cuando el panel está irrigado
        noIrrigation; % Cálculos de temperatura, potencia generada cuando el panel no está irrigado
        
       %% Llamado a funciones
        hk = h(potenciaGenerada_Irrigation, potenciaGenerada_NoIrrigation, potenciaGenerada, vPotenciaIrrigacion); % Funcion objetivo Potencia beneficio = potencia generada - potencia irrigación
        xk = Fk(temperaturaAmbiente_i, variacionTemperaturaPanel_NoIrrigation, vPotenciaIrrigacion, variacionTemperaturaPanel_Irrigation, deltaT, temperaturaPanel);
        
        Jk1u = interp1(vTemperaturaPanel, Jmax(:, k + 1), xk); % Costo óptimo del siguiente estado
        
        [maximo, pos] = max(hk + Jk1u);
        Jmax(i,k) = maximo; % Jmax en cada punto
        Uopt(i,k) = vPotenciaIrrigacion(pos); % Uopt en cada punto
        
    end
end

