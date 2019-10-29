%% Definicion de parámetros

potenciaNominal = 250;                                                     % Potencia nominal del panel [W]
areaPanel = 1.6;                                                           % Área del panel [m^2]
eficienciaPanel = potenciaNominal/(areaPanel*1000);                        % Eficiencia del panel
b = -0.0043;                                                               % Coeficiente térmico [1/K]
a = 0.9;                                                                   % Coeficiente de transmitancia
capacidadTermica = 10140;                                                  % Capacidad térmica [J/m^2 - K]
sigma = 5.67e-8;                                                           % Coeficiente Stefan-Boltzmann [W/m^2 - K^4]
emitanciaFrontal = 0.9;                                                    % Emitancia frontal
emitanciaPosterior = 0.85;                                                 % Emitancia posterior
anguloInclinacion = 10*pi/180;                                             % Ángulo de inclinación [rad]
irradianciaMaxima = 1278;                                                  % Irradiancia máxima [W/m^2]

%% Factores de participación de la transferencia de calor por radiación

Ff1 = (1/2) * (1 + cos(pi - 10 * (pi/180)));
Ff2 = (1/2) * (1 - cos(pi - 10 * (pi/180)));

Fp1 = (1/2) * (1 + cos(10 * (pi/180)));
Fp2 = (1/2) * (1 - cos(10 * (pi/180)));

%% Parámetros del sistema de riego

resistenciaRiego = 0.00285;                                                % Resistencia de riego [W/°C]
emitanciaAgua = 0.9;                                                       % Emitancia del agua
resistenciaMezclado = resistenciaRiego/5;                                  % Resistencia de mezclado [W/°C]
volumenAguaRiego = 4.5;                                                    % Volumen de agua de riego [l/m]
capacidadEspecificaAgua = 4180;                                            % Capacidad específica [J/kg - K]
capacidadTermica = volumenAguaRiego * capacidadEspecificaAgua;             % Capacidad térmica [J/K]
coeficienteEnfriamentoCava = 3.5;                                          % Coeficiente enfriamiento dentro de la cava [°C/W]
coeficienteResistenciaEnfriamiento = 1/coeficienteEnfriamentoCava;         % Resistencia de enfriamiento [W/°C]
