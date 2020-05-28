%% Sistema de irrigación activo
temperaturaPanel(1) = 23;                                                  % Temperatura inicial del panel FV con sistema de irrigación activo

% Cálculo de temperatura
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
    
    uopt = interp1(vTemperaturaPanel, Uopt(:, k), temperaturaPanel(k));

    temperaturaPanel(k + 1) = Fk(temperaturaAmbiente_i, variacionTemperaturaPanel_NoIrrigation, uopt, variacionTemperaturaPanel_Irrigation, deltaT, temperaturaPanel(k));
    control(k) = uopt;
    Pgen(k) = potenciaGenerada;
    Pben(k) = potenciaGenerada - uopt;
    razon_Irrigacion(k + 1) = var(variacionTemperaturaPanel_NoIrrigation, uopt, variacionTemperaturaPanel_Irrigation, deltaT);
end

%% Sistema de irrigación SBR activo
temperaturaPanelSBR(1) = 23;                                                  % Temperatura inicial del panel FV con sistema de irrigación SBR activo

% Cálculo de temperatura
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
    
    irriga = IrrigacionSBR(k);
    
    temperaturaPanelSBR(k + 1) = Fk(temperaturaAmbiente_i, variacionTemperaturaPanel_NoIrrigationSBR, irriga, variacionTemperaturaPanel_IrrigationSBR, deltaT, temperaturaPanelSBR(k));
    controlSBR(k) = irriga;
    PgenSBR(k) = potenciaGeneradaSBR;
    PbenSBR(k) = potenciaGeneradaSBR - irriga;
    razon_IrrigacionSBR(k + 1) = var(variacionTemperaturaPanel_NoIrrigation, irriga, variacionTemperaturaPanel_IrrigationSBR, deltaT);
end

control = (control > 0) * 15;

%% Sistema de irrigación inactivo
temperaturaPanel_NoIrrigation(1) = 23;                                     % Temperatura inicial del panel FV con sistema de irrigación inactivo

% Cálculo de temperatura
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
% Irrigacion activa
energiaBeneficio(1) = 0;

for k = 2:1:N-1
    
    energiaBeneficio(k) = energiaBeneficio(k - 1) + Pben(k - 1) * deltaT/3600/1000;
    
end

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

