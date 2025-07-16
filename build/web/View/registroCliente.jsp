<%-- 
    Document   : listaClientes
    Created on : 20 abr 2025, 20:50:29
    Author     : huama
--%>

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
  <title>Registrar Nuevo Cliente - Plataforma 123digit@l</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet" />
  <style>
    body {
      background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
      min-height: 100vh;
      display: flex;
      justify-content: center;
      align-items: flex-start;
      padding: 40px 20px;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    .form-container {
      background: #fff;
      max-width: 700px;
      width: 100%;
      border-radius: 15px;
      box-shadow: 0 8px 24px rgba(0,0,0,0.15);
      padding: 40px 30px 50px 30px;
      transition: box-shadow 0.3s ease;
    }

    .form-container:hover {
      box-shadow: 0 12px 32px rgba(0,0,0,0.25);
    }

    h2 {
      text-align: center;
      color: #3b3f5c;
      font-weight: 700;
      margin-bottom: 30px;
      letter-spacing: 1.2px;
    }

    .btn-submit {
      background: #2575fc;
      border: none;
      transition: background-color 0.3s ease;
    }
    .btn-submit:hover {
      background: #1a54b8;
    }

    /* Validaciones en rojo */
    .is-invalid {
      border-color: #dc3545 !important;
    }

    .invalid-feedback {
      font-size: 0.9rem;
    }

    /* Estilo alerta éxito */
    #successAlert {
      display: none;
    }

    /* Lista de clientes al final */
    #clientesLista {
      margin-top: 40px;
    }

    #clientesLista table {
      background: #f7f9fc;
      border-radius: 10px;
      box-shadow: 0 4px 12px rgba(0,0,0,0.1);
    }

    @media(max-width: 576px) {
      body {
        padding: 20px 10px;
      }

      .form-container {
        padding: 30px 20px 40px 20px;
      }
    }
  </style>
