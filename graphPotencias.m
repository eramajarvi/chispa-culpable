function graphPotencias(X1, YMatrix1)
%CREATEFIGURE(X1, YMatrix1)
%  X1:  vector of x data
%  YMATRIX1:  matrix of y data

%  Auto-generated by MATLAB on 13-Jun-2020 19:17:15

% Create figure
figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% Create multiple lines using matrix input to plot
plot1 = plot(X1,YMatrix1,'Parent',axes1);
set(plot1(1),'DisplayName','Potencia sin irrigación','LineWidth',0.6,...
    'LineStyle','--',...
    'Color',[0 0 0]);
set(plot1(2),'DisplayName','Potencia beneficio SBR','LineWidth',1.2,...
    'Color',[0 0 1]);
set(plot1(3),'DisplayName','Potencia beneficio PD','LineWidth',0.7,...
    'Color',[1 0 0]);

% Create ylabel
ylabel('Potencia [W]','FontName','Cambria Math');

% Create xlabel
xlabel('Hora','FontName','Cambria Math');

box(axes1,'on');
hold(axes1,'off');
% Set the remaining axes properties
set(axes1,'XGrid','on','XMinorGrid','on','YGrid','on','YMinorGrid','on');
% Create legend
legend(axes1,'show');

