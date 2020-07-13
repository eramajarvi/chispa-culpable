%% Proceso de calculo

vTemperaturaPanel = 20:0.1:80;                                             % Vector de temperatura del panel FV                                       
vPotenciaIrrigacion = [0 15];                                              % Vector de la potencia de irrigaci�n

Jmax = zeros(length(vTemperaturaPanel), N);                                % Matriz de costo �ptimo                            
Uopt = zeros(length(vTemperaturaPanel), N-1);                              % Matriz de control �ptimo

Jmax(:, N) = 0 * vTemperaturaPanel;                                        % Valor final de la matriz de costo �ptimo                 

for k = N-1 : -1 : 1
    for i = 1:length(vTemperaturaPanel)
        
        temperaturaPanel = vTemperaturaPanel(i);   
        iterativeData;

        potenciaGenerada = areaPanel * eficienciaPanel * irradiancia_i .* (1 + b * (temperaturaPanel - 25));
        
        irrigation;                                                        % C�lculos de temperatura, potencia generada cuando el panel est� irrigado
        noIrrigation;                                                      % C�lculos de temperatura, potencia generada cuando el panel no est� irrigado
        
       %% Llamado a funciones
        hk = h(potenciaGenerada_Irrigation, potenciaGenerada_NoIrrigation, potenciaGenerada, vPotenciaIrrigacion); % Funcion objetivo Potencia beneficio = potencia generada - potencia irrigaci�n
        xk = Fk(temperaturaAmbiente_i, variacionTemperaturaPanel_NoIrrigation, vPotenciaIrrigacion, variacionTemperaturaPanel_Irrigation, deltaT, temperaturaPanel);
        
        Jk1u = interp1(vTemperaturaPanel, Jmax(:, k + 1), xk);             % Costo �ptimo del siguiente estado
        
        [maximo, pos] = max(hk + Jk1u);
        Jmax(i,k) = maximo;                                                % Jmax en cada punto
        Uopt(i,k) = vPotenciaIrrigacion(pos);                              % Uopt en cada punto
        
    end
end

