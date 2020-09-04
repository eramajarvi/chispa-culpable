function graphPotenciaIrrigacion(X1, Y1, X2, Y2)
%CREATEFIGURE(X1, Y1)
%  X1:  stairs x
%  Y1:  stairs y
N = 720;
X1 = (linspace(0, 43200, N))/60/60 + 6;

Y1_Temp = zeros(1, 720);
Y1_Temp(1:10:720) = Y1;
Y1 = Y1_Temp;

% Create figure
figure1 = figure;
% figure1 = figure('WindowState','maximized');

% Create subplot
subplot1 = subplot(2,1,1,'Parent',figure1);
hold(subplot1,'on');

% Create stairs
stairs(X1,Y1,'Parent',subplot1,'Color',[0 0 0]);

% Create ylabel
ylabel('Potencia irrigación SBR [W]');

% Create xlabel
xlabel('Tiempo [horas]');

% Create title
title('Potencia de irrigación - SBR');

box(subplot1,'on');
grid(subplot1,'on');
% Set the remaining axes properties
set(subplot1,'FontName','Humanst521 BT','GridColor',[0 0 0],'GridLineStyle',...
    '--','XMinorGrid','on','YMinorGrid','on');

% Create subplot
subplot2 = subplot(2,1,2,'Parent',figure1);
hold(subplot2,'on');

% Create stairs
stairs(X2,Y2,'Parent',subplot2,'Color',[0 0 0]);

% Create ylabel
ylabel('Potencia irrigación PD [W]');

% Create xlabel
xlabel('Tiempo [horas]');

% Create title
title('Potencia de irrigación');

box(subplot2,'on');
grid(subplot2,'on');
% Set the remaining axes properties
set(subplot2,'FontName','Humanst521 BT','GridColor',[0 0 0],'GridLineStyle',...
    '--','XMinorGrid','on','YMinorGrid','on');

% Guardar graficas
ruta = 'C:\Users\james\Documents\GitHub\tangente-penitente\graficas\SBR\';

nombreArchivo = [ruta, 'graphPotenciaIrrigacionSBR_Dia', num2str(i)];


