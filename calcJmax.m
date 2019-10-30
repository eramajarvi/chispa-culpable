%% Proceso de cálculo

vTemperaturaPanel = 20:0.1:80;                                             
vPotenciaIrrigacion = [0 15];                                              

Jmax = zeros(length(vTemperaturaPanel), N);                                
Uopt = zeros(length(vTemperaturaPanel), N-1);                              

Jmax(:, N) = 0 * vTemperaturaPanel;                                        

for k = N-1 : -1 : 1
    for i = 1:length(vTemperaturaPanel)
        
        temperaturaPanel = vTemperaturaPanel(i);   
        iterativeData;

        potenciaGenerada = areaPanel * eficienciaPanel * irradiancia_i .* (1 + b * (temperaturaPanel - 25));
        
        irrigation;
        noIrrigation;
        
       %% Llamado a funciones
        hk = h(potenciaGenerada_Irrigation, potenciaGenerada_NoIrrigation, potenciaGenerada, vPotenciaIrrigacion);
        xk = Fk(temperaturaAmbiente_i, variacionTemperaturaPanel_NoIrrigation, variacionTemperaturaPanel_Irrigation, deltaT, temperaturaPanel, vPotenciaIrrigacion);
        
        Jk1u = interp1(vTemperaturaPanel, Jmax(:, k + 1), xk);
        
        [maximo, pos] = max(hk + Jk1u);
        Jmax(i,k) = maximo;
        Uopt(i,k) = vPotenciaIrrigacion(pos);
        
    end
end

