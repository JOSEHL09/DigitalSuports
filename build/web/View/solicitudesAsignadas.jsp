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
  <title>Gestión de Tickets</title>

  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet" />

  <style>
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

    .main-content {
      display: flex;
      height: 400px;
      min-height: 350px;
      overflow: hidden;
    }

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

    select#estado-select {
      padding: 8px 12px;
      font-size: 1rem;
      border-radius: 6px;
      border: 1.5px solid #224abe;
      font-weight: 600;
      color: #224abe;
      cursor: pointer;
      transition: background-color 0.3s ease;
    }
    select#estado-select:hover, select#estado-select:focus {
      background-color: #c1d1ff;
      outline: none;
      border-color: #122f8c;
    }

    .btn-review, #btn-delete, #btn-add-ticket {
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
      margin-right: 10px;
    }

    #btn-delete {
      background: #e53935;
    }
    #btn-delete:hover {
      background-color: #b71c1c;
      box-shadow: 0 8px 25px rgba(183, 28, 28, 0.7);
    }

    .btn-review:hover, #btn-add-ticket:hover {
      background-color: #122f8c;
      box-shadow: 0 8px 25px rgba(18, 47, 140, 0.7);
    }

    #btn-add-ticket {
      margin: 15px auto;
      display: block;
      max-width: 200px;
    }

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

  <div class="panel-container" role="main" aria-label="Panel de gestión de tickets">

    <div class="panel-header" tabindex="0">
      <i class="fas fa-ticket-alt" aria-hidden="true"></i>
      <h3>Gestión de Tickets</h3>
    </div>

    <div class="tickets-info" aria-label="Resumen de tickets">
      <div class="ticket-box" aria-label="Total de tickets">
        <div id="total-tickets" class="number">0</div>
        <div class="label">Total Tickets</div>
      </div>
      <div class="ticket-box" aria-label="Tickets pendientes">
        <div id="pendientes-tickets" class="number">0</div>
        <div class="label">Pendientes</div>
      </div>
      <div class="ticket-box" aria-label="Tickets en proceso">
        <div id="enproceso-tickets" class="number">0</div>
        <div class="label">En Proceso</div>
      </div>
      <div class="ticket-box" aria-label="Tickets cerrados">
        <div id="cerrados-tickets" class="number">0</div>
        <div class="label">Cerrados</div>
      </div>
    </div>

    <button id="btn-add-ticket" class="btn-review" aria-label="Agregar nuevo ticket">Agregar Nuevo Ticket</button>

    <div class="main-content">

      <nav class="tickets-menu" aria-label="Menú de tickets">
        <h4>Tickets</h4>
        <div id="tickets-list">
          <!-- Lista de tickets aquí -->
        </div>
      </nav>

      <section class="ticket-detail" aria-live="polite" aria-atomic="true" tabindex="0">
        <h4 id="ticket-title">Seleccione un ticket</h4>
        <div class="ticket-info">
          <p><strong>Cliente:</strong> <span id="cliente-info"></span></p>
          <p><strong>Fecha de apertura:</strong> <span id="fecha-info"></span></p>
          <p><strong>Estado:</strong>
            <select id="estado-select" aria-label="Seleccionar estado del ticket">
              <option value="Pendiente">Pendiente</option>
              <option value="En Proceso">En Proceso</option>
              <option value="Cerrado">Cerrado</option>
              <option value="Otro">Otro</option>
            </select>
          </p>
          <p><strong>Descripción:</strong> <span id="desc-info"></span></p>
        </div>
        <button id="btn-save" class="btn-review" aria-label="Guardar cambios del ticket">Guardar Cambios</button>
        <button id="btn-delete" class="btn-review" aria-label="Eliminar ticket">Eliminar Ticket</button>
      </section>

    </div>
  </div>

  <script>
    let ticketsData = JSON.parse(localStorage.getItem('ticketsData')) || {
      1: { title: "#001 - Problema en impresora", cliente: "Empresa XYZ", fecha: "2025-05-10", estado: "Pendiente", descripcion: "La impresora no responde al enviar documentos desde varios equipos." },
      2: { title: "#002 - Error en software contable", cliente: "Comercial ABC", fecha: "2025-05-08", estado: "En Proceso", descripcion: "Error crítico en módulo facturación." },
      3: { title: "#003 - Solicitud de acceso VPN", cliente: "Consultores DEF", fecha: "2025-05-15", estado: "Pendiente", descripcion: "Solicitud acceso remoto VPN." }
    };

    let currentTicketId = null;

    const ticketsListEl = document.getElementById('tickets-list');
    const titleEl = document.getElementById('ticket-title');
    const clienteEl = document.getElementById('cliente-info');
    const fechaEl = document.getElementById('fecha-info');
    const estadoSelect = document.getElementById('estado-select');
    const descEl = document.getElementById('desc-info');
    const btnSave = document.getElementById('btn-save');
    const btnDelete = document.getElementById('btn-delete');
    const btnAdd = document.getElementById('btn-add-ticket');

    const totalEl = document.getElementById('total-tickets');
    const pendientesEl = document.getElementById('pendientes-tickets');
    const enprocesoEl = document.getElementById('enproceso-tickets');
    const cerradosEl = document.getElementById('cerrados-tickets');

    function saveTickets() {
      localStorage.setItem('ticketsData', JSON.stringify(ticketsData));
    }

    function updateSummary() {
      const tickets = Object.values(ticketsData);
      totalEl.textContent = tickets.length;
      pendientesEl.textContent = tickets.filter(t => t.estado === 'Pendiente').length;
      enprocesoEl.textContent = tickets.filter(t => t.estado === 'En Proceso').length;
      cerradosEl.textContent = tickets.filter(t => t.estado === 'Cerrado').length;
    }

    function renderTickets() {
      ticketsListEl.innerHTML = '';
      Object.keys(ticketsData).forEach(id => {
        const ticket = ticketsData[id];
        const div = document.createElement('div');
        div.className = 'ticket-item';
        div.setAttribute('tabindex', '0');
        div.dataset.id = id;
        div.textContent = ticket.title + " (" + ticket.estado + ")";
        if (id === currentTicketId) div.classList.add('active');
        div.addEventListener('click', () => selectTicket(id));
        div.addEventListener('keydown', e => {
          if (e.key === 'Enter' || e.key === ' ') {
            e.preventDefault();
            selectTicket(id);
          }
        });
        ticketsListEl.appendChild(div);
      });
    }

    function selectTicket(id) {
      currentTicketId = id;
      const ticket = ticketsData[id];
      if (!ticket) return;

      titleEl.textContent = ticket.title;
      clienteEl.textContent = ticket.cliente;
      fechaEl.textContent = ticket.fecha;
      estadoSelect.value = ticket.estado || 'Pendiente';
      descEl.textContent = ticket.descripcion;

      renderTickets();
    }

    btnSave.addEventListener('click', () => {
      if (!currentTicketId) {
        alert('Selecciona un ticket primero.');
        return;
      }
      let ticket = ticketsData[currentTicketId];
      // Actualizar estado del select
      ticket.estado = estadoSelect.value;
      saveTickets();
      renderTickets();
      updateSummary();
      alert('Cambios guardados correctamente.');
    });

    btnDelete.addEventListener('click', () => {
      if (!currentTicketId) {
        alert('Selecciona un ticket primero.');
        return;
      }
      if (confirm('¿Estás seguro que deseas eliminar este ticket?')) {
        delete ticketsData[currentTicketId];
        currentTicketId = null;
        clearDetail();
        saveTickets();
        renderTickets();
        updateSummary();
      }
    });

    btnAdd.addEventListener('click', () => {
      const nuevoId = Date.now().toString();
      const titulo = prompt("Título del ticket:");
      if (!titulo) return alert("Título obligatorio.");
      const cliente = prompt("Cliente:");
      const fecha = new Date().toISOString().split('T')[0];
      const descripcion = prompt("Descripción:");
      ticketsData[nuevoId] = {
        title: titulo,
        cliente: cliente || 'Cliente no especificado',
        fecha,
        estado: 'Pendiente',
        descripcion: descripcion || ''
      };
      saveTickets();
      selectTicket(nuevoId);
      renderTickets();
      updateSummary();
    });

    function clearDetail() {
      titleEl.textContent = 'Seleccione un ticket';
      clienteEl.textContent = '';
      fechaEl.textContent = '';
      estadoSelect.value = 'Pendiente';
      descEl.textContent = '';
    }

    // Inicializar
    renderTickets();
    updateSummary();
    const primerId = Object.keys(ticketsData)[0];
    if (primerId) selectTicket(primerId);
  </script>

</body>
</html>