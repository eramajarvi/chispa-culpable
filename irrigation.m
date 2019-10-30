%% Sistema de irrigación activo

factorEnfriamiento_Irrigation = (temperaturaPanel - temperaturaAguaRiego)/resistenciaRiego;

%% Transferencia de calor por radiación
% Frontal
transferenciaCalor_RadiacionFrontal_1_Irrigation = 0;
transferenciaCalor_RadiacionFrontal_2_Irrigation = 0;
transferenciaCalor_RadiacionFrontal_Irrigation = transferenciaCalor_RadiacionFrontal_1_Irrigation + transferenciaCalor_RadiacionFrontal_2_Irrigation;
% Posterior
transferenciaCalor_RadiacionPosterior_1_Irrigation = sigma * areaPanel * emitanciaPosterior * Fp1 * ((temperaturaPanel + 273).^4 - (temperaturaAmbiente_i + 273).^4);
transferenciaCalor_RadiacionPosterior_2_Irrigation = sigma * areaPanel * emitanciaPosterior * Fp2 * ((temperaturaPanel + 273).^4 - (temperaturaCieloC + 273).^4);
transferenciaCalor_RadiacionPosterior_Irrigation = transferenciaCalor_RadiacionPosterior_1_Irrigation + transferenciaCalor_RadiacionPosterior_2_Irrigation;
% Total
transferenciaCalor_RadiacionTotal_Irrigation = transferenciaCalor_RadiacionFrontal_Irrigation + transferenciaCalor_RadiacionPosterior_Irrigation;

%% Transferencia de calor por convección
% Frontal
transferenciaCalor_ConveccionFrontal_Irrigation = 0;
% Posterior
transferenciaCalor_ConveccionPosterior_Irrigation = areaPanel * coeficienteConveccionNoIrrigacion .* (temperaturaPanel - temperaturaAmbiente_i);
% Total
transferenciaCalor_ConveccionTotal_Irrigation = transferenciaCalor_ConveccionFrontal_Irrigation + transferenciaCalor_ConveccionPosterior_Irrigation;

%% Totales
variacionTemperaturaPanel_Irrigation = (irradianciaEfectivaPanel - potenciaGenerada - transferenciaCalor_RadiacionTotal_Irrigation - transferenciaCalor_ConveccionTotal_Irrigation - factorEnfriamiento_Irrigation) / (areaPanel * capacidadTermica_k);

temperaturaOperacionPanel_Irrigation = variacionTemperaturaPanel_Irrigation * deltaT + temperaturaPanel;

potenciaGenerada_Irrigation = areaPanel * eficienciaPanel * irradiancia_i .* (1 + b * (temperaturaOperacionPanel_Irrigation - 25));