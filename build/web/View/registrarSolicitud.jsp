<%-- 
    Document   : registrarSolicitud
    Created on : 20 abr 2025, 20:50:29
    Author     : huama
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <title>Registrar Solicitud</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
  <style>
    body {
      background: linear-gradient(135deg, #667eea, #764ba2);
      min-height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
      padding: 40px 15px;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }
    .form-container {
      background: #fff;
      max-width: 600px;
      width: 100%;
      padding: 2.5rem 2rem;
      border-radius: 1rem;
      box-shadow: 0 12px 28px rgba(0, 0, 0, 0.15);
      color: #333;
    }
    h3 {
      text-align: center;
      font-weight: 700;
      margin-bottom: 1.8rem;
      color: #4b3f6b;
    }
    .form-label i {
      margin-right: 8px;
      color: #764ba2;
    }
    .btn-primary {
      background-color: #764ba2;
      border: none;
      transition: background-color 0.3s ease;
    }
    .btn-primary:hover {
      background-color: #5a367a;
    }
    .was-validated .form-control:invalid, 
    .was-validated .form-select:invalid {
      border-color: #dc3545;
      padding-right: 2.25rem;
      background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' fill='%23dc3545' viewBox='0 0 12 12'%3e%3cpath d='M11.6 1.6a.75.75 0 0 1 0 1.06l-4.18 4.18a.75.75 0 0 1-1.06 0L.4 2.66a.75.75 0 0 1 1.06-1.06L6 6.14l4.54-4.54a.75.75 0 0 1 1.06 0z'/%3e%3c/svg%3e");
      background-repeat: no-repeat;
      background-position: right calc(0.375em + 0.1875rem) center;
      background-size: calc(0.75em + 0.375rem) calc(0.75em + 0.375rem);
    }
    #alertaExito {
      display: none;
      font-weight: 600;
      font-size: 1.1rem;
    }
  </style>
</head>
<body>

<div class="form-container shadow-sm">
  <div id="alertaExito" class="alert alert-success d-flex align-items-center" role="alert">
    <i class="fa-solid fa-circle-check me-2"></i> ¡Solicitud registrada con éxito!
  </div>

  <h3>Registrar Nueva Solicitud</h3>
  <form id="solicitudForm" class="needs-validation" novalidate>
    <div class="mb-4">
      <label for="aplicativo" class="form-label"><i class="fa-solid fa-cube"></i> Aplicativo</label>
      <select class="form-select" id="aplicativo" name="idAplicativo" required>
        <option value="" disabled selected>Seleccione un aplicativo</option>
        <option value="Sistema de Ventas">Sistema de Ventas</option>
        <option value="App de Inventario">App de Inventario</option>
        <option value="Plataforma Web Interna">Plataforma Web Interna</option>
      </select>
      <div class="invalid-feedback">Debe seleccionar un aplicativo.</div>
    </div>
    <div class="mb-4">
      <label for="tipoSolicitud" class="form-label"><i class="fa-solid fa-bars-staggered"></i> Tipo de Solicitud</label>
      <select class="form-select" id="tipoSolicitud" name="idTipoSolicitud" required>
        <option value="" disabled selected>Seleccione un tipo</option>
        <option value="Soporte Técnico">Soporte Técnico</option>
        <option value="Mejora Funcionalidad">Mejora Funcionalidad</option>
        <option value="Reporte de Error">Reporte de Error</option>
      </select>
      <div class="invalid-feedback">Debe seleccionar un tipo de solicitud.</div>
    </div>
    <div class="mb-4">
      <label for="motivo" class="form-label"><i class="fa-solid fa-comment-dots"></i> Motivo</label>
      <textarea class="form-control" id="motivo" name="motivo" rows="4" required minlength="10"
                placeholder="Describe brevemente tu solicitud..."></textarea>
      <div class="invalid-feedback">Ingrese un motivo válido (mínimo 10 caracteres).</div>
    </div>
    <button type="submit" class="btn btn-primary w-100 py-2">
      <i class="fa-solid fa-paper-plane me-2"></i> Registrar Solicitud
    </button>
  </form>
</div>

<script>
  (function () {
    'use strict';

    const form = document.getElementById('solicitudForm');
    const alerta = document.getElementById('alertaExito');

    function guardarSolicitud(solicitud) {
      // Lee el array de solicitudes guardadas o crea uno vacío
      const solicitudes = JSON.parse(localStorage.getItem('solicitudes')) || [];
      solicitudes.push(solicitud);
      localStorage.setItem('solicitudes', JSON.stringify(solicitudes));
    }

    form.addEventListener('submit', function (event) {
      event.preventDefault();
      event.stopPropagation();

      if (form.checkValidity()) {
        // Crear objeto solicitud
        const nuevaSolicitud = {
          id: Date.now().toString(),  // ID único con timestamp
          aplicativo: form.aplicativo.value,
          tipo: form.tipoSolicitud.value,
          motivo: form.motivo.value,
          estado: "Pendiente",
          colaborador: "Sin asignar",
          fecha: new Date().toISOString().split('T')[0]
        };

        guardarSolicitud(nuevaSolicitud);

        // Mostrar alerta éxito
        alerta.style.display = 'flex';

        // Resetear formulario y validación
        form.reset();
        form.classList.remove('was-validated');

        // Ocultar alerta luego de 3 segundos
        setTimeout(() => {
          alerta.style.display = 'none';
        }, 3000);
      } else {
        form.classList.add('was-validated');
      }
    });
  })();
</script>

</body>
</html>