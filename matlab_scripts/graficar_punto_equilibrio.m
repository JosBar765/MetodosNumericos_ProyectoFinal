function resultado = graficar_punto_equilibrio(CF, CV, PV)
    % Esta función genera y guarda una gráfica del punto de equilibrio.
    % Entradas:
    %   CF - Costos Fijos
    %   CV - Costo Variable por unidad
    %   PV - Precio de Venta por unidad
    % Salida:
    %   resultado - ruta completa de la imagen PNG guardada

    x = linspace(0, 2 * CF / (PV - CV), 100);
    % Crea un vector con 100 valores entre 0 y el doble del punto de equilibrio.
    % Esto representa las unidades producidas/vendidas (eje X).

    ingresos = PV * x;
    % Calcula los ingresos multiplicando el precio de venta por las unidades.

    costos_variables = CV * x;
    % Calcula los costos variables totales para cada cantidad de unidades.

    costos_totales = CF + costos_variables;
    % Suma los costos fijos a los variables para obtener los costos totales.

    costos_fijos = CF * ones(size(x));
    % Genera un vector constante con el valor de los costos fijos.

    x_eq = CF / (PV - CV);
    % Calcula el punto de equilibrio en unidades (cuando ingresos = costos totales).

    y_eq = PV * x_eq;
    % Calcula el valor en dinero ($) en el punto de equilibrio.

    f = figure('Visible', 'off');
    % Crea una figura oculta (no se muestra en pantalla).

    plot(x, ingresos, 'g-', 'LineWidth', 2); hold on;
    % Dibuja la curva de ingresos en color verde.

    plot(x, costos_totales, 'r-', 'LineWidth', 2);
    % Dibuja la curva de costos totales en rojo.

    plot(x, costos_fijos, 'b--', 'LineWidth', 1.5);
    % Dibuja la línea de costos fijos en azul punteado.

    plot(x_eq, y_eq, 'ko', 'MarkerFaceColor', 'k');
    % Marca el punto de equilibrio con un punto negro relleno.

    text(x_eq + 5, y_eq, sprintf('Pto. Equilibrio (%.1f, %.2f)', x_eq, y_eq));
    % Añade una etiqueta con las coordenadas del punto de equilibrio.

    xlabel('Unidades producidas / vendidas');
    ylabel('Dinero ($)');
    % Etiquetas de los ejes X e Y.

    legend('Ingresos', 'Costos Totales', 'Costos Fijos', 'Punto de Equilibrio', 'Location', 'northwest');
    % Agrega una leyenda a la gráfica en la esquina superior izquierda.

    grid on;
    % Activa la cuadrícula en la gráfica.

    resultado = fullfile(tempdir, 'graficar_punto_equilibrio.png');
    % Define la ruta donde se guardará la imagen (carpeta temporal del sistema).

    saveas(f, resultado);
    % Guarda la figura como imagen PNG.

    close(f);
    % Cierra la figura para liberar recursos del sistema.
end
