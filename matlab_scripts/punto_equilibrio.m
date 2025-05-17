function resultado = punto_equilibrio(CF, CV, PV)
    f = @(x) (PV - CV) * x - CF;  % Función objetivo: utilidad = 0

    a = 0;
    b = 10000;  % Un límite alto estimado
    tolerancia = 1e-6;
    iter = 1;
    max_iter = 100;
    error_rel = NaN;
    
    while (b - a)/2 > tolerancia && iter <= max_iter
        xi = (a + b)/2;  % Punto medio
        fxi = f(xi);
        
        if fxi == 0  % Solución exacta
            break;
        elseif f(a)*fxi < 0
            b = xi;
        else
            a = xi;
        end
        
        % Error relativo (opcional)
        if iter > 1
            error_rel = abs(b - a) / abs(xi);
            if error_rel < tolerancia
                break;
            end
        end
        
        iter = iter + 1;
    end
    
    resultado = xi;
end
