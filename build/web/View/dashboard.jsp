<%-- 
    Document   : dashboard
    Created on : 20 abr 2025, 20:50:22
    Author     : huama
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="Modelo.Cliente"%>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard - 123digit@l</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f4f6f9;
            margin: 0;
            padding: 15px;
        }

        h1 {
            text-align: center;
            color: #2c3e50;
            font-size: 24px;
            margin-bottom: 20px;
        }

        .card-container {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            justify-content: center;
            margin-bottom: 30px;
        }

        .card {
            background-color: white;
            padding: 12px;
            border-radius: 10px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
            width: 150px;
            text-align: center;
        }

        .card h2 {
            font-size: 24px;
            color: #3498db;
            margin: 0;
        }

        .card p {
            margin: 3px 0 0;
            color: #7f8c8d;
            font-size: 12px;
        }

        .section {
            width: 100%;
            max-width: 600px;
            margin: 0 auto 30px;
        }

        canvas {
            background-color: white;
            padding: 10px;
            border-radius: 8px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
            display: block;
            width: 100%;
            height: 300px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
            background-color: white;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
            font-size: 12px;
        }

        th, td {
            padding: 6px;
            border: 1px solid #ddd;
            text-align: center;
        }

        th {
            background-color: #3498db;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

    </style>
</head>
<body>
    <h1>Dashboard Soporte - 123digit@l</h1>

    <div class="card-container">
        <div class="card">
            <h2>400</h2>
            <p>Solicitudes</p>
        </div>
        <div class="card">
            <h2>379</h2>
            <p>Finalizadas</p>
        </div>
        <div class="card">
            <h2>40</h2>
            <p>Colaboradores</p>
        </div>
        <div class="card">
            <h2>100.2h</h2>
            <p>Prom. Atención</p>
        </div>
    </div>

    <div class="section">
        <h3>Reporte Por Tipo</h3>
        <canvas id="tipoSolicitudChart"></canvas>
    </div>

    <div class="section">
        <h3>Reporte Por Estado</h3>
        <canvas id="estadoSolicitudChart"></canvas>
    </div>

    <div class="section">
        <h3>Reporte Mensual</h3>
        <canvas id="lineChart"></canvas>
    </div>

    <div class="section">
        <h3>Solicitudes Recientes</h3>
        <table>
            <tr>
                <th>ID</th>
                <th>Cliente</th>
                <th>Tipo</th>
                <th>Estado</th>
                <th>Colaborador</th>
                <th>Fecha</th>
            </tr>
            <tr>
                <td>001</td>
                <td>Cotraentrega</td>
                <td>Error</td>
                <td style="color:green;">Finalizado</td>
                <td>Jose HL</td>
                <td>24/05</td>
            </tr>
            <tr>
                <td>002</td>
                <td>Plaza Vea</td>
                <td>Capacitación</td>
                <td style="color:orange;">Pendiente</td>
                <td>Fabrizio</td>
                <td>25/05</td>
            </tr>
            <tr>
                <td>003</td>
                <td>Nubity</td>
                <td>Requerimiento</td>
                <td style="color:green;">Finalizado</td>
                <td>Jeremy</td>
                <td>23/05</td>
            </tr>
            <tr>
                <td>004</td>
                <td>Everad</td>
                <td>Error</td>
                <td style="color:orange;">Pendiente</td>
                <td>Fabrizio</td>
                <td>26/05</td>
            </tr>
            <tr>
                <td>001</td>
                <td>Aruma</td>
                <td>Error</td>
                <td style="color:green;">Finalizado</td>
                <td>Jeremy</td>
                <td>24/05</td>
            </tr>
            <tr>
                <td>002</td>
                <td>Lan Vision Center</td>
                <td>Capacitación</td>
                <td style="color:orange;">Pendiente</td>
                <td>Alessandro</td>
                <td>25/05</td>
            </tr>
            <tr>
                <td>003</td>
                <td>Vital Gym</td>
                <td>Requerimiento</td>
                <td style="color:green;">Finalizado</td>
                <td>Jose HL</td>
                <td>23/05</td>
            </tr>
            <tr>
                <td>004</td>
                <td>Maestro</td>
                <td>Error</td>
                <td style="color:orange;">Pendiente</td>
                <td>Alessandra</td>
                <td>26/05</td>
            </tr>
        </table>
    </div>

    <script>
        new Chart(document.getElementById("tipoSolicitudChart"), {
            type: 'bar',
            data: {
                labels: ['Errores', 'Capacitación', 'Requerimiento'],
                datasets: [{
                    label: 'Cantidad',
                    data: [170, 245, 437],
                    backgroundColor: ['#e74c3c', '#f39c12', '#2ecc71'],
                    borderRadius: 5
                }]
            },
            options: {
                plugins: {
                    legend: { display: false },
                    title: { display: false }
                }
            }
        });

        new Chart(document.getElementById("estadoSolicitudChart"), {
            type: 'doughnut',
            data: {
                labels: ['Solicitudes Pendientes', 'Solicitudes Finalizadas', 'Solicitudes Asignadas', 'Solicitudes Rechazadas'],
                datasets: [{
                    data: [210, 378, 174, 78],
                    backgroundColor: ['#f1c40f', '#2980b9', '#27ae60', '#e74c3c']
                }]
            },
            options: {
                plugins: {
                    legend: { position: 'bottom' },
                    title: { display: false }
                }
            }
        });

        new Chart(document.getElementById("lineChart"), {
            type: 'line',
            data: {
                labels: ['Ene', 'Feb', 'Mar', 'Abr', 'May'],
                datasets: [{
                    label: 'Atendidas',
                    data: [500, 435, 628, 342, 400],
                    fill: true,
                    borderColor: '#2980b9',
                    backgroundColor: 'rgba(41, 128, 185, 0.2)',
                    tension: 0.4
                }]
            },
            options: {
                plugins: {
                    legend: { display: false }
                },
                scales: {
                    y: { beginAtZero: true }
                }
            }
        });
        
        // Filtro búsqueda en tabla
        document.getElementById("busqueda").addEventListener("keyup", function () {
            let filtro = this.value.toLowerCase();
            let filas = document.querySelectorAll("#tablaSolicitudes tbody tr");
            filas.forEach(fila => {
                let texto = fila.innerText.toLowerCase();
                fila.style.display = texto.includes(filtro) ? "" : "none";
            });
        });
    </script>
</body>
</html>