function graphTemperaturaAmbiente(X1, Y1, i)
%CREATEFIGURE(X1, Y1)
%  X1:  vector of x data
%  Y1:  vector of y data

%  Auto-generated by MATLAB on 30-Oct-2019 19:21:50

% Create figure
figure1 = figure('WindowState','maximized');

% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% Create plot
plot(X1,Y1,'LineWidth',1,'Color',[0 0.831372549019608 0.164705882352941]);

% Create ylabel
ylabel('Temperatura ambiente [�C]');

% Create xlabel
xlabel('tiempo [horas]');

% Create title
title('Temperatura ambiente');

box(axes1,'on');
grid(axes1,'on');
% Set the remaining axes properties
set(axes1,'FontName','Cambria Math','GridLineStyle','--','XMinorGrid','on',...
    'YMinorGrid','on');

%% Guardar figura
% ruta = '/MATLAB Drive/tangente-penitente/graficas/';
ruta = 'C:\Users\james\Documents\GitHub\tangente-penitente\graficas\TemperaturaAmbiente\';

numeroDia = i;

nombreArchivo = [ruta, 'graphTemperaturaAmbiente_Dia', num2str(i)];

saveas(figure1, nombreArchivo, 'fig');
saveas(figure1, nombreArchivo, 'png');
close;
