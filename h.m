function [h] = h(potenciaGenerada_Irrigation, potenciaGenerada_NoIrrigation, potenciaGenerada, vPotenciaIrrigacion)
% Descripcion de la funci�n

    h = [(potenciaGenerada_NoIrrigation + potenciaGenerada)/2 - vPotenciaIrrigacion(1), (potenciaGenerada_Irrigation + potenciaGenerada)/2 - vPotenciaIrrigacion(2)];

end

