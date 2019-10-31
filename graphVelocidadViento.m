function graphVelocidadViento(X1, Y1)
%CREATEFIGURE(X1, Y1)
%  X1:  vector of x data
%  Y1:  vector of y data

%  Auto-generated by MATLAB on 30-Oct-2019 19:24:21

% Create figure
figure1 = figure('WindowState','maximized');

% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% Create plot
plot(X1,Y1,'LineWidth',1,'Color',[0 0.6 1]);

% Create ylabel
ylabel('Velocidad del viento [m/s]');

% Create xlabel
xlabel('Tiempo [horas]');

% Create title
title('Velocidad del viento');

box(axes1,'on');
grid(axes1,'on');
% Set the remaining axes properties
set(axes1,'FontName','Cambria Math','GridColor',[0 0 0],'GridLineStyle',...
    '--','XMinorGrid','on','YMinorGrid','on');
