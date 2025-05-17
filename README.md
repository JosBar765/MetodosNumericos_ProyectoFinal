# Proyecto Final de Método Numéricos

Este proyecto conecta una aplicación web con MATLAB a través de Flask como backend y el **MATLAB Engine API for Python**. Permite a los usuarios ingresar datos financieros, como costos fijos y variables, para calcular el **Punto de Equilibrio Financiero** a través del **Método de Bisección**. Flask maneja las solicitudes del cliente, enviando los datos a MATLAB para realizar los cálculos, y luego devuelve los resultados al usuario en tiempo real. Este enfoque aprovecha las capacidades de MATLAB para el análisis financiero y proporciona una solución eficiente y escalable para la toma de decisiones financieras.

## Autor

- [@JosBar765](https://www.github.com/JosBar765) | Josué Barrios 0901-23-4777
- [@AndrewUMG](https://www.github.com/AndrewUMG) | Andrés Ixcajoc 0901-23-19115

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

1. Descargar MATLAB **R2024b**
2. Abrir MATLAB como **administrador**
3. En la consola de MATLAB, ejecuta las siguientes líneas de código por separado: `cd(fullfile(matlabroot, 'extern', 'engines', 'python'))`, `system('python setup.py install')`
4. Verifica la instalación de MATLAB Engine API for Python ejecutando en CMD: `pip show matlabengine`

La versión instalada debería ser algo como: matlabengine 24.2

### Cambio de ruta

1. Dirígete a la ruta donde se encuentra la carpeta (no necesitas abrirla)
2. Copia la ruta de dicha carpeta
3. Dirígete al archivo `server.py` que se encuentra en la carpeta del proyecto
4. Pega la ruta de la carpeta en la variable que se lla **ruta_carpeta** en la línea 15. Asegúrate de reemplazar las barras invertidas `\` por dobles barras `\\` en caso de que no se hayan reemplazado automáticamente
5. Guarda los cambios realizados a `server.py`

### Ejecución

1. Abre la carpeta del proyecto
2. Haz clic derecho sobre el archivo `server.py` y selecciona la opción **Abrir**
3. Se abrirá una ventana de CMD ejecutando el archivo. El servidor se abrá iniciado correctamente cuando aparezca el mensaje: `INFO:waitress.queue:Serving on http://0.0.0.0:8080`. NOTA: Este proceso puede tardar unos segundos. El puerto en que se aloja el servidor podría variar.
4. Vuelve a la carpeta del proyecto
5. Haz doble clic sobre el archivo `index.html`
6. El archivo se abrirá en tu navegador y estará listo para usarse

**NOTA:** Para detener el servidor, se debe ejecutar la siguiente combinación de teclas: `ctrl + c`, en la ventana CMD que se abrió al ejecutar el servidor. Este proceso puede tardar unos segundos.