</head>
<body>

  <div class="form-container shadow-sm">
    <h2><i class="fas fa-user-plus text-primary"></i> Registrar Nuevo Cliente</h2>

    <div id="successAlert" class="alert alert-success d-flex align-items-center" role="alert">
      <i class="fas fa-check-circle me-2"></i>
      ¡Registro exitoso! Cliente agregado correctamente.
    </div>

    <form id="clienteForm" novalidate>
      <div class="row g-3">
        <div class="col-md-6">
          <label for="nombre" class="form-label">Nombre *</label>
          <input type="text" class="form-control" id="nombre" placeholder="Juan" required />
          <div class="invalid-feedback">Por favor ingresa un nombre válido.</div>
        </div>

        <div class="col-md-6">
          <label for="apellido" class="form-label">Apellido *</label>
          <input type="text" class="form-control" id="apellido" placeholder="Pérez" required />
          <div class="invalid-feedback">Por favor ingresa un apellido válido.</div>
        </div>

        <div class="col-12">
          <label for="email" class="form-label">Correo Electrónico *</label>
          <input type="email" class="form-control" id="email" placeholder="ejemplo@correo.com" required />
          <div class="invalid-feedback">Introduce un correo electrónico válido.</div>
        </div>

        <div class="col-md-6">
          <label for="tipoCliente" class="form-label">Tipo de Cliente *</label>
          <select class="form-select" id="tipoCliente" required>
            <option value="" disabled selected>Selecciona el tipo</option>
            <option value="Empresa">Empresa</option>
            <option value="Persona natural">Persona natural</option>
          </select>
          <div class="invalid-feedback">Selecciona un tipo de cliente.</div>
        </div>

        <div class="col-md-6">
          <label for="colaborador" class="form-label">Colaborador Asignado *</label>
          <select class="form-select" id="colaborador" required>
            <option value="" disabled selected>Selecciona colaborador</option>
            <option>Ana Torres</option>
            <option>Carlos Vega</option>
            <option>Luz Martínez</option>
            <option>Pedro Romero</option>
            <option>Valeria Silva</option>
          </select>
          <div class="invalid-feedback">Selecciona un colaborador.</div>
        </div>

        <div class="col-md-6">
          <label for="estado" class="form-label">Estado *</label>
          <select class="form-select" id="estado" required>
            <option value="" disabled selected>Selecciona estado</option>
            <option>Activo</option>
            <option>Inactivo</option>
          </select>
          <div class="invalid-feedback">Selecciona un estado.</div>
        </div>

        <div class="col-md-6 d-flex align-items-end justify-content-end">
          <button type="submit" class="btn btn-submit text-white px-4 py-2">
            <i class="fas fa-save me-2"></i> Guardar Cliente
          </button>
        </div>
      </div>
    </form>

    <!-- Lista de clientes agregados -->
    <div id="clientesLista" class="mt-5">
      <h4 class="text-center text-secondary mb-4">Clientes Registrados</h4>
      <div class="table-responsive">
        <table class="table table-hover align-middle">
          <thead class="table-primary">
            <tr>
              <th>Nombre</th>
              <th>Apellido</th>
              <th>Email</th>
              <th>Tipo Cliente</th>
              <th>Colaborador</th>
              <th>Estado</th>
            </tr>
          </thead>
          <tbody id="clientesTableBody">
            <!-- Aquí se agregarán las filas con JS -->
          </tbody>
        </table>
      </div>
    </div>

  </div>

  <script>
    (() => {
      const form = document.getElementById('clienteForm');
      const successAlert = document.getElementById('successAlert');
      const clientesTableBody = document.getElementById('clientesTableBody');

      // Cargar clientes guardados en localStorage y mostrarlos
      const cargarClientes = () => {
        const clientes = JSON.parse(localStorage.getItem('clientes')) || [];
        clientesTableBody.innerHTML = '';

        if (clientes.length === 0) {
          clientesTableBody.innerHTML = `<tr><td colspan="6" class="text-center text-muted">No hay clientes registrados aún.</td></tr>`;
          return;
        }

        clientes.forEach(({nombre, apellido, email, tipoCliente, colaborador, estado}, i) => {
          const row = document.createElement('tr');
          row.innerHTML = `
            <td>${nombre}</td>
            <td>${apellido}</td>
            <td>${email}</td>
            <td>${tipoCliente}</td>
            <td>${colaborador}</td>
            <td>${estado}</td>
          `;
          clientesTableBody.appendChild(row);
        });
      };

      // Validar email simple
      const validarEmail = (email) => {
        return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);
      };

      // Validar formulario y mostrar errores inline
      const validarFormulario = () => {
        let valido = true;

        // Nombre
        const nombre = form.nombre;
        if (!nombre.value.trim()) {
          nombre.classList.add('is-invalid');
          valido = false;
        } else {
          nombre.classList.remove('is-invalid');
        }

        // Apellido
        const apellido = form.apellido;
        if (!apellido.value.trim()) {
          apellido.classList.add('is-invalid');
          valido = false;
        } else {
          apellido.classList.remove('is-invalid');
        }

        // Email
        const email = form.email;
        if (!validarEmail(email.value.trim())) {
          email.classList.add('is-invalid');
          valido = false;
        } else {
          email.classList.remove('is-invalid');
        }

        // Tipo Cliente
        const tipoCliente = form.tipoCliente;
        if (!tipoCliente.value) {
          tipoCliente.classList.add('is-invalid');
          valido = false;
        } else {
          tipoCliente.classList.remove('is-invalid');
        }

        // Colaborador
        const colaborador = form.colaborador;
        if (!colaborador.value) {
          colaborador.classList.add('is-invalid');
          valido = false;
        } else {
          colaborador.classList.remove('is-invalid');
        }

        // Estado
        const estado = form.estado;
        if (!estado.value) {
          estado.classList.add('is-invalid');
          valido = false;
        } else {
          estado.classList.remove('is-invalid');
        }

        return valido;
      };

      form.addEventListener('submit', (e) => {
        e.preventDefault();

        if (!validarFormulario()) return;

        const cliente = {
          nombre: form.nombre.value.trim(),
          apellido: form.apellido.value.trim(),
          email: form.email.value.trim(),
          tipoCliente: form.tipoCliente.value,
          colaborador: form.colaborador.value,
          estado: form.estado.value
        };

        // Guardar cliente en localStorage
        const clientes = JSON.parse(localStorage.getItem('clientes')) || [];
        clientes.push(cliente);
        localStorage.setItem('clientes', JSON.stringify(clientes));

        // Mostrar alerta de éxito y esconder luego
        successAlert.style.display = 'flex';
        setTimeout(() => {
          successAlert.style.display = 'none';
        }, 3500);

        // Limpiar formulario
        form.reset();

        // Recargar tabla clientes
        cargarClientes();
      });

      // Cargar la tabla al cargar la página
      cargarClientes();
    })();
  </script>

</body>
</html>