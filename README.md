# Proyecto Final de Método Numéricos

Este proyecto conecta una aplicación web con MATLAB a través de Flask como backend y el **MATLAB Engine API for Python**. Permite a los usuarios ingresar datos financieros, como costos fijos y variables, para calcular el **Punto de Equilibrio Financiero**. Flask maneja las solicitudes del cliente, enviando los datos a MATLAB para realizar los cálculos, y luego devuelve los resultados al usuario en tiempo real. Este enfoque aprovecha las capacidades de MATLAB para el análisis financiero y proporciona una solución eficiente y escalable para la toma de decisiones financieras.

## Autores

- [@JosBar765](https://www.github.com/JosBar765) | Josué Barrios 0901-23-4777
- [@JosBar765](https://www.github.com/JosBar765) | Andrés Ixcajoc 0901-23-

## Requisitos

- **Python**: 3.10.10  
- **pip**: 22.3.1  
- **MATLAB**: R2024b

***

### Verificación de pip

Para verificar si tienes `pip` instalado, ejecuta en CMD: `pip --version`

Si no tienes `pip`, puedes instalarlo ejecutando: `python -m ensurepip --upgrade`

### Instalación de librerías necesarias

Para instalar las librerías requeridas (Flask, Flask-CORS, y Waitress), ejecuta en CMD: `pip install flask flask-cors waitress`

Versiones recomendadas:

- `flask` 3.1.0
- `flask-cors` 5.0.1
- `waitress` 3.0.2

### Instalación de MATLAB Engine API for Python

1. **Descargar MATLAB R2024b**
2. **Abrir MATLAB como administrador**
3. En la consola de MATLAB, ejecuta: `cd(fullfile(matlabroot, 'extern', 'engines', 'python'))`, `system('python setup.py install')`
4. Verifica la instalación de MATLAB Engine API for Python ejecutando en CMD: `pip show matlabengine`

La versión instalada debería ser algo como: matlabengine 24.2

### Ejecución

1. Abre CMD y navega a la carpeta del proyecto
2. Ejecuta el servidor con: `python server.py`. La actividad del servidor se mostrará con un mensaje en consola parecido a este: `INFO:waitress:Serving on http://0.0.0.0:8080`
3. Abre el archivo `index.html` en tu navegador.

¡Listo para usar!

### NOTAS

- El puerto donde se ejecuta el servidor, puede llegar a variar
- Para detener el servidor, se debe ejecutar la combinación de teclas `ctrl + c` en la consola
