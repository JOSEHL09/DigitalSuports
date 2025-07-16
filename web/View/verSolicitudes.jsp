<%-- 
    Document   : verSolicitudes
    Created on : 20 abr 2025, 20:50:34
    Author     : huama
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>Solicitudes Atendidas</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet"/>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f5f7fa;
            margin: 0;
            padding: 30px;
        }

        h1 {
            text-align: center;
            margin-bottom: 30px;
            color: #2c3e50;
        }

        .filtro-estado {
            text-align: center;
            margin-bottom: 25px;
        }

        .filtro-estado select {
            padding: 8px 12px;
            font-size: 14px;
            border-radius: 8px;
            border: 1px solid #ccc;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
        }

        .contenedor {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
        }

        .tarjeta {
            background-color: #fff;
            border-radius: 12px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            padding: 20px;
            width: 100%;
            max-width: 320px;
            transition: all 0.3s ease;
            position: relative;
        }

        .tarjeta.editando {
            border: 2px solid #1abc9c;
            background-color: #e9fdf8;
            z-index: 10;
        }

        .tarjeta.blur {
            filter: blur(2px);
            opacity: 0.4;
            pointer-events: none;
        }

        .tarjeta h3 {
            margin-top: 0;
            color: #34495e;
        }

        .info {
            margin: 6px 0;
            font-size: 14px;
        }

        .estado {
            font-weight: bold;
            padding: 5px 10px;
            border-radius: 5px;
            display: inline-block;
            font-size: 13px;
            text-transform: capitalize;
        }

        .finalizado { background-color: #2ecc71; color: white; }
        .pendiente { background-color: #e67e22; color: white; }
        .asignado { background-color: #3498db; color: white; }
        .enprogreso { background-color: #f1c40f; color: black; }
        .rechazado { background-color: #e74c3c; color: white; }

        .botones {
            margin-top: 10px;
        }

        .botones button {
            background-color: #3498db;
            color: white;
            border: none;
            padding: 8px 12px;
            border-radius: 6px;
            cursor: pointer;
            font-size: 14px;
            transition: background-color 0.2s ease;
        }

        .botones button:hover {
            background-color: #2980b9;
        }

        .form-editar {
            display: none;
            flex-direction: column;
            gap: 10px;
            margin-top: 12px;
        }

        .form-editar select, .form-editar input {
            padding: 7px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 14px;
        }

        .guardar-btn {
            font-weight: bold;
            border: none;
            padding: 8px;
            border-radius: 6px;
            color: white;
            cursor: pointer;
        }

        .guardar-finalizado { background-color: #27ae60; }
        .guardar-pendiente { background-color: #e67e22; }
        .guardar-asignado { background-color: #2980b9; }
        .guardar-enprogreso { background-color: #f1c40f; color: black; }
        .guardar-rechazado { background-color: #c0392b; }

        @media (min-width: 700px) {
            .tarjeta {
                flex: 1 1 calc(33.333% - 20px);
            }
        }
    </style>
</head>
<body>

<h1>Solicitudes Atendidas</h1>

<div class="filtro-estado">
    <label><strong>Filtrar por Estado:</strong></label>
    <select id="filtroEstado" onchange="filtrarPorEstado()">
        <option value="Todos">Todos</option>
        <option value="Finalizado">Finalizado</option>
        <option value="Pendiente">Pendiente</option>
        <option value="Asignado">Asignado</option>
        <option value="En progreso">En progreso</option>
        <option value="Rechazado">Rechazado</option>
    </select>
</div>

<div class="contenedor" id="contenedor">
    <%
        String[] colaboradores = {
            "Jose HL", "Fabrizio", "Jeremy", "Alessandro", "Alessandra",
            "Camila Rios", "Luis Torres", "Valeria Quispe", "Esteban Silva", "Renzo Alarcon",
            "Diana Huaman", "Martin Cueva", "Luciana Vega", "Carlos Zegarra", "Elena Muñoz"
        };
        String[][] solicitudes = {
            {"001", "Cotraentrega", "Error", "Finalizado", "Jose HL", "2025-05-24"},
            {"002", "Plaza Vea", "Capacitación", "Pendiente", "Fabrizio", "2025-05-25"},
            {"003", "Nubity", "Requerimiento", "Asignado", "Jeremy", "2025-05-23"},
            {"004", "Everad", "Error", "En progreso", "Fabrizio", "2025-05-26"},
            {"005", "Aruma", "Error", "Finalizado", "Jeremy", "2025-05-24"},
            {"006", "Lan Vision Center", "Capacitación", "Rechazado", "Alessandro", "2025-05-25"},
            {"007", "Vital Gym", "Requerimiento", "Finalizado", "Jose HL", "2025-05-23"},
            {"008", "Maestro", "Error", "Pendiente", "Alessandra", "2025-05-26"},
            {"009", "Saga Falabella", "Error", "Pendiente", "Camila Rios", "2025-05-26"},
            {"010", "Ripley", "Requerimiento", "Asignado", "Luis Torres", "2025-05-27"},
            {"011", "Open Plaza", "Capacitación", "En progreso", "Valeria Quispe", "2025-05-28"},
            {"012", "Interbank", "Error", "Rechazado", "Esteban Silva", "2025-05-29"},
            {"013", "BBVA", "Requerimiento", "Pendiente", "Renzo Alarcon", "2025-05-30"},
            {"014", "Banco de la Nación", "Capacitación", "Finalizado", "Diana Huaman", "2025-06-01"},
            {"015", "Metro", "Error", "Asignado", "Martin Cueva", "2025-06-02"},
            {"016", "Promart", "Requerimiento", "En progreso", "Luciana Vega", "2025-06-03"},
            {"017", "Oechsle", "Capacitación", "Pendiente", "Carlos Zegarra", "2025-06-04"},
            {"018", "Miniso", "Error", "Finalizado", "Elena Muñoz", "2025-06-05"}
        };

        for (String[] s : solicitudes) {
    %>
    <div class="tarjeta" id="tarjeta-<%=s[0]%>" data-estado="<%=s[3]%>">
        <h3><%= s[1] %></h3>
        <div class="info"><strong>ID:</strong> <%= s[0] %></div>
        <div class="info"><strong>Tipo:</strong> <span id="tipo-<%=s[0]%>"><%= s[2] %></span></div>
        <div class="info"><strong>Estado:</strong>
            <span class="estado <%= s[3].toLowerCase().replace(" ", "") %>" id="estado-<%=s[0]%>"><%= s[3] %></span>
        </div>
        <div class="info"><strong>Colaborador:</strong> <span id="colab-<%=s[0]%>"><%= s[4] %></span></div>
        <div class="info"><strong>Fecha:</strong> <span id="fecha-<%=s[0]%>"><%= s[5] %></span></div>

        <div class="botones">
            <button onclick="toggleEditForm('<%=s[0]%>')"><i class="fas fa-edit"></i> Editar</button>
        </div>

        <form class="form-editar" id="form-<%=s[0]%>" onsubmit="guardarCambios(event, '<%=s[0]%>')">
            <select id="input-tipo-<%=s[0]%>">
                <option>Error</option>
                <option>Capacitación</option>
                <option>Requerimiento</option>
                <option>Actualización</option>
                <option>Mantenimiento</option>
                <option>Soporte</option>
                <option>Consulta</option>
                <option>Mejora</option>
                <option>Instalación</option>
                <option>Configuración</option>
                <option>Evaluación</option>
                <option>Revisión</option>
                <option>Integración</option>
            </select>

            <select id="input-estado-<%=s[0]%>" onchange="actualizarBotonEstado('<%=s[0]%>')">
                <option>Finalizado</option>
                <option>Pendiente</option>
                <option>Asignado</option>
                <option>En progreso</option>
                <option>Rechazado</option>
            </select>

            <select id="input-colab-<%=s[0]%>">
                <% for (String colab : colaboradores) { %>
                    <option><%= colab %></option>
                <% } %>
            </select>

            <input type="date" id="input-fecha-<%=s[0]%>" />

            <button id="btn-guardar-<%=s[0]%>" type="submit" class="guardar-btn guardar-finalizado">Guardar</button>
        </form>
    </div>
    <% } %>
</div>

<script>
    function toggleEditForm(id) {
        const tarjeta = document.getElementById("tarjeta-" + id);
        const form = document.getElementById("form-" + id);
        const tarjetas = document.querySelectorAll('.tarjeta');

        const isEditing = tarjeta.classList.contains("editando");

        tarjetas.forEach(t => {
            t.classList.remove("editando", "blur");
            t.querySelector(".form-editar").style.display = "none";
        });

        if (!isEditing) {
            tarjeta.classList.add("editando");
            form.style.display = "flex";

            document.getElementById("input-tipo-" + id).value = document.getElementById("tipo-" + id).textContent;
            document.getElementById("input-colab-" + id).value = document.getElementById("colab-" + id).textContent;
            document.getElementById("input-fecha-" + id).value = document.getElementById("fecha-" + id).textContent;
            document.getElementById("input-estado-" + id).value = document.getElementById("estado-" + id).textContent;

            actualizarBotonEstado(id);

            tarjetas.forEach(t => {
                if (t.id !== "tarjeta-" + id) t.classList.add("blur");
            });
        }
    }

    function guardarCambios(event, id) {
        event.preventDefault();

        document.getElementById("tipo-" + id).textContent = document.getElementById("input-tipo-" + id).value;
        document.getElementById("colab-" + id).textContent = document.getElementById("input-colab-" + id).value;
        document.getElementById("fecha-" + id).textContent = document.getElementById("input-fecha-" + id).value;

        const estadoValue = document.getElementById("input-estado-" + id).value;
        const estadoSpan = document.getElementById("estado-" + id);
        estadoSpan.textContent = estadoValue;
        estadoSpan.className = "estado " + estadoValue.toLowerCase().replace(" ", "");

        const tarjeta = document.getElementById("tarjeta-" + id);
        tarjeta.setAttribute("data-estado", estadoValue);

        tarjeta.classList.remove("editando");
        document.querySelectorAll('.tarjeta').forEach(t => t.classList.remove("blur"));
        document.getElementById("form-" + id).style.display = "none";
    }

    function filtrarPorEstado() {
        const filtro = document.getElementById("filtroEstado").value.toLowerCase();
        const tarjetas = document.querySelectorAll(".tarjeta");

        tarjetas.forEach(t => {
            const estado = t.dataset.estado.toLowerCase();
            t.style.display = (filtro === "todos" || estado === filtro) ? "block" : "none";
        });
    }

    function actualizarBotonEstado(id) {
        const estado = document.getElementById("input-estado-" + id).value.toLowerCase().replace(" ", "");
        const boton = document.getElementById("btn-guardar-" + id);
        boton.className = "guardar-btn guardar-" + estado;
    }
</script>
</body>
</html>