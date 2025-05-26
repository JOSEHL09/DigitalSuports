<%-- 
    Document   : index
    Created on : 20 abr 2025, 20:49:59
    Author     : huama
--%>

<%@ page import="Modelo.UsuarioCliente" %>
<%
    // Obtener usuario de sesión
    UsuarioCliente usuario = (UsuarioCliente) session.getAttribute("usuario");
    if (usuario == null) {
        // Si no está autenticado, redirigir a login
        response.sendRedirect("login.jsp");
        return;
    }
    String rol = usuario.getRol().getNombreRol();
    String nombre = usuario.getNombre();
    if (rol == null) rol = "GUEST";
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Inicio - Plataforma 123digit@l</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: #f2f4f8;
            margin: 0;
            padding: 20px;
        }

        h1 {
            text-align: center;
            font-size: 24px;
        }

        .intro {
            text-align: center;
            color: #444;
            margin-bottom: 30px;
        }

        .stats-container, .panel-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
            margin-bottom: 30px;
        }

        .card, .panel {
            background: white;
            border-radius: 12px;
            box-shadow: 0 3px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            width: 240px;
            text-align: center;
            transition: transform 0.2s;
        }

        .card:hover, .panel:hover {
            transform: scale(1.03);
        }

        .card i, .panel i {
            font-size: 28px;
            color: #3498db;
            margin-bottom: 10px;
        }

        .card h2 {
            font-size: 20px;
            margin: 10px 0 5px;
        }

        .card p {
            font-size: 16px;
            color: #555;
        }

        .panel a {
            display: block;
            margin-top: 10px;
            color: #2980b9;
            text-decoration: none;
        }

        .panel a:hover {
            text-decoration: underline;
        }

        .profile-box {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }
        
        .profile-box h1 {
            font-size: 30px;
            color: #2c3e50;
            margin-bottom: 5px;
          }

          .profile-box p.intro {
            font-size: 16px;
            color: #555;
            font-style: italic;
          }

        .notificaciones {
            position: absolute;
            top: 15px;
            right: 70px;
            font-size: 22px;
            color: #2c3e50;
            cursor: pointer;
          }

          .panel-notificaciones {
            display: none;
            position: absolute;
            top: 40px;
            right: 0;
            width: 280px;
            background: #fff8dc;
            border-left: 5px solid #f39c12;
            padding: 15px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.2);
            z-index: 100;
          }

          .panel-notificaciones h4 {
            margin: 0 0 10px;
            font-size: 16px;
            color: #d35400;
          }

          .panel-notificaciones ul {
            list-style: none;
            padding-left: 0;
            margin: 0;
          }

          .panel-notificaciones li {
            font-size: 14px;
            margin-bottom: 8px;
          }

        @media (max-width: 600px) {
            .stats-container, .panel-container {
                flex-direction: column;
                align-items: center;
            }
        }
          .perfil-usuario {
            position: absolute;
            top: 15px;
            right: 20px;
            font-size: 24px;
            color: #2c3e50;
            cursor: pointer;
          }

          .menu-usuario {
            display: none;
            position: absolute;
            right: 0;
            top: 40px;
            background-color: #ffffff;
            padding: 14px 16px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            text-align: left;
            min-width: 180px;
            font-family: 'Segoe UI', sans-serif;
            z-index: 100;
          }

          .menu-usuario p {
            margin: 0;
            font-size: 17px;
            color: #2c3e50;
            font-weight: 500;
          }

          .menu-usuario hr {
            margin: 10px 0;
            border: none;
            border-top: 1px solid #eee;
          }

          .menu-usuario a {
            display: flex;
            align-items: center;
            gap: 8px;
            font-size: 14px;
            color: #e74c3c;
            font-weight: 500;
            text-decoration: none;
            transition: color 0.2s ease;
          }

          .modal {
            display: none;
            position: fixed;
            top: 0; left: 0;
            width: 100%; height: 100%;
            background: rgba(0, 0, 0, 0.4);
            z-index: 1000;
            justify-content: center;
            align-items: center;
          }

          .modal-content {
            background: white;
            padding: 20px;
            border-radius: 8px;
            text-align: center;
            width: 300px;
          }

          .modal-content button {
            margin: 10px;
            padding: 8px 16px;
            border: none;
            background: #3498db;
            color: white;
            border-radius: 4px;
            cursor: pointer;
          }

          .modal-content button:last-child {
            background: #95a5a6;
          }
    </style>
</head>
<body>
    <div class="profile-box">
        <h1>Bienvenido, <%= nombre %>!</h1>
        <p class="intro">Esta es tu plataforma de gestión de soporte técnico.</p>
    </div>

    <div class="notificaciones">
      <i class="fas fa-bell" onclick="toggleNotificaciones()"></i>
      <div id="panelNotificaciones" class="panel-notificaciones">
        <h4>Notificaciones</h4>
        <ul>
          <% if ("ADMIN".equalsIgnoreCase(rol)) { %>
            <li>Se han atendido 3 nuevas solicitudes hoy.</li>
            <li>Tienes 2 solicitudes pendientes de revisar.</li>
          <% } else if ("CLIENTE".equalsIgnoreCase(rol)) { %>
            <li>Tu solicitud del 25/05 fue finalizada.</li>
            <li>Aún está pendiente una solicitud enviada ayer.</li>
          <% } else if ("COLABORADOR".equalsIgnoreCase(rol)) { %>
            <li>Tienes asignadas 4 tareas hoy.</li>
            <li>⚠ Recuerda registrar avances antes de las 5 p.m.</li>
          <% } else { %>
            <li>Bienvenido al sistema de soporte técnico.</li>
          <% } %>
        </ul>
      </div>
    </div>

    <div class="stats-container">
        <div class="card">
            <i class="fas fa-hourglass-half"></i>
            <h2>Solicitudes Pendientes</h2>
            <p>3 solicitudes en cola</p>
        </div>
        <div class="card">
            <i class="fas fa-check-circle"></i>
            <h2>Atendidas</h2>
            <p>12 solicitudes resueltas</p>
        </div>
        <% if ("COLABORADOR".equalsIgnoreCase(rol)) { %>
        <div class="card">
            <i class="fas fa-clock"></i>
            <h2>Horas Registradas</h2>
            <p>24 horas este mes</p>
        </div>
        <% } %>
    </div>

    <div class="panel-container">
        <% if ("ADMIN".equalsIgnoreCase(rol)) { %>
            <div class="panel">
                <i class="fas fa-chart-line"></i>
                <h3>Dashboard</h3>
                <a href="dashboard.jsp">Ir al panel</a>
            </div>
            <div class="panel">
                <i class="fas fa-list"></i>
                <h3>Solicitudes</h3>
                <a href="verSolicitudes.jsp">Ver solicitudes</a>
            </div>
            <div class="panel">
                <i class="fas fa-users"></i>
                <h3>Clientes</h3>
                <a href="listaClientes.jsp">Gestionar clientes</a>
            </div>
            <div class="panel">
                <i class="fas fa-chart-bar"></i>
                <h3>Estadísticas</h3>
                <a href="estadisticas.jsp">Ver estadísticas</a>
            </div>

        <% } else if ("CLIENTE".equalsIgnoreCase(rol)) { %>
            <div class="panel">
                <i class="fas fa-plus-circle"></i>
                <h3>Registrar Solicitud</h3>
                <a href="registrarSolicitud.jsp">Nueva solicitud</a>
            </div>
            <div class="panel">
                <i class="fas fa-list"></i>
                <h3>Mis Solicitudes</h3>
                <a href="misSolicitudes.jsp">Ver historial</a>
            </div>

        <% } else if ("COLABORADOR".equalsIgnoreCase(rol)) { %>
            <div class="panel">
                <i class="fas fa-tasks"></i>
                <h3>Solicitudes Asignadas</h3>
                <a href="solicitudesAsignadas.jsp">Ver tareas</a>
            </div>
            <div class="panel">
                <i class="fas fa-pen"></i>
                <h3>Registrar Avances</h3>
                <a href="avancesColaborador.jsp">Actualizar trabajo</a>
            </div>

        <% } %>
        
            <!-- Ícono de usuario -->
            <div class="perfil-usuario">
              <i class="fas fa-user-circle" onclick="toggleMenu()"></i>
              <div id="menuUsuario" class="menu-usuario">
                <p><strong>Nombre : <%= nombre %></strong></p>
                <p>Perfil : <%= rol %></p>
                <hr>
                <a href="#" onclick="confirmarLogout()">
                    <i class="fas fa-sign-out-alt"></i> Cerrar sesión
                  </a>
              </div>
            </div>

            <!-- Modal de confirmación -->
            <div id="logoutModal" class="modal">
              <div class="modal-content">
                <p>¿Estás seguro de que deseas cerrar sesión?</p>
                <button onclick="cerrarSesion()">Sí, salir</button>
                <button onclick="cerrarModal()">Cancelar</button>
              </div>
            </div>
    </div>

</body>

<script>
  function toggleMenu() {
    const menu = document.getElementById("menuUsuario");
    menu.style.display = menu.style.display === "block" ? "none" : "block";
  }

  function confirmarLogout() {
    document.getElementById("logoutModal").style.display = "flex";
    document.getElementById("menuUsuario").style.display = "none";
  }

  function cerrarModal() {
    document.getElementById("logoutModal").style.display = "none";
  }

  function cerrarSesion() {
    window.location.href = "logout";
  }

  // Cierra el menú si se hace clic afuera
  document.addEventListener("click", function (event) {
    const perfil = document.querySelector(".perfil-usuario");
    const menu = document.getElementById("menuUsuario");
    if (!perfil.contains(event.target)) {
      menu.style.display = "none";
    }
  });
  
  function toggleNotificaciones() {
  const panel = document.getElementById("panelNotificaciones");
  panel.style.display = panel.style.display === "block" ? "none" : "block";
}

// Cierra notificaciones si se hace clic afuera
document.addEventListener("click", function (event) {
  const notif = document.querySelector(".notificaciones");
  const panel = document.getElementById("panelNotificaciones");
  if (!notif.contains(event.target)) {
    panel.style.display = "none";
  }
});
</script>

</html>
