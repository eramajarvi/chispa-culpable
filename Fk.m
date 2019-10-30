function [fk] = Fk(temperaturaAmbiente, variacionTemperaturaPanel_NoIrrigation, vPotenciaIrrigacion, variacionTemperaturaPanel_Irrigation, deltaT, temperaturaPanel)
    
    fk = max(temperaturaAmbiente, (variacionTemperaturaPanel_NoIrrigation * (vPotenciaIrrigacion == 0) + variacionTemperaturaPanel_Irrigation * (vPotenciaIrrigacion == 15)) * deltaT + temperaturaPanel);

end

