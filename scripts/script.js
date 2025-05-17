function agregarCampo(grupoId, montoClase) {
    const grupo = document.getElementById(grupoId);
    const nuevoCampo = document.createElement("div");
    nuevoCampo.className = "campo";
    nuevoCampo.innerHTML = `
        <button class="boton-editar" onclick="editarNombre(this)">✏️</button>
        <input type="text" class="nombre" placeholder="Nombre" disabled>
        <input type="number" class="${montoClase}" placeholder="Q.0.00">
        <button class="boton-borrar" onclick="this.parentElement.remove()">🗑️</button>
    `;
    grupo.insertBefore(nuevoCampo, grupo.querySelector("button.boton-mas"));
}

function editarNombre(boton) {
    const inputNombre = boton.parentElement.querySelector(".nombre");
    inputNombre.disabled = !inputNombre.disabled;
    if (!inputNombre.disabled) {
        inputNombre.focus();
    }
}

function limpiarCampos() {
    ['grupoCF', 'grupoCV'].forEach(id => {
        const grupo = document.getElementById(id);
        const campos = grupo.querySelectorAll(".campo");
        campos.forEach((campo, i) => {
            const inputs = campo.querySelectorAll("input");
            inputs.forEach(input => input.value = "");
            if (i > 0) campo.remove();
        });
    });
    document.getElementById("montoPV").value = "";
    document.getElementById("grafica").src = "data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///ywAAAAAAQABAAACAUwAOw==";
    document.getElementById("interpretacion").innerText = "El PE es: ";
}

function sumarCostosFijos() {
    const inputs = document.querySelectorAll('#grupoCF .montoCF');

    if (inputs.length === 0)
        return -100; // No hay inputs

    let suma = 0;
    for (const input of inputs) {
        if (input.value === "") {
            return -200; // Algún campo vacío
        }

        const valor = parseFloat(input.value);
        if (!isNaN(valor)) {
            suma += valor;
        }
    }
    return suma;
}

function sumarCostosVariables() {
    const inputs = document.querySelectorAll('#grupoCV .montoCV');

    if (inputs.length === 0)
        return -100; // No hay inputs

    let suma = 0;
    for (const input of inputs) {
        if (input.value === "") {
            return -200; // Algún campo vacío
        }

        const valor = parseFloat(input.value);
        if (!isNaN(valor)) {
            suma += valor;
        }
    }
    return suma;
}

function obtenerPrecioVenta() {
    const input = document.querySelector('#grupoPV #montoPV');
    const valor = input.value.trim();

    return (!isNaN(Number(valor)) && valor !== '') ? parseFloat(valor) : -1;
}

function calcularPE() {
    // Limpiar
    document.getElementById("grafica").src = "data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///ywAAAAAAQABAAACAUwAOw==";
    document.getElementById("interpretacion").innerText = "El PE es: ";

    const data = {
        'CF': sumarCostosFijos(),
        'CV': sumarCostosVariables(),
        'PV': obtenerPrecioVenta()
    };

    //
    //// Errores
    if (data.CF === -100 || data.CV === -100) {
        alert("Error: No existen campos para los costos variables o costo fijos.");
        return;
    }

    if (data.CF === -200 || data.CV === -200) {
        alert("Error: Algún campo de costos variables o costo fijos está vacío.");
        return;
    }

    if (data.PV === -1) {
        alert("Error: No hay un precio de venta.");
        return;
    }

    if (data.PV <= data.CV) {
        alert("Error: El precio de venta debe ser mayor al costo variable unitario para calcular el punto de equilibrio.");
        return;
    }

    //
    //// Obtención de resultados con el servidor
    fetch("http://127.0.0.1:8080/punto_equilibrio", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(data)
    }).then(response => response.json()).then(data => {
        const elemento = document.getElementById("interpretacion");
        elemento.innerText = "El PE es: " + data.resultado.toFixed(2);
    });

    fetch("http://127.0.0.1:8080/graficar_punto_equilibrio", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(data)
    }).then(res => res.json())
        .then(data => {
            const img = document.getElementById("grafica");
            img.src = "data:image/png;base64," + data.imagen_base64;
        });
}