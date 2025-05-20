import matlab.engine
import logging
import base64
from flask import Flask, request, jsonify
from flask_cors import CORS 
from waitress import serve

app = Flask(__name__)
CORS(app) # Sin esto no se pueden comunicar los archivos

# Inicia el motor de MATLAB
eng = matlab.engine.start_matlab()

# Abrir la carpeta, y copiar y pegar la ruta AQUÍ
ruta_carpeta = "C:\\Users\\2019p\\workspace\\metodos_numericos"

ruta = ruta_carpeta + "\\matlab_scripts" # NO TOCAR
eng.addpath(ruta, nargout=0)

@app.route("/punto_equilibrio", methods=["POST"])
def punto_equilibrio():
    datos = request.json
    cf = float(datos["CF"])
    cv = float(datos["CV"])
    pv = float(datos["PV"])
    
    resultado = eng.punto_equilibrio(cf, cv, pv)

    return jsonify({"resultado": float(resultado)})

@app.route("/graficar_punto_equilibrio", methods=["POST"])
def graficar_punto_equilibrio():
    datos = request.json
    cf = float(datos["CF"])
    cv = float(datos["CV"])
    pv = float(datos["PV"])
    
    # Ejecutar función de MATLAB que genera imagen
    ruta = eng.graficar_punto_equilibrio(cf, cv, pv)
    ruta_str = ruta if isinstance(ruta, str) else ruta[0]  # MATLAB devuelve lista

    # Leer imagen y codificar a base64
    with open(ruta_str, "rb") as f:
        imagen_codificada = base64.b64encode(f.read()).decode("utf-8")

    # Retorna la imagen en base64
    return jsonify({
        "imagen_base64": imagen_codificada
    })

if __name__ == "__main__":
    logging.basicConfig(level=logging.DEBUG)
    serve(app, host="0.0.0.0", port=8080)
