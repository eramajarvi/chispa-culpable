%% Sistema de irrigaci�n SBR activo
temperaturaPanelSBR(1) = 23;                                                  % Temperatura inicial del panel FV con sistema de irrigaci�n SBR activo

% C�lculo de temperatura
for k = 1 : 1 : N - 1
    iterativeData;
    
    potenciaGeneradaSBR = areaPanel * eficienciaPanel * irradiancia_i .* (1 + b * (temperaturaPanelSBR(k) - 25));
    
    variacionTemperaturaPanel_IrrigationSBR = (irradianciaEfectivaPanel - ...
        potenciaGeneradaSBR - (sigma * areaPanel * emitanciaPosterior * Fp1 * ...
        ((temperaturaPanelSBR(k) + 273).^4 - (temperaturaAmbiente_i + 273).^4) ...
        + sigma * areaPanel * emitanciaPosterior * Fp2 * ((temperaturaPanelSBR(k) + 273).^4 ...
        - (temperaturaCieloC + 273).^4)) - (areaPanel * coeficienteConveccionNoIrrigacion .* ...
        (temperaturaPanelSBR(k) - temperaturaAmbiente_i)) - ((temperaturaPanelSBR(k) ...
        - temperaturaAguaRiego)/resistenciaRiego)) / (areaPanel * capacidadTermica_k);
    
    variacionTemperaturaPanel_NoIrrigationSBR = (irradianciaEfectivaPanel - ...
        potenciaGeneradaSBR - (sigma * areaPanel * (emitanciaFrontal * Ff1 + ...
        emitanciaPosterior * Fp1) * ((temperaturaPanelSBR(k) + 273).^4 - ...
        (temperaturaAmbiente_i + 273).^4) + sigma * areaPanel * ...
        (emitanciaFrontal * Ff2 + emitanciaPosterior * Fp2) * ...
        ((temperaturaPanelSBR(k) + 273).^4 - (temperaturaCieloC ...
        + 273).^4)) - (areaPanel * coeficienteConveccionNoIrrigacion .* ...
        (temperaturaPanelSBR(k) - temperaturaAmbiente_i) + areaPanel ...
        * coeficienteConveccionNoIrrigacion .* (temperaturaPanelSBR(k)...
        - temperaturaAmbiente_i)))/(areaPanel *capacidadTermica_k);
    
    irriga = Irrigacion;
    
    temperaturaPanelSBR(k + 1) = Fk(temperaturaAmbiente_i, variacionTemperaturaPanel_NoIrrigationSBR, irriga, variacionTemperaturaPanel_IrrigationSBR, deltaT, temperaturaPanelSBR(k));
    controlSBR(k) = irriga;
    PgenSBR(k) = potenciaGeneradaSBR;
    PbenSBR(k) = potenciaGeneradaSBR - irriga;
    razon_IrrigacionSBR(k + 1) = var(variacionTemperaturaPanel_NoIrrigationSBR, irriga, variacionTemperaturaPanel_IrrigationSBR, deltaT);
end

controlSBR = (controlSBR > 0) * 15;

%% Sistema de irrigacion inactivo
temperaturaPanel_NoIrrigation(1) = 23;                                     % Temperatura inicial del panel FV con sistema de irrigaci�n inactivo

% C�lculo de temperatura
for k = 1: 1: N - 1
    
    iterativeData;
    potenciaGenerada = areaPanel * eficienciaPanel * irradiancia_i .* (1 + b *(temperaturaPanel_NoIrrigation(k) - 25));
    
    variacionTemperaturaPanel_NoIrrigation = (irradianciaEfectivaPanel - ...
        potenciaGenerada - (sigma * areaPanel * (emitanciaFrontal * Ff1 + ...
        emitanciaPosterior * Fp1) * ((temperaturaPanel_NoIrrigation(k) + 273).^4 ... 
        - (temperaturaAmbiente_i + 273).^4) + sigma * areaPanel * ...
        (emitanciaFrontal * Ff2 + emitanciaPosterior * Fp2) * ...
        ((temperaturaPanel_NoIrrigation(k) + 273).^4 - (temperaturaCieloC + 273).^4)) ...
        - (areaPanel * coeficienteConveccionNoIrrigacion .* (temperaturaPanel_NoIrrigation(k) ...
        - temperaturaAmbiente_i) + areaPanel * coeficienteConveccionNoIrrigacion ...
        .* (temperaturaPanel_NoIrrigation(k) - temperaturaAmbiente_i)))/...
        (areaPanel * capacidadTermica_k);
    
    uopt = 0;
    
    temperaturaPanel_NoIrrigation(k + 1) = Fk(temperaturaAmbiente_i, variacionTemperaturaPanel_NoIrrigation, uopt, 0, deltaT, temperaturaPanel_NoIrrigation(k));
    Pgen_NoIrrigation(k) = potenciaGenerada;
    razon_NoIrrigation(k + 1) = var(variacionTemperaturaPanel_NoIrrigation, uopt, 0, deltaT);
    
end

%% Energia
% Irrigacion SBR activa
energiaBeneficioSBR(1) = 0;

for k = 2:1:N-1
    
    energiaBeneficioSBR(k) = energiaBeneficioSBR(k - 1) + PbenSBR(k - 1) * deltaT/3600/1000;
    
end

% Irrigacion inactiva
energiaNoBeneficio(1) = 0;

for k = 2:1:N-1
    
    energiaNoBeneficio(k) = energiaNoBeneficio(k-1) + Pgen_NoIrrigation(k - 1) * deltaT/3600/1000;
    
end

% Corrigiendo un problema de escala
energiaBeneficioSBR = energiaBeneficioSBR  * 10;
energiaNoBeneficio = energiaNoBeneficio * 10;
