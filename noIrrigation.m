%% Sistema de irrigacion no activo

%% Radiacion frontal
transferenciaCalor_RadiacionFrontal_1_NoIrrigation = sigma * areaPanel * emitanciaFrontal * Ff1 * ((temperaturaPanel + 273).^4 - (temperaturaAmbiente_i + 273).^4);
transferenciaCalor_RadiacionFrontal_2_NoIrrigation = sigma * areaPanel * emitanciaFrontal * Ff2 * ((temperaturaPanel + 273).^4 - (temperaturaCieloC + 273).^4);

transferenciaCalor_RadiacionFrontal_NoIrrigation = transferenciaCalor_RadiacionFrontal_1_NoIrrigation + transferenciaCalor_RadiacionFrontal_2_NoIrrigation;

%% Radiacion posterior
transferenciaCalor_RadiacionPosterior_1_NoIrrigation = sigma * areaPanel * emitanciaPosterior * Fp1 * ((temperaturaPanel + 273).^4 - (temperaturaAmbiente_i + 273).^4);
transferenciaCalor_RadiacionPosterior_2_NoIrrigation = sigma * areaPanel * emitanciaPosterior * Fp2 * ((temperaturaPanel + 273).^4 - (temperaturaCieloC + 273).^4);

transferenciaCalor_RadiacionPosterior_NoIrrigation = transferenciaCalor_RadiacionPosterior_1_NoIrrigation + transferenciaCalor_RadiacionPosterior_2_NoIrrigation;

%% Conveccion - REVISAR
transferenciaCalor_ConveccionFrontal_NoIrrigation = areaPanel * coeficienteConveccionNoIrrigacion .* (temperaturaPanel - temperaturaAmbiente_i);
transferenciaCalor_ConveccionPosterior_NoIrrigation = areaPanel * coeficienteConveccionNoIrrigacion .* (temperaturaPanel - temperaturaAmbiente_i);

%% Totales
transferenciaCalor_RadiacionTotal_NoIrrigation = transferenciaCalor_RadiacionFrontal_NoIrrigation + transferenciaCalor_RadiacionPosterior_NoIrrigation;

transferenciaCalor_ConveccionTotal_NoIrrigation = transferenciaCalor_ConveccionFrontal_NoIrrigation + transferenciaCalor_ConveccionPosterior_NoIrrigation;

variacionTemperaturaPanel_NoIrrigation = (irradianciaEfectivaPanel - potenciaGenerada - transferenciaCalor_RadiacionTotal_NoIrrigation - transferenciaCalor_ConveccionTotal_NoIrrigation)/(areaPanel * capacidadTermica_k);

temperaturaOperacionPanel_NoIrrigation = variacionTemperaturaPanel_NoIrrigation * deltaT + temperaturaPanel;

potenciaGenerada_NoIrrigation = areaPanel * eficienciaPanel * irradiancia_i .* (1 + b * (temperaturaOperacionPanel_NoIrrigation - 25));
