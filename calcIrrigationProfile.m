%% Sistema de irrigaci�n activo
temperaturaPanel(1) = 23;                                                  % Temperatura inicial del panel FV con sistema de irrigaci�n activo

% C�lculo de temperatura
for k = 1 : 1 : N - 1
    iterativeData;
    
    potenciaGenerada = areaPanel * eficienciaPanel * irradiancia_i .* (1 + b * (temperaturaPanel(k) - 25));
    
    variacionTemperaturaPanel_Irrigation = (irradianciaEfectivaPanel - ...
        potenciaGenerada - (sigma * areaPanel * emitanciaPosterior * Fp1 * ...
        ((temperaturaPanel(k) + 273).^4 - (temperaturaAmbiente_i + 273).^4) ...
        + sigma * areaPanel * emitanciaPosterior * Fp2 * ((temperaturaPanel(k) + 273).^4 ...
        - (temperaturaCieloC + 273).^4)) - (areaPanel * coeficienteConveccionNoIrrigacion .* ...
        (temperaturaPanel(k) - temperaturaAmbiente_i)) - ((temperaturaPanel(k) ...
        -temperaturaAguaRiego)/resistenciaRiego)) / (areaPanel * capacidadTermica_k);
    
    variacionTemperaturaPanel_NoIrrigation = (irradianciaEfectivaPanel - ...
        potenciaGenerada - (sigma * areaPanel * (emitanciaFrontal * Ff1 + ...
        emitanciaPosterior * Fp1) * ((temperaturaPanel(k) + 273).^4 - ...
        (temperaturaAmbiente_i + 273).^4) + sigma * areaPanel * ...
        (emitanciaFrontal * Ff2 + emitanciaPosterior * Fp2) * ...
        ((temperaturaPanel(k) + 273).^4 - (temperaturaCieloC ...
        + 273).^4)) - (areaPanel * coeficienteConveccionNoIrrigacion .* ...
        (temperaturaPanel(k) - temperaturaAmbiente_i) + areaPanel ...
        * coeficienteConveccionNoIrrigacion .* (temperaturaPanel(k)...
        - temperaturaAmbiente_i)))/(areaPanel *capacidadTermica_k);
    
    irriga = IrrigacionSBR(k);
    
    temperaturaPanelSBR(k + 1) = Fk(temperaturaAmbiente_i, variacionTemperaturaPanel_NoIrrigationSBR, irriga, variacionTemperaturaPanel_IrrigationSBR, deltaT, temperaturaPanelSBR(k));
    controlSBR(k) = irriga;
    PgenSBR(k) = potenciaGeneradaSBR;
    PbenSBR(k) = potenciaGeneradaSBR - IrrigacionSBR(k);
    razon_IrrigacionSBR(k + 1) = var(variacionTemperaturaPanel_NoIrrigationSBR, irriga, variacionTemperaturaPanel_IrrigationSBR, deltaT);
end

control = (control > 0) * 15;

%% Sistema de irrigaci�n inactivo
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
energiaBeneficio(1) = 0;

for k = 2:1:N-1
    
    energiaBeneficio(k) = energiaBeneficio(k - 1) + Pben(k - 1) * deltaT/3600/1000;
    
end

energiaNoBeneficio(1) = 0;

for k = 2:1:N-1
    
    energiaNoBeneficio(k) = energiaNoBeneficio(k-1) + Pgen_NoIrrigation(k - 1) * deltaT/3600/1000;
    
end
