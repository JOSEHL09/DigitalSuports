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
  <title>Registrar Avances - Proyecto Tickets</title>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet" />
  <style>
    body {
      background: #f4f7fa;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      color: #1a237e;
      display: flex;
      justify-content: center;
      padding: 40px 20px;
      margin: 0;
    }
    .panel-container {
      background: white;
      border-radius: 15px;
      box-shadow: 0 10px 30px rgba(34, 74, 190, 0.15);
      max-width: 600px;
      width: 100%;
      padding: 30px;
    }
    .panel-header {
      display: flex;
      align-items: center;
      gap: 15px;
      margin-bottom: 20px;
      color: #224abe;
    }
    .panel-header i {
      font-size: 40px;
      filter: drop-shadow(1px 1px 2px rgba(34,74,190,0.3));
    }
    .panel-header h3 {
      margin: 0;
      font-size: 1.8rem;
      font-weight: 700;
    }
    form {
      display: flex;
      flex-direction: column;
      gap: 15px;
    }
    label {
      font-weight: 600;
      font-size: 1rem;
      margin-bottom: 5px;
      user-select: none;
    }
    textarea {
      resize: vertical;
      min-height: 80px;
      padding: 10px;
      font-size: 1rem;
      border-radius: 10px;
      border: 1.5px solid #d6d9f2;
      transition: border-color 0.3s ease;
      font-family: inherit;
    }
    textarea:focus {
      border-color: #224abe;
      outline: none;
      box-shadow: 0 0 8px rgba(34,74,190,0.3);
    }
    select, input[type="file"] {
      padding: 8px 12px;
      font-size: 1rem;
      border-radius: 10px;
      border: 1.5px solid #d6d9f2;
      font-family: inherit;
      cursor: pointer;
      transition: border-color 0.3s ease;
    }
    select:focus, input[type="file"]:focus {
      border-color: #224abe;
      outline: none;
      box-shadow: 0 0 8px rgba(34,74,190,0.3);
    }
    .progress-container {
      margin: 10px 0 20px;
      user-select: none;
    }
    .progress-bar {
      height: 20px;
      width: 100%;
      background: #e3e9ff;
      border-radius: 12px;
      overflow: hidden;
      box-shadow: inset 0 1px 3px rgba(34,74,190,0.2);
    }
    .progress-bar-fill {
      height: 100%;
      background: #224abe;
      width: 0%;
      border-radius: 12px 0 0 12px;
      transition: width 0.5s ease;
    }
    button {
      margin-top: 15px;
      background: #224abe;
      color: white;
      font-weight: 700;
      font-size: 1.1rem;
      padding: 12px;
      border: none;
      border-radius: 30px;
      cursor: pointer;
      box-shadow: 0 5px 15px rgba(34,74,190,0.4);
      transition: background-color 0.3s ease, box-shadow 0.3s ease;
      user-select: none;
    }
    button:hover {
      background-color: #122f8c;
      box-shadow: 0 8px 25px rgba(18,47,140,0.7);
    }
    .history {
      margin-top: 25px;
      font-size: 0.9rem;
      color: #224abe;
    }
    .history h4 {
      margin-bottom: 10px;
      font-weight: 700;
      user-select: none;
    }
    .history-item {
      background: #e3e9ff;
      border-radius: 10px;
      padding: 10px 15px;
      margin-bottom: 8px;
      box-shadow: 0 2px 8px rgba(34,74,190,0.1);
      color: #1a237e;
      line-height: 1.4;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }
    .history-item div.text {
      max-width: 75%;
    }
    .btn-group button {
      background: #224abe;
      border-radius: 6px;
      padding: 6px 10px;
      font-size: 0.85rem;
      margin-left: 6px;
      box-shadow: none;
      transition: background-color 0.2s ease;
    }
    .btn-group button:hover {
      background-color: #122f8c;
    }
    #status {
      margin-top: 15px;
      font-weight: 600;
      color: #224abe;
      user-select: none;
    }
  </style>
</head>
<body>
  <div class="panel-container" role="main" aria-label="Registrar avances de tickets asignados">

    <header class="panel-header" tabindex="0">
      <i class="fas fa-pen" aria-hidden="true"></i>
      <h3>Registrar Avances</h3>
    </header>

    <form id="avanceForm" aria-label="Formulario para actualizar avances del ticket">
      <label for="progressRange">Porcentaje de avance:</label>
      <input 
        type="range" id="progressRange" name="progress" min="0" max="100" value="0" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0" />
      <div class="progress-container" aria-live="polite">
        <div class="progress-bar" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0" aria-label="Barra de progreso">
          <div class="progress-bar-fill"></div>
        </div>
      </div>

      <label for="avanceDesc">Descripción del avance:</label>
      <textarea id="avanceDesc" name="avanceDesc" placeholder="Describe qué se ha hecho..." required></textarea>

      <label for="estadoSelect">Estado del ticket:</label>
      <select id="estadoSelect" name="estadoSelect" required>
        <option value="" disabled selected>Selecciona un estado</option>
        <option value="Pendiente">Pendiente</option>
        <option value="En Proceso">En Proceso</option>
        <option value="Cerrado">Cerrado</option>
      </select>

      <label for="archivoAdjunto">Adjuntar evidencia (opcional):</label>
      <input type="file" id="archivoAdjunto" name="archivoAdjunto" accept=".jpg,.jpeg,.png,.pdf,.doc,.docx" aria-describedby="fileHelp" />
      <small id="fileHelp" style="color:#224abe; font-size:0.85rem;">Formatos aceptados: JPG, PNG, PDF, DOC</small>

      <button type="submit">Guardar Avance</button>
      <button type="button" id="cancelEditBtn" style="display:none; margin-top:5px; background:#999;">Cancelar edición</button>
    </form>

    <div id="status" aria-live="polite" aria-atomic="true"></div>

    <section class="history" aria-live="polite" aria-label="Historial de avances registrados">
      <h4>Historial de Avances</h4>
      <div id="historyList"></div>
    </section>

  </div>

<script>
  const progressRange = document.getElementById('progressRange');
  const progressBarFill = document.querySelector('.progress-bar-fill');
  const progressBar = document.querySelector('.progress-bar');
  const form = document.getElementById('avanceForm');
  const statusDiv = document.getElementById('status');
  const historyList = document.getElementById('historyList');
  const cancelEditBtn = document.getElementById('cancelEditBtn');

  let editingIndex = null; // Para saber si estamos editando

  // Actualiza barra de progreso visual y aria
  function updateProgressBar(value) {
    progressBarFill.style.width = value + '%';
    progressBar.setAttribute('aria-valuenow', value);
    progressRange.setAttribute('aria-valuenow', value);
  }
  progressRange.addEventListener('input', (e) => {
    updateProgressBar(e.target.value);
  });
  updateProgressBar(progressRange.value);

  // Renderiza historial de avances con botones editar/borrar
  function renderHistory() {
    historyList.innerHTML = '';
    let avances = JSON.parse(localStorage.getItem('avances')) || [];
    if (avances.length === 0) {
      historyList.innerHTML = '<div class="history-item">No hay avances registrados.</div>';
      statusDiv.textContent = '';
      return;
    }
    avances.forEach((avance, i) => {
      const div = document.createElement('div');
      div.classList.add('history-item');

      // Texto principal con fecha, descripción, progreso y estado
      const textDiv = document.createElement('div');
      textDiv.classList.add('text');
      textDiv.textContent = `${avance.fecha}: ${avance.descripcion} (Progreso: ${avance.progreso}%, Estado: ${avance.estado})`;

      // Grupo botones editar y borrar
      const btnGroup = document.createElement('div');
      btnGroup.classList.add('btn-group');

      const btnEdit = document.createElement('button');
      btnEdit.type = 'button';
      btnEdit.textContent = 'Editar';
      btnEdit.setAttribute('aria-label', `Editar avance del ${avance.fecha}`);
      btnEdit.addEventListener('click', () => startEditing(i));

      const btnDelete = document.createElement('button');
      btnDelete.type = 'button';
      btnDelete.textContent = 'Borrar';
      btnDelete.setAttribute('aria-label', `Borrar avance del ${avance.fecha}`);
      btnDelete.addEventListener('click', () => deleteAvance(i));

      btnGroup.appendChild(btnEdit);
      btnGroup.appendChild(btnDelete);

      div.appendChild(textDiv);
      div.appendChild(btnGroup);

      historyList.appendChild(div);
    });

    // Mostrar el último avance en el div status
    const last = avances[avances.length - 1];
    if (last) {
      statusDiv.textContent = `Progreso: ${last.progreso}% | Estado: ${last.estado}`;
    } else {
      statusDiv.textContent = '';
    }
  }

  // Iniciar edición llenando el formulario
  function startEditing(index) {
    let avances = JSON.parse(localStorage.getItem('avances')) || [];
    const avance = avances[index];
    if (!avance) return;

    form.avanceDesc.value = avance.descripcion;
    form.estadoSelect.value = avance.estado;
    form.progress.value = avance.progreso;
    updateProgressBar(avance.progreso);

    editingIndex = index;
    cancelEditBtn.style.display = 'inline-block';
    form.querySelector('button[type="submit"]').textContent = 'Actualizar Avance';
  }

  // Cancelar edición
  cancelEditBtn.addEventListener('click', () => {
    editingIndex = null;
    form.reset();
    updateProgressBar(0);
    cancelEditBtn.style.display = 'none';
    form.querySelector('button[type="submit"]').textContent = 'Guardar Avance';
  });

  // Borrar avance
  function deleteAvance(index) {
    if (!confirm('¿Seguro que quieres borrar este avance?')) return;
    let avances = JSON.parse(localStorage.getItem('avances')) || [];
    avances.splice(index, 1);
    localStorage.setItem('avances', JSON.stringify(avances));
    if (editingIndex === index) {
      cancelEditBtn.click(); // cancelar edición si borramos el que estaba editando
    }
    renderHistory();
  }

  // Guardar o actualizar avance
  form.addEventListener('submit', async e => {
    e.preventDefault();

    const avanceDesc = form.avanceDesc.value.trim();
    const estado = form.estadoSelect.value;
    const progreso = form.progress.value;

    if (!avanceDesc || !estado) {
      alert('Por favor completa la descripción y selecciona un estado.');
      return;
    }

    let avances = JSON.parse(localStorage.getItem('avances')) || [];
    const fechaActual = new Date().toLocaleDateString();

    if (editingIndex !== null) {
      // Actualizar avance
      avances[editingIndex].descripcion = avanceDesc;
      avances[editingIndex].estado = estado;
      avances[editingIndex].progreso = progreso;
      avances[editingIndex].fecha = fechaActual;
      editingIndex = null;
      cancelEditBtn.style.display = 'none';
      form.querySelector('button[type="submit"]').textContent = 'Guardar Avance';
      alert('Avance actualizado correctamente.');
    } else {
      // Nuevo avance
      avances.push({
        fecha: fechaActual,
        descripcion: avanceDesc,
        progreso: progreso,
        estado: estado
      });
      alert('Avance registrado correctamente.');
    }

    localStorage.setItem('avances', JSON.stringify(avances));
    form.reset();
    updateProgressBar(0);
    renderHistory();
  });

  // Inicializar historial y barra
  renderHistory();
</script>
</body>
</html>