<%-- 
    Document   : listaClientes
    Created on : 20 abr 2025, 20:50:29
    Author     : huama
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Panel de Estadísticas - Soporte TI</title>
  
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet" />
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

  <style>
    body {
      background-color: #e6f0ff;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      margin: 0;
      padding: 40px 20px;
      display: flex;
      justify-content: center;
      align-items: flex-start;
      min-height: 100vh;
    }

    .panel-container {
      max-width: 900px;
      width: 100%;
      text-align: center;
      color: #224abe;
    }

    h1 {
      font-weight: 700;
      margin-bottom: 30px;
      font-size: 2.5rem;
      letter-spacing: 2px;
      color: #1a237e;
      user-select: none;
    }

    .main-stat {
      background: linear-gradient(135deg, #4e73df, #224abe);
      color: white;
      border-radius: 14px;
      padding: 40px 20px;
      margin-bottom: 40px;
      box-shadow: 0 10px 25px rgba(34, 74, 190, 0.35);
      display: inline-block;
      min-width: 280px;
      user-select: none;
    }

    .main-stat i {
      font-size: 60px;
      margin-bottom: 20px;
      filter: drop-shadow(1px 1px 3px rgba(0,0,0,0.3));
    }

    .main-stat .number {
      font-size: 4.2rem;
      font-weight: 800;
      letter-spacing: 2px;
      margin-bottom: 8px;
      text-shadow: 0 0 10px rgba(255, 255, 255, 0.8);
    }

    .main-stat .label {
      font-size: 1.4rem;
      font-weight: 600;
      opacity: 0.85;
    }

    .stats-grid {
      display: grid;
      grid-template-columns: repeat(auto-fit,minmax(200px,1fr));
      gap: 25px;
      margin-bottom: 40px;
    }

    .stat-box {
      background: white;
      border-radius: 14px;
      padding: 25px 20px;
      box-shadow: 0 8px 18px rgba(34, 74, 190, 0.12);
      transition: box-shadow 0.3s ease;
      cursor: default;
      user-select: none;
    }
    .stat-box:hover {
      box-shadow: 0 14px 35px rgba(34, 74, 190, 0.3);
    }

    .stat-box i {
      font-size: 36px;
      color: #4e73df;
      margin-bottom: 15px;
      display: block;
      filter: drop-shadow(1px 1px 2px rgba(0,0,0,0.15));
    }

    .stat-box .number {
      font-size: 2.5rem;
      font-weight: 700;
      color: #224abe;
      margin-bottom: 6px;
      letter-spacing: 1.2px;
    }

    .stat-box .label {
      font-size: 1rem;
      font-weight: 600;
      color: #3a4a92;
      opacity: 0.8;
    }

    .view-more {
      margin-top: 20px;
    }
    .view-more a {
      font-weight: 600;
      background: #224abe;
      color: white;
      padding: 12px 28px;
      border-radius: 30px;
      text-decoration: none;
      font-size: 1.1rem;
      box-shadow: 0 5px 15px rgba(34, 74, 190, 0.4);
      transition: background-color 0.3s ease, box-shadow 0.3s ease;
      display: inline-block;
      user-select: none;
    }
    .view-more a:hover {
      background: #122f8c;
      box-shadow: 0 8px 25px rgba(18, 47, 140, 0.7);
    }

    #chart-container {
      background: white;
      border-radius: 14px;
      padding: 20px;
      box-shadow: 0 8px 18px rgba(34, 74, 190, 0.12);
      max-width: 600px;
      margin: 0 auto 40px auto;
    }

    button#reloadData {
      background-color: #4e73df;
      border: none;
      padding: 10px 20px;
      color: white;
      font-weight: 600;
      border-radius: 8px;
      cursor: pointer;
      box-shadow: 0 5px 15px rgba(34, 74, 190, 0.4);
      user-select: none;
      transition: background-color 0.3s ease;
    }
    button#reloadData:hover {
      background-color: #224abe;
    }

  </style>
</head>
<body>

  <div class="panel-container" role="main" aria-label="Panel de estadísticas de soporte TI">

    <h1>Panel Estadístico Soporte TI</h1>

    <div class="main-stat" tabindex="0" aria-label="Clientes totales activos">
      <i class="fas fa-users" aria-hidden="true"></i>
      <div id="totalClientesActivos" class="number">0</div>
      <div class="label">Clientes Totales Activos</div>
    </div>

    <div id="chart-container" aria-label="Gráfico de clientes activos e inactivos">
      <canvas id="clientesChart" aria-label="Gráfico de barras de clientes activos e inactivos" role="img"></canvas>
    </div>

    <div class="stats-grid" aria-label="Otras estadísticas relevantes">

      <div class="stat-box" tabindex="0" aria-label="Clientes totales inactivos">
        <i class="fas fa-user-slash" aria-hidden="true"></i>
        <div id="totalClientesInactivos" class="number">0</div>
        <div class="label">Clientes Totales Inactivos</div>
      </div>

      <div class="stat-box" tabindex="0" aria-label="Tickets de soporte abiertos">
        <i class="fas fa-ticket-alt" aria-hidden="true"></i>
        <div class="number">12</div>
        <div class="label">Tickets Abiertos</div>
      </div>

      <div class="stat-box" tabindex="0" aria-label="Tiempo promedio de respuesta">
        <i class="fas fa-clock" aria-hidden="true"></i>
        <div class="number">1.8 h</div>
        <div class="label">Tiempo Promedio Respuesta</div>
      </div>

      <div class="stat-box" tabindex="0" aria-label="Soporte 24 horas 7 días">
        <i class="fas fa-headset" aria-hidden="true"></i>
        <div class="number">24/7</div>
        <div class="label">Soporte Continuo</div>
      </div>

      <div class="stat-box" tabindex="0" aria-label="Tickets cerrados hoy">
        <i class="fas fa-check-circle" aria-hidden="true"></i>
        <div class="number">45</div>
        <div class="label">Tickets Cerrados Hoy</div>
      </div>

      <div class="stat-box" tabindex="0" aria-label="Satisfacción del cliente en porcentaje">
        <i class="fas fa-smile" aria-hidden="true"></i>
        <div class="number">92%</div>
        <div class="label">Satisfacción del Cliente</div>
      </div>

      <div class="stat-box" tabindex="0" aria-label="Incidentes críticos actuales">
        <i class="fas fa-exclamation-triangle" aria-hidden="true"></i>
        <div class="number">3</div>
        <div class="label">Incidentes Críticos</div>
      </div>

      <div class="stat-box" tabindex="0" aria-label="Nuevos clientes este mes">
        <i class="fas fa-user-plus" aria-hidden="true"></i>
        <div class="number">8</div>
        <div class="label">Nuevos Clientes Este Mes</div>
      </div>

    </div>

    <button id="reloadData" aria-label="Recargar datos de clientes">Recargar datos</button>

    <div class="view-more">
      <a href="estadisticas.jsp" role="button" aria-label="Ver estadísticas completas">Ver estadísticas completas</a>
    </div>
  </div>

  <script>
    // Función para animar conteo
    function animateCount(element, start, end, duration = 1000) {
      let startTimestamp = null;
      const step = (timestamp) => {
        if (!startTimestamp) startTimestamp = timestamp;
        const progress = Math.min((timestamp - startTimestamp) / duration, 1);
        element.textContent = Math.floor(progress * (end - start) + start);
        if (progress < 1) {
          window.requestAnimationFrame(step);
        }
      };
      window.requestAnimationFrame(step);
    }

    // Función para cargar datos desde LocalStorage
    function cargarDatosClientes() {
      const clientes = JSON.parse(localStorage.getItem('clientes')) || [];

      const activos = clientes.filter(c => c.estado === 'Activo').length;
      const inactivos = clientes.filter(c => c.estado === 'Inactivo').length;

      const elActivos = document.getElementById('totalClientesActivos');
      const elInactivos = document.getElementById('totalClientesInactivos');

      animateCount(elActivos, 0, activos);
      animateCount(elInactivos, 0, inactivos);

      // Actualizar gráfico
      if(window.clientesChartInstance){
        window.clientesChartInstance.data.datasets[0].data = [activos, inactivos];
        window.clientesChartInstance.update();
      }
    }

    // Inicializar gráfico con Chart.js
    function inicializarGrafico() {
      const ctx = document.getElementById('clientesChart').getContext('2d');
      window.clientesChartInstance = new Chart(ctx, {
        type: 'bar',
        data: {
          labels: ['Activos', 'Inactivos'],
          datasets: [{
            label: 'Clientes',
            data: [0, 0],
            backgroundColor: ['#4e73df', '#a9b8ff'],
            borderRadius: 8,
            borderWidth: 1
          }]
        },
        options: {
          responsive: true,
          animation: {
            duration: 1000,
            easing: 'easeOutQuart'
          },
          scales: {
            y: {
              beginAtZero: true,
              ticks: {
                precision:0
              }
            }
          },
          plugins: {
            legend: { display: false },
            tooltip: { enabled: true }
          }
        }
      });
    }

    // Cargar datos y gráfico al iniciar
    window.addEventListener('DOMContentLoaded', () => {
      inicializarGrafico();

      // Para ejemplo, si no hay datos, crea unos clientes dummy:
      if(!localStorage.getItem('clientes')) {
        const ejemploClientes = [
          {id:1, estado:'Activo'},
          {id:2, estado:'Activo'},
          {id:3, estado:'Inactivo'},
          {id:4, estado:'Activo'},
          {id:5, estado:'Inactivo'},
          {id:6, estado:'Activo'},
          {id:7, estado:'Activo'},
          {id:8, estado:'Activo'},
          {id:9, estado:'Inactivo'},
          {id:10, estado:'Activo'}
        ];
        localStorage.setItem('clientes', JSON.stringify(ejemploClientes));
      }

      cargarDatosClientes();
    });

    // Recargar datos al pulsar botón
    document.getElementById('reloadData').addEventListener('click', () => {
      cargarDatosClientes();
    });
  </script>

</body>
</html>