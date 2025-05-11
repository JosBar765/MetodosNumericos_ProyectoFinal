function resultado = graficar_punto_equilibrio(CF, CV, PV)
    % Eje X: unidades vendidas
    x = linspace(0, 2 * CF / (PV - CV), 100);

    ingresos = PV * x;
    costos_variables = CV * x;
    costos_totales = CF + costos_variables;
    costos_fijos = CF * ones(size(x));

    % Punto de equilibrio
    x_eq = CF / (PV - CV);
    y_eq = PV * x_eq;

    % Crear figura oculta
    f = figure('Visible', 'off');
    plot(x, ingresos, 'g-', 'LineWidth', 2); hold on;
    plot(x, costos_totales, 'r-', 'LineWidth', 2);
    plot(x, costos_fijos, 'b--', 'LineWidth', 1.5);
    plot(x_eq, y_eq, 'ko', 'MarkerFaceColor', 'k');
    text(x_eq + 5, y_eq, sprintf('Pto. Equilibrio (%.1f, %.2f)', x_eq, y_eq));

    xlabel('Unidades producidas / vendidas');
    ylabel('Dinero ($)');
    title('Análisis gráfico del punto de equilibrio financiero');
    legend('Ingresos', 'Costos Totales', 'Costos Fijos', 'Punto de Equilibrio', 'Location', 'northwest');
    grid on;

    % Guardar imagen
    resultado = fullfile(tempdir, 'graficar_punto_equilibrio.png');
    saveas(f, resultado);

    % Cerrar figura
    close(f);
end
