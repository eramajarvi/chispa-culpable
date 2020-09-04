function graphEnergia(t, YMatrix1, i)
% Para referencia:
% YMatrix1 = [energiaBeneficioSBR; energiaBeneficio; energiaNoBeneficio]

%  Auto-generated by MATLAB on 13-Jun-2020 18:38:01

% Create figure
figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% Create multiple lines using matrix input to plot
plot1 = plot(t,YMatrix1,'Parent',axes1);
set(plot1(1),'DisplayName','Energía beneficio SBR','LineWidth',1.2,...
    'Color',[0 0 1]);
set(plot1(2),'DisplayName','Energía beneficio PD','Color',[1 0 0]);
set(plot1(3),'DisplayName','Energía sin irrigación','LineStyle','--',...
    'Color',[0 0 0]);

% Create ylabel
ylabel('Energía [kWh]','FontName','Humanst521 BT');

% Create xlabel
xlabel('Hora','FontName','Humanst521 BT');

box(axes1,'on');
hold(axes1,'off');
% Set the remaining axes properties
set(axes1,'FontName','Humanst521 BT','XGrid','on','XMinorGrid','on','YGrid',...
    'on','YMinorGrid','on');
% Create legend
legend1 = legend(axes1,'show');
set(legend1,...
    'Position',[0.168521858453747 0.788659742172535 0.296464182497259 0.117508810009155]);

% -------------------------------------------------------------------------
% Guardar graficas
% Descomentar la siguiente linea para guardar la grafica en una ruta
% especifica. De lo contrario se guarda en la ruta actual
ruta = 'C:\Users\james\Desktop\graficasTEMP\';

nombreArchivo = [ruta, 'dia', num2str(i), '-energia'];
saveas(figure1, nombreArchivo, 'svg');
close;