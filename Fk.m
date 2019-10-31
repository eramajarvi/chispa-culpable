function [Fk] = Fk(Tamb, Razon_var_noirri, vu, Razon_var_irri, deltaT, Tpanel)

Fk = max(Tamb, (Razon_var_noirri * (vu==0) + Razon_var_irri * (vu==15)) * deltaT + Tpanel);

end

