function resultado = punto_equilibrio(CF, CV, PV)
    % Esta función calcula el punto de equilibrio utilizando el método de bisección.
    % Entradas:
    % CF - Costos Fijos
    % CV - Costo Variable por unidad
    % PV - Precio de Venta por unidad
    % Salida:
    % resultado - cantidad de unidades donde se alcanza el punto de equilibrio

    f = @(x) (PV - CV) * x - CF;  
    % Define la función de utilidad: ingreso - costo total.
    % En el punto de equilibrio, la utilidad es 0.

    a = 0;       % Límite inferior de búsqueda
    b = 10000;   % Límite superior de búsqueda (valor estimado alto)
    tolerancia = 1e-6;   % Criterio de paro: diferencia pequeña aceptable
    iter = 1;            % Contador de iteraciones
    max_iter = 100;      % Límite máximo de iteraciones
    error_rel = NaN;     % Inicialización del error relativo

    % Bucle principal del método de bisección
    while (b - a)/2 > tolerancia && iter <= max_iter
        xi = (a + b)/2;      % Calcula el punto medio del intervalo
        fxi = f(xi);         % Evalúa la función en el punto medio

        if fxi == 0          
            break;           % Si f(xi) es exactamente cero, se encontró el punto exacto
        elseif f(a)*fxi < 0  
            b = xi;          % El cambio de signo indica que la raíz está entre a y xi
        else
            a = xi;          % Si no, la raíz está entre xi y b
        end

        % Cálculo del error relativo (opcional, ayuda a verificar convergencia)
        if iter > 1
            error_rel = abs(b - a) / abs(xi);
            if error_rel < tolerancia
                break;       % Si el error relativo es menor que la tolerancia, se detiene
            end
        end

        iter = iter + 1;     % Incrementa el número de iteraciones
    end

    resultado = xi;          % Devuelve el valor aproximado del punto de equilibrio
end
