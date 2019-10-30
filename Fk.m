function [fk] = Fk(temperaturaAmbiente, variacionTemperaturaPanel_NoIrrigation, variacionTemperaturaPanel_Irrigation, deltaT, temperaturaPanel, vPotenciaIrrigacion)
% Descripci�n de la funci�n
    
    fk = max(temperaturaAmbiente, (variacionTemperaturaPanel_NoIrrigation * (vPotenciaIrrigacion == 0) + variacionTemperaturaPanel_Irrigation * (vPotenciaIrrigacion == 15)) * deltaT + temperaturaPanel);

end

