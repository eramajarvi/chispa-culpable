temperaturaPanel(1) = 23;                                                  % Temperatura inicial del panel FV con sistema de irrigaci�n activo

%% Sistema de irrigaci�n activo
% C�lculo de temperatura
for k = 1 : 1 : N - 1
    iterativeData;
    
    potenciaGenerada = areaPanel * eficienciaPanel * irradiancia_i .* (1 + b * (temperaturaPanel - 25));
    
    % variacionTemperaturaPanel_Irrigation =
end

