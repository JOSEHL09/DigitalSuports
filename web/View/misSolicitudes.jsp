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
            background-color: #f4f6f8;
            margin: 0;
            padding: 30px;
        }

        h1 {
            text-align: center;
            margin-bottom: 30px;
            color: #2c3e50;
        }

        .contenedor {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: flex-start;
        }

        .tarjeta {
            background-color: #fff;
            border-radius: 12px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.08);
            padding: 16px;
            width: 100%;
            max-width: 300px;
            transition: all 0.4s ease;
            position: relative;
            z-index: 1;
        }

        .tarjeta.editando {
            margin-left: auto;
            border: 2px solid #1abc9c;
            background-color: #e8f8f5;
            box-shadow: 0 0 16px rgba(26, 188, 156, 0.5);
            z-index: 10;
        }

        .tarjeta.blur {
            filter: blur(2px);
            opacity: 0.4;
            pointer-events: none;
        }

        .tarjeta h3 {
            margin: 0 0 10px;
            color: #34495e;
        }

        .info {
            margin: 6px 0;
        }

        .estado {
            font-weight: bold;
            padding: 4px 8px;
            border-radius: 5px;
            display: inline-block;
            font-size: 13px;
        }

        .completado {
            background-color: #2ecc71;
            color: white;
        }

        .pendiente {
            background-color: #e67e22;
            color: white;
        }

        .botones {
            margin-top: 10px;
        }

        .botones button {
            background-color: #3498db;
            color: white;
            border: none;
            padding: 6px 10px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 13px;
        }

        .botones button:hover {
            background-color: #2980b9;
        }

        .form-editar {
            display: none;
            flex-direction: column;
            gap: 6px;
            margin-top: 12px;
        }

        .form-editar input, .form-editar select {
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
        }

        .form-editar button {
            background-color: #2ecc71;
        }

        /* Estilos para filtro */
        .filtro-container {
            max-width: 320px;
            margin: 0 auto 30px auto;
            text-align: center;
        }

        select#filtro-estado {
            padding: 8px 12px;
            font-size: 16px;
            border-radius: 6px;
            border: 1px solid #ccc;
            cursor: pointer;
            width: 100%;
            max-width: 200px;
        }

        @media (min-width: 700px) {
            .contenedor {
                justify-content: flex-start;
            }

            .tarjeta {
                flex: 1 1 calc(33.333% - 20px);
            }
        }
    </style>
</head>
<body>

    <h1>Estado de tus Solicitudes</h1>

    <div class="filtro-container">
        <label for="filtro-estado"><strong>Filtrar por Estado:</strong></label><br/>
        <select id="filtro-estado" aria-label="Filtrar solicitudes por estado">
            <option value="todos" selected>Todos</option>
            <option value="Finalizado">Finalizado</option>
            <option value="Pendiente">Pendiente</option>
        </select>
    </div>

    <div class="contenedor" id="contenedor">
        <%
            String[][] solicitudes = {
                {"001", "Cotraentrega", "Error", "Finalizado", "Jose HL", "2025-05-24"},
                {"002", "Cotraentrega", "Capacitación", "Pendiente", "Fabrizio", "2025-05-25"},
                {"003", "Cotraentrega", "Requerimiento", "Finalizado", "Jeremy", "2025-05-23"},
                {"004", "Cotraentrega", "Error", "Pendiente", "Fabrizio", "2025-05-26"},
                {"005", "Cotraentrega", "Error", "Finalizado", "Jeremy", "2025-05-24"},
                {"006", "Cotraentrega", "Capacitación", "Pendiente", "Alessandro", "2025-05-25"},
                {"007", "Cotraentrega", "Requerimiento", "Finalizado", "Jose HL", "2025-05-23"},
                {"008", "Cotraentrega", "Error", "Pendiente", "Alessandra", "2025-05-26"}
            };

            for (String[] s : solicitudes) {
        %>
        <div class="tarjeta" id="tarjeta-<%=s[0]%>" data-estado="<%= s[3] %>">
            <h3><%= s[1] %></h3>
            <div class="info"><strong>ID:</strong> <%= s[0] %></div>
            <div class="info"><strong>Tipo:</strong> <span id="tipo-<%=s[0]%>"><%= s[2] %></span></div>
            <div class="info"><strong>Estado:</strong>
                <span class="estado <%= s[3].equals("Finalizado") ? "completado" : "pendiente" %>" id="estado-<%=s[0]%>"><%= s[3] %></span>
            </div>
            <div class="info"><strong>Colaborador:</strong> <span id="colab-<%=s[0]%>"><%= s[4] %></span></div>
            <div class="info"><strong>Fecha:</strong> <span id="fecha-<%=s[0]%>"><%= s[5] %></span></div>

            <form class="form-editar" id="form-<%=s[0]%>" onsubmit="guardarCambios(event, '<%=s[0]%>')">
                <select id="input-tipo-<%=s[0]%>">
                    <option>Error</option>
                    <option>Capacitación</option>
                    <option>Requerimiento</option>
                </select>
                <select id="input-estado-<%=s[0]%>">
                    <option>Finalizado</option>
                    <option>Pendiente</option>
                </select>
                <input type="text" id="input-colab-<%=s[0]%>" placeholder="Colaborador" />
                <input type="date" id="input-fecha-<%=s[0]%>" />
                <button type="submit">Guardar</button>
            </form>
        </div>
        <% } %>
    </div>

<script>
    const filtroEstado = document.getElementById('filtro-estado');
    const tarjetas = document.querySelectorAll('.tarjeta');

    filtroEstado.addEventListener('change', () => {
        const filtro = filtroEstado.value;

        tarjetas.forEach(tarjeta => {
            const estado = tarjeta.getAttribute('data-estado');
            if (filtro === 'todos' || estado === filtro) {
                tarjeta.style.display = 'block';
            } else {
                tarjeta.style.display = 'none';
            }
        });
    });
</script>

</body>
</html>