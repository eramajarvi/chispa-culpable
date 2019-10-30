function [var] = var(variacionTemperaturaPanel_NoIrrigation, uopt, variacionTemperaturaPanel_Irrigation, deltaT)

var = variacionTemperaturaPanel_NoIrrigation * (uopt == 0) + variacionTemperaturaPanel_Irrigation * (uopt == 15) * deltaT;
end

