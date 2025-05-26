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
<%
    String success = request.getParameter("success");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registrar Nuevo Cliente</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">

    <style>
      body {
        background-color: #f8f9fa;
      }

      .form-container {
        max-width: 600px;
        margin: 50px auto;
        background: white;
        padding: 30px;
        border-radius: 15px;
        box-shadow: 0 6px 18px rgba(0, 0, 0, 0.1);
      }

      h2 {
        margin-bottom: 25px;
        text-align: center;
        color: #007bff;
      }
    </style>
</head>
<body>

<div class="container">
  <div class="form-container">
    <h2><i class="fas fa-user-plus"></i> Registrar Nuevo Cliente</h2>
    
    <% if ("true".equals(success)) { %>
      <div class="alert alert-success" role="alert">
        <i class="fas fa-check-circle"></i> ¡Registro exitoso!
      </div>
    <% } %>
    
    <form method="post" action="registroCliente.jsp">
      <div class="mb-3">
        <label for="nombre" class="form-label">Nombre *</label>
        <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Ingrese nombre" required>
      </div>

      <div class="mb-3">
        <label for="apellido" class="form-label">Apellido *</label>
        <input type="text" class="form-control" id="apellido" name="apellido" placeholder="Ingrese apellido" required>
      </div>

      <div class="mb-3">
        <label for="email" class="form-label">Correo Electrónico *</label>
        <input type="email" class="form-control" id="email" name="email" placeholder="ejemplo@correo.com" required>
      </div>

      <div class="mb-3">
        <label for="tipoCliente" class="form-label">Tipo de Cliente *</label>
        <select class="form-select" id="tipoCliente" name="tipoCliente" required>
          <option value="" selected disabled>Seleccione tipo</option>
          <option value="Empresa">Empresa</option>
          <option value="Persona natural">Persona natural</option>
        </select>
      </div>

      <div class="mb-3">
        <label for="estado" class="form-label">Estado *</label>
        <select class="form-select" id="estado" name="estado" required>
          <option value="" selected disabled>Seleccione estado</option>
          <option value="Activo">Activo</option>
          <option value="Inactivo">Inactivo</option>
        </select>
      </div>

      <div class="d-flex justify-content-between">
        <a href="listaClientes.jsp" class="btn btn-secondary"><i class="fas fa-arrow-left"></i> Volver</a>
        <button type="submit" class="btn btn-primary"><i class="fas fa-save"></i> Guardar Cliente</button>
      </div>
    </form>
  </div>
</div>
    
    <%
        if ("POST".equalsIgnoreCase(request.getMethod())) {
            
            response.sendRedirect("registroCliente.jsp?success=true");
        }
    %>

</body>
</html>