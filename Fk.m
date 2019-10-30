function [fk] = Fk(temperaturaAmbiente, variacionTemperaturaPanel_NoIrrigation, variacionTemperaturaPanel_Irrigation, deltaT, temperaturaPanel, vPotenciaIrrigacion)
    
    fk = max(temperaturaAmbiente, (variacionTemperaturaPanel_NoIrrigation * (vPotenciaIrrigacion == 0) + variacionTemperaturaPanel_Irrigation * (vPotenciaIrrigacion == 15)) * deltaT + temperaturaPanel);

end

