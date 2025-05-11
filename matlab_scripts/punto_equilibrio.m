function resultado = punto_equilibrio(CF, CV, PV)
    f = @(x) (PV - CV) * x - CF;
    f_prima = @(x) PV - CV;
    
    xi = CF / max(PV - CV, 1);
    tolerancia = 1e-6;
    error_rel = NaN;
    iter = 1;

    while f_prima(xi) ~= 0
        xi_sig = xi - f(xi)/f_prima(xi);
    
        if iter > 1
            error_rel = abs(xi_sig - xi) / abs(xi_sig);
        end
        
        if iter > 1 && error_rel < tolerancia
            break;
        else
            iter = iter + 1;
            xi = xi_sig;
        end
    end
    
    ingresos = PV * xi;
    costos_totales = CF + CV * xi;

    % resultado = {xi, ingresos, costos_totales};
    resultado = xi;
end