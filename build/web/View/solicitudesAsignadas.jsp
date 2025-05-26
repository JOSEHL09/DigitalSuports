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
  <title>Panel Solicitudes Asignadas con Detalle</title>

  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet" />

  <style>
    /* Reset y cuerpo base */
    body {
      background-color: #f4f7fa;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      margin: 0;
      padding: 40px 20px;
      color: #1a237e;
      display: flex;
      justify-content: center;
      min-height: 100vh;
    }

    .panel-container {
      background: white;
      border-radius: 15px;
      box-shadow: 0 10px 30px rgba(34, 74, 190, 0.15);
      max-width: 900px;
      width: 100%;
      display: flex;
      flex-direction: column;
      user-select: none;
    }

    /* Header Panel */
    .panel-header {
      padding: 25px 30px;
      text-align: center;
      border-bottom: 1px solid #d6d9f2;
    }

    .panel-header i {
      font-size: 50px;
      color: #224abe;
      margin-bottom: 10px;
      filter: drop-shadow(1px 1px 3px rgba(34,74,190,0.3));
    }

    .panel-header h3 {
      font-weight: 700;
      font-size: 2rem;
      margin: 0;
    }

    /* Estadísticas resumidas */
    .tickets-info {
      display: flex;
      justify-content: space-around;
      gap: 20px;
      padding: 20px 30px;
      border-bottom: 1px solid #d6d9f2;
      user-select: text;
    }

    .ticket-box {
      background: #e3e9ff;
      border-radius: 12px;
      padding: 18px 20px;
      flex: 1 1 140px;
      max-width: 160px;
      box-shadow: 0 4px 12px rgba(34, 74, 190, 0.1);
      transition: background-color 0.3s ease;
      cursor: default;
      text-align: center;
    }

    .ticket-box:hover {
      background-color: #c1d1ff;
    }

    .ticket-box .number {
      font-size: 2.6rem;
      font-weight: 700;
      color: #224abe;
      margin-bottom: 8px;
    }

    .ticket-box .label {
      font-size: 1rem;
      font-weight: 600;
      color: #1a237e;
    }

    /* Contenedor principal: menú tickets + detalle */
    .main-content {
      display: flex;
      height: 400px;
      min-height: 350px;
      overflow: hidden;
    }

    /* Menú lateral de tickets */
    .tickets-menu {
      width: 240px;
      border-right: 1px solid #d6d9f2;
      overflow-y: auto;
      background: #f9fbff;
      padding: 15px;
    }

    .tickets-menu h4 {
      margin-top: 0;
      font-weight: 700;
      font-size: 1.2rem;
      color: #224abe;
      margin-bottom: 12px;
      user-select: none;
    }

    .ticket-item {
      background: white;
      border-radius: 10px;
      padding: 12px 15px;
      margin-bottom: 10px;
      box-shadow: 0 2px 8px rgba(34,74,190,0.1);
      cursor: pointer;
      transition: background-color 0.25s ease;
      font-weight: 600;
      color: #1a237e;
      user-select: none;
    }

    .ticket-item:hover,
    .ticket-item.active {
      background-color: #c1d1ff;
      color: #122f8c;
    }

    /* Contenido detalle ticket */
    .ticket-detail {
      flex-grow: 1;
      padding: 25px 30px;
      overflow-y: auto;
      user-select: text;
    }

    .ticket-detail h4 {
      margin-top: 0;
      font-weight: 700;
      font-size: 1.6rem;
      margin-bottom: 15px;
      color: #224abe;
    }

    .ticket-info {
      font-size: 1rem;
      line-height: 1.5;
      margin-bottom: 25px;
      color: #1a237e;
    }

    .ticket-info strong {
      color: #122f8c;
    }

    .btn-review {
      background: #224abe;
      color: white;
      padding: 12px 26px;
      font-size: 1.1rem;
      font-weight: 600;
      border-radius: 30px;
      border: none;
      cursor: pointer;
      box-shadow: 0 5px 15px rgba(34, 74, 190, 0.4);
      transition: background-color 0.3s ease, box-shadow 0.3s ease;
      user-select: none;
    }

    .btn-review:hover {
      background-color: #122f8c;
      box-shadow: 0 8px 25px rgba(18, 47, 140, 0.7);
    }

    /* Responsive: menú arriba y detalle abajo en móvil */
    @media (max-width: 650px) {
      .main-content {
        flex-direction: column;
        height: auto;
      }
      .tickets-menu {
        width: 100%;
        border-right: none;
        border-bottom: 1px solid #d6d9f2;
        max-height: 180px;
      }
      .ticket-detail {
        padding: 20px 15px;
        max-height: 350px;
      }
    }

  </style>
</head>
<body>

  <div class="panel-container" role="main" aria-label="Panel de solicitudes asignadas con detalle">

    <div class="panel-header" tabindex="0">
      <i class="fas fa-tasks" aria-hidden="true"></i>
      <h3>Solicitudes Asignadas</h3>
    </div>

    <div class="tickets-info" aria-label="Resumen de tickets asignados">
      <div class="ticket-box" aria-label="Total de tickets asignados">
        <div class="number">27</div>
        <div class="label">Tickets Asignados</div>
      </div>
      <div class="ticket-box" aria-label="Tickets pendientes">
        <div class="number">14</div>
        <div class="label">Pendientes</div>
      </div>
      <div class="ticket-box" aria-label="Tickets en proceso">
        <div class="number">9</div>
        <div class="label">En Proceso</div>
      </div>
      <div class="ticket-box" aria-label="Tickets cerrados">
        <div class="number">4</div>
        <div class="label">Cerrados</div>
      </div>
    </div>

    <div class="main-content">

      <nav class="tickets-menu" aria-label="Menú de tickets asignados">
        <h4>Tickets</h4>
        <div class="ticket-item active" tabindex="0" data-id="1">#001 - Problema en impresora</div>
        <div class="ticket-item" tabindex="0" data-id="2">#002 - Error en software contable</div>
        <div class="ticket-item" tabindex="0" data-id="3">#003 - Solicitud de acceso VPN</div>
        <div class="ticket-item" tabindex="0" data-id="4">#004 - Actualización de hardware</div>
        <div class="ticket-item" tabindex="0" data-id="5">#005 - Problema con correo electrónico</div>
      </nav>

      <section class="ticket-detail" aria-live="polite" aria-atomic="true" tabindex="0">
        <h4 id="ticket-title">#001 - Problema en impresora</h4>
        <div class="ticket-info">
          <p><strong>Cliente:</strong> Empresa XYZ</p>
          <p><strong>Fecha de apertura:</strong> 2025-05-10</p>
          <p><strong>Estado:</strong> Pendiente</p>
          <p><strong>Descripción:</strong> La impresora no responde al enviar documentos desde varios equipos. Se requiere revisión urgente.</p>
        </div>
        <button class="btn-review" aria-label="Marcar ticket como revisado">Marcar como revisado</button>
      </section>

    </div>

  </div>

<script>
  const ticketsData = {
    1: {
      title: "#001 - Problema en impresora",
      cliente: "Empresa XYZ",
      fecha: "2025-05-10",
      estado: "Pendiente",
      descripcion: "La impresora no responde al enviar documentos desde varios equipos. Se requiere revisión urgente."
    },
    2: {
      title: "#002 - Error en software contable",
      cliente: "Comercial ABC",
      fecha: "2025-05-08",
      estado: "En Proceso",
      descripcion: "Se presenta un error crítico en el módulo de facturación que impide generar reportes."
    },
    3: {
      title: "#003 - Solicitud de acceso VPN",
      cliente: "Consultores DEF",
      fecha: "2025-05-15",
      estado: "Pendiente",
      descripcion: "Solicitud para acceso remoto vía VPN para nuevos empleados."
    },
    4: {
      title: "#004 - Actualización de hardware",
      cliente: "Industria GHI",
      fecha: "2025-05-05",
      estado: "Cerrado",
      descripcion: "Se actualizó la memoria RAM y disco duro de las estaciones de trabajo."
    },
    5: {
      title: "#005 - Problema con correo electrónico",
      cliente: "Servicios JKL",
      fecha: "2025-05-12",
      estado: "Pendiente",
      descripcion: "No se pueden enviar correos salientes desde la cuenta principal."
    }
  };

  const menuItems = document.querySelectorAll('.ticket-item');
  const titleEl = document.getElementById('ticket-title');
  const detailSection = titleEl.parentElement;
  const btnReview = detailSection.querySelector('.btn-review');

  function updateTicketDetail(id) {
    const data = ticketsData[id];
    if (!data) return;

    titleEl.textContent = data.title;

    detailSection.querySelector('.ticket-info').innerHTML = `
      <p><strong>Cliente:</strong> ${data.cliente}</p>
      <p><strong>Fecha de apertura:</strong> ${data.fecha}</p>
      <p><strong>Estado:</strong> <span id="estado-ticket">${data.estado}</span></p>
      <p><strong>Descripción:</strong> ${data.descripcion}</p>
    `;

    detailSection.focus();
  }

  menuItems.forEach(item => {
    item.addEventListener('click', () => {
      
      menuItems.forEach(i => i.classList.remove('active'));
      item.classList.add('active');

      updateTicketDetail(item.dataset.id);
    });

    item.addEventListener('keydown', e => {
 
      if (e.key === 'Enter' || e.key === ' ') {
        e.preventDefault();
        item.click();
      }
    });
  });

  btnReview.addEventListener('click', () => {

    const estadoEl = document.getElementById('estado-ticket');
    if (estadoEl.textContent !== "Cerrado") {
      estadoEl.textContent = "En Proceso";
      alert("Estado actualizado a 'En Proceso'");
    } else {
      alert("El ticket ya está cerrado.");
    }
  });

</script>

</body>
</html>