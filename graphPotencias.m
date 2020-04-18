function graphPotencias(X1, YMatrix1, i)
%CREATEFIGURE(X1, YMatrix1)
%  X1:  vector of x data
%  YMATRIX1:  matrix of y data

%  Auto-generated by MATLAB on 30-Oct-2019 19:38:27

% Create figure
figure1 = figure('WindowState','maximized');

% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% Create multiple lines using matrix input to plot
plot1 = plot(X1,YMatrix1,'LineWidth',1);
set(plot1(1),'DisplayName','Potencia beneficio');
set(plot1(2),'DisplayName','Potencia sin irrigación');

% Create ylabel
ylabel('Potencia [W]');

% Create xlabel
xlabel('Tiempo [horas]');

% Create title
title('Potencia generada');

box(axes1,'on');
grid(axes1,'on');
% Set the remaining axes properties
set(axes1,'FontName','Cambria Math','GridColor',[0 0 0],'GridLineStyle',...
    '--','XMinorGrid','on','YMinorGrid','on');
% Create legend
legend(axes1,'show');

%% Guardar figura

numeroDia = i;

ruta = '/MATLAB Drive/tangente-penitente/graficas/';
nombreArchivo = [ruta, 'graphPotencias_Dia', num2str(i)];

saveas(figure1, nombreArchivo, 'fig');
saveas(figure1, nombreArchivo, 'png');
close;
