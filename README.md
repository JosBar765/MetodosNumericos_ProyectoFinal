# Proyecto Flask + MATLAB Engine

Este proyecto conecta una aplicación web con MATLAB usando Flask como backend y el **MATLAB Engine API for Python**.

## Requisitos

- **Python**: 3.10.10  
- **pip**: 22.3.1  
- **MATLAB**: R2024b

### Verificación de pip

Para verificar si tienes `pip` instalado, ejecuta en CMD:
pip --version

Si no tienes `pip`, puedes instalarlo ejecutando:
python -m ensurepip --upgrade

### Instalación de librerías necesarias

Para instalar las librerías requeridas (Flask, Flask-CORS, y Waitress), ejecuta en CMD:
pip install flask flask-cors waitress


Versiones recomendadas:

- `flask` 3.1.0
- `flask-cors` 5.0.1
- `waitress` 3.0.2

## Instalación de MATLAB Engine API for Python

1. **Descargar MATLAB R2024b**
2. **Abrir MATLAB como administrador**
3. En la consola de MATLAB, ejecuta:
cd(fullfile(matlabroot, 'extern', 'engines', 'python'))
system('python setup.py install')
4. Verifica la instalación de MATLAB Engine API for Python ejecutando en CMD:
pip show matlabengine
La versión instalada debería ser algo como: matlabengine 24.2

## Ejecución del servidor

1. Abre CMD y navega a la carpeta del proyecto:
2. Ejecuta el servidor con: python server.py
3. Abre el archivo `index.html` en tu navegador.

¡Listo para usar!

