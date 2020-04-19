function graphEnergia(X1, YMatrix1, i)
%CREATEFIGURE(X1, YMatrix1)
%  X1:  vector of x data
%  YMATRIX1:  matrix of y data

%  Auto-generated by MATLAB on 30-Oct-2019 19:41:47

% Create figure
figure1 = figure('WindowState','maximized');

% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% Create multiple lines using matrix input to plot
plot1 = plot(X1,YMatrix1,'LineWidth',1);
set(plot1(1),'DisplayName','Energ�a beneficio',...
    'Color',[0.015686274509804 0.72156862745098 0.086274509803922]);
set(plot1(2),'DisplayName','Energ�a sin irrigaci�n',...
    'Color',[0.96078431372549 0.094117647058824 0]);

% Create ylabel
ylabel('Energ�a [kWh]');

% Create xlabel
xlabel('Tiempo [horas]');

% Create title
title('Energia');

box(axes1,'on');
grid(axes1,'on');
% Set the remaining axes properties
set(axes1,'FontName','Cambria Math','GridColor',[0 0 0],'GridLineStyle',...
    '--','XMinorGrid','on','YMinorGrid','on');
% Create legend
legend(axes1,'show');

%% Guardar figura

numeroDia = i;

% ruta = '/MATLAB Drive/tangente-penitente/graficas/';
ruta = 'C:\Users\james\Documents\GitHub\tangente-penitente\graficas\';

nombreArchivo = [ruta, 'graphEnergia_Dia', num2str(i)];

saveas(figure1, nombreArchivo, 'fig');
saveas(figure1, nombreArchivo, 'png');
close;

