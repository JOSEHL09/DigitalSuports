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
    .form-container {
      max-width: 600px;
      margin: auto;
      padding: 2rem;
      background: white;
      border-radius: 1rem;
      box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
    }
    .form-label i {
      margin-right: 6px;
    }
  </style>
</head>
<body class="bg-light">

<div class="container mt-5">
  <div class="form-container">
      <div id="alertaExito" class="alert alert-success d-none text-center" role="alert">
        <i class="fa-solid fa-circle-check me-2"></i> ¡Solicitud registrada con éxito!
      </div>
    <h3 class="mb-4 text-center">Registrar Nueva Solicitud</h3>
    <form id="solicitudForm" class="needs-validation" novalidate>

      <!-- Aplicativo -->
      <div class="mb-3">
        <label for="aplicativo" class="form-label"><i class="fa-solid fa-cube"></i>Aplicativo</label>
        <select class="form-select" id="aplicativo" name="idAplicativo" required>
          <option value="">Seleccione un aplicativo</option>
          <option value="1">Sistema de Ventas</option>
          <option value="2">App de Inventario</option>
          <option value="3">Plataforma Web Interna</option>
        </select>
        <div class="invalid-feedback">Debe seleccionar un aplicativo.</div>
      </div>

      <!-- Tipo de Solicitud -->
      <div class="mb-3">
        <label for="tipoSolicitud" class="form-label"><i class="fa-solid fa-bars-staggered"></i>Tipo de Solicitud</label>
        <select class="form-select" id="tipoSolicitud" name="idTipoSolicitud" required>
          <option value="">Seleccione un tipo</option>
          <option value="1">Soporte Técnico</option>
          <option value="2">Mejora Funcionalidad</option>
          <option value="3">Reporte de Error</option>
        </select>
        <div class="invalid-feedback">Debe seleccionar un tipo de solicitud.</div>
      </div>

      <!-- Motivo -->
      <div class="mb-3">
        <label for="motivo" class="form-label"><i class="fa-solid fa-comment-dots"></i>Motivo</label>
        <textarea class="form-control" id="motivo" name="motivo" rows="4" required minlength="10"
                  placeholder="Describe brevemente tu solicitud..."></textarea>
        <div class="invalid-feedback">Ingrese un motivo válido (mínimo 10 caracteres).</div>
      </div>

      <!-- Botón -->
      <button type="submit" class="btn btn-primary w-100"><i class="fa-solid fa-paper-plane"></i> Registrar Solicitud</button>
    </form>
  </div>
</div>

<script>
  (function () {
    'use strict';
    const form = document.querySelector('.needs-validation');
    const alerta = document.getElementById('alertaExito');

    form.addEventListener('submit', function (event) {
      event.preventDefault();
      event.stopPropagation();

      if (form.checkValidity()) {
        
        alerta.classList.remove('d-none');
        alerta.classList.add('show');

        form.reset();
        form.classList.remove('was-validated');

        setTimeout(() => {
          alerta.classList.add('d-none');
          alerta.classList.remove('show');
        }, 3000);
      } else {
        form.classList.add('was-validated');
      }
    }, false);
  })();
</script>

</body>
</html>
