function graphIrradiancia(X1, Y1, i)
%CREATEFIGURE(X1, Y1)
%  X1:  vector of x data
%  Y1:  vector of y data

%  Auto-generated by MATLAB on 30-Oct-2019 19:18:15

% Create figure
figure1 = figure('WindowState','maximized');

% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% Create plot
plot(X1,Y1,'LineWidth',1,'Color',[1 0.074509803921569 0.650980392156863]);

% Create ylabel
ylabel('Irradiancia [W/m^2]');

% Create xlabel
xlabel('tiempo [horas]');

% Create title
title('Irradiancia');

box(axes1,'on');
grid(axes1,'on');
% Set the remaining axes properties
set(axes1,'FontName','Cambria Math','GridColor',[0 0 0],'GridLineStyle',...
    '--','XMinorGrid','on','YMinorGrid','on');

%% Guardar figura
figure1;

numeroDia = i;

nombreArchivo = ['graphIrrigacion_Dia', num2str(i)];

saveas(figure1, nombreArchivo, 'fig');
saveas(figure1, nombreArchivo, 'png');
close;
