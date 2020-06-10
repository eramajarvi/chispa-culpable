function graphTemps(X1, YMatrix1, i)
%CREATEFIGURE(X1, YMatrix1)
%  X1:  vector of x data
%  YMATRIX1:  matrix of y data

%  Auto-generated by MATLAB on 30-Oct-2019 19:34:39

% Create figure
figure1 = figure('WindowState','maximized');

% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% Create multiple lines using matrix input to plot
plot1 = plot(X1,YMatrix1,'LineWidth',1,'Parent',axes1);
set(plot1(1),'DisplayName','Temperatura ambiente');
set(plot1(2),'DisplayName','Temperatura con irrigaci�n');
set(plot1(3),'DisplayName','Temperatura sin irrigaci�n');

% Create ylabel
ylabel('Temperatura [�C]');

% Create xlabel
xlabel('Tiempo [horas]');

% Create title
title('Temperatura del panel FV');

box(axes1,'on');
grid(axes1,'on');
% Set the remaining axes properties
set(axes1,'FontName','Cambria Math','GridColor',[0 0 0],'XMinorGrid','on',...
    'YMinorGrid','on');
% Create legend
legend(axes1,'show');

%% Guardar figura
ruta = 'C:\Users\james\Documents\GitHub\chispa-culpable\graficas\Temperaturas\';

nombreArchivo = [ruta, 'graphTemperaturas_Dia', num2str(i)];

saveas(figure1, nombreArchivo, 'fig');
saveas(figure1, nombreArchivo, 'png');
close;

