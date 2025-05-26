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
<html>
<head>
    <meta charset="UTF-8">
    <title>Lista de Clientes</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    <style>
      body {
        background-color: #f8f9fa;
      }
      .dashboard-panel {
        background: linear-gradient(135deg, #007bff, #00c6ff);
        color: white;
        padding: 25px;
        border-radius: 16px;
        box-shadow: 0 8px 24px rgba(0, 123, 255, 0.2);
        text-align: center;
        transition: transform 0.3s ease, box-shadow 0.3s ease;
        position: relative;
        overflow: hidden;
        margin-bottom: 40px;
      }
      .dashboard-panel:hover {
        transform: translateY(-5px);
        box-shadow: 0 12px 30px rgba(0, 123, 255, 0.3);
      }
      .dashboard-panel i {
        font-size: 40px;
        margin-bottom: 12px;
      }
      .dashboard-panel h3 {
        font-size: 22px;
        margin-bottom: 12px;
      }
      .dashboard-panel a {
        display: inline-block;
        margin-top: 10px;
        color: #fff;
        text-decoration: none;
        font-weight: 500;
        border: 1px solid rgba(255, 255, 255, 0.4);
        padding: 6px 16px;
        border-radius: 30px;
        transition: background-color 0.3s ease, color 0.3s ease;
      }
      .dashboard-panel a:hover {
        background-color: #fff;
        color: #007bff;
      }
      .dashboard-panel::after {
        content: "";
        position: absolute;
        top: -50%;
        left: -50%;
        width: 200%;
        height: 200%;
        background: radial-gradient(circle, rgba(255,255,255,0.1) 10%, transparent 60%);
        transform: rotate(25deg);
        animation: shine 8s linear infinite;
        z-index: 0;
      }
      @keyframes shine {
        from { transform: rotate(25deg) translateX(-100%); }
        to { transform: rotate(25deg) translateX(100%); }
      }
      .dashboard-panel > * {
        position: relative;
        z-index: 1;
      }
      /* Botones de acción */
      .btn-sm {
        padding: 0.25rem 0.5rem;
        font-size: 0.75rem;
        border-radius: 0.2rem;
      }
      .me-1 {
        margin-right: 0.25rem;
      }
      input.edit-input {
        width: 100%;
        padding: 2px 6px;
        box-sizing: border-box;
      }
    </style>
</head>
<body>
<div class="container mt-5">

  <div class="dashboard-panel">
    <i class="fas fa-users"></i>
    <h3>Gestión de Clientes</h3>
    <a href="registroCliente.jsp">Registrar Nuevo Cliente</a>
  </div>

  <div class="card shadow-sm">
    <div class="card-header bg-primary text-white">
      <h5 class="mb-0">Listado de Clientes</h5>
    </div>
    <div class="card-body p-0">
      <table class="table table-striped table-bordered mb-0 align-middle" id="clientesTable">
        <thead class="table-light">
          <tr>
            <th>#</th>
            <th>Nombre</th>
            <th>Apellido</th>
            <th>Email</th>
            <th>Tipo Cliente</th>
            <th>Estado</th>
            <th>Acciones</th>
          </tr>
        </thead>
        <tbody>
            <tr data-id="101">
              <td>101</td>
              <td class="editable">Tech Solutions</td>
              <td class="editable">S.A.</td>
              <td class="editable">contact@techsolutions.com</td>
              <td class="editable">Empresa TI</td>
              <td class="editable">Activo</td>
              <td>
                <button class="btn btn-sm btn-warning me-1 btn-edit" title="Editar"><i class="fas fa-edit"></i></button>
                <button class="btn btn-sm btn-danger btn-delete" title="Eliminar"><i class="fas fa-trash-alt"></i></button>
              </td>
            </tr>
            <tr data-id="102">
              <td>102</td>
              <td class="editable">Innovatech</td>
              <td class="editable">Ltd.</td>
              <td class="editable">info@innovatech.com</td>
              <td class="editable">Empresa TI</td>
              <td class="editable">Activo</td>
              <td>
                <button class="btn btn-sm btn-warning me-1 btn-edit" title="Editar"><i class="fas fa-edit"></i></button>
                <button class="btn btn-sm btn-danger btn-delete" title="Eliminar"><i class="fas fa-trash-alt"></i></button>
              </td>
            </tr>
            <tr data-id="103">
              <td>103</td>
              <td class="editable">NetWorks</td>
              <td class="editable">Inc.</td>
              <td class="editable">support@networks.com</td>
              <td class="editable">Empresa TI</td>
              <td class="editable">Inactivo</td>
              <td>
                <button class="btn btn-sm btn-warning me-1 btn-edit" title="Editar"><i class="fas fa-edit"></i></button>
                <button class="btn btn-sm btn-danger btn-delete" title="Eliminar"><i class="fas fa-trash-alt"></i></button>
              </td>
            </tr>
            <tr data-id="104">
              <td>104</td>
              <td class="editable">CyberTech</td>
              <td class="editable">Corp.</td>
              <td class="editable">contact@cybertech.com</td>
              <td class="editable">Empresa TI</td>
              <td class="editable">Activo</td>
              <td>
                <button class="btn btn-sm btn-warning me-1 btn-edit" title="Editar"><i class="fas fa-edit"></i></button>
                <button class="btn btn-sm btn-danger btn-delete" title="Eliminar"><i class="fas fa-trash-alt"></i></button>
              </td>
            </tr>
            <tr data-id="105">
              <td>105</td>
              <td class="editable">DataSoft</td>
              <td class="editable">S.A.</td>
              <td class="editable">info@datasoft.com</td>
              <td class="editable">Empresa TI</td>
              <td class="editable">Activo</td>
              <td>
                <button class="btn btn-sm btn-warning me-1 btn-edit" title="Editar"><i class="fas fa-edit"></i></button>
                <button class="btn btn-sm btn-danger btn-delete" title="Eliminar"><i class="fas fa-trash-alt"></i></button>
              </td>
            </tr>
            <tr data-id="106">
              <td>106</td>
              <td class="editable">CloudNet</td>
              <td class="editable">Ltd.</td>
              <td class="editable">contact@cloudnet.com</td>
              <td class="editable">Empresa TI</td>
              <td class="editable">Inactivo</td>
              <td>
                <button class="btn btn-sm btn-warning me-1 btn-edit" title="Editar"><i class="fas fa-edit"></i></button>
                <button class="btn btn-sm btn-danger btn-delete" title="Eliminar"><i class="fas fa-trash-alt"></i></button>
              </td>
            </tr>
            <tr data-id="107">
              <td>107</td>
              <td class="editable">SoftWare House</td>
              <td class="editable">S.A.</td>
              <td class="editable">contact@softwarehouse.com</td>
              <td class="editable">Empresa TI</td>
              <td class="editable">Activo</td>
              <td>
                <button class="btn btn-sm btn-warning me-1 btn-edit" title="Editar"><i class="fas fa-edit"></i></button>
                <button class="btn btn-sm btn-danger btn-delete" title="Eliminar"><i class="fas fa-trash-alt"></i></button>
              </td>
            </tr>
            <tr data-id="108">
              <td>108</td>
              <td class="editable">IT Dynamics</td>
              <td class="editable">Corp.</td>
              <td class="editable">info@itdynamics.com</td>
              <td class="editable">Empresa TI</td>
              <td class="editable">Activo</td>
              <td>
                <button class="btn btn-sm btn-warning me-1 btn-edit" title="Editar"><i class="fas fa-edit"></i></button>
                <button class="btn btn-sm btn-danger btn-delete" title="Eliminar"><i class="fas fa-trash-alt"></i></button>
              </td>
            </tr>
            <tr data-id="109">
              <td>109</td>
              <td class="editable">NextGen Tech</td>
              <td class="editable">Inc.</td>
              <td class="editable">contact@nextgentech.com</td>
              <td class="editable">Empresa TI</td>
              <td class="editable">Inactivo</td>
              <td>
                <button class="btn btn-sm btn-warning me-1 btn-edit" title="Editar"><i class="fas fa-edit"></i></button>
                <button class="btn btn-sm btn-danger btn-delete" title="Eliminar"><i class="fas fa-trash-alt"></i></button>
              </td>
            </tr>
            <tr data-id="110">
              <td>110</td>
              <td class="editable">Alpha IT</td>
              <td class="editable">Ltd.</td>
              <td class="editable">hello@alphait.com</td>
              <td class="editable">Empresa TI</td>
              <td class="editable">Activo</td>
              <td>
                <button class="btn btn-sm btn-warning me-1 btn-edit" title="Editar"><i class="fas fa-edit"></i></button>
                <button class="btn btn-sm btn-danger btn-delete" title="Eliminar"><i class="fas fa-trash-alt"></i></button>
              </td>
            </tr>
          </tbody>
      </table>
    </div>
  </div>
</div>

<script>
  const table = document.getElementById('clientesTable');
  let editingRow = null;

  table.addEventListener('click', function(e) {
    if (e.target.closest('.btn-delete')) {
      
      const row = e.target.closest('tr');
      const nombre = row.querySelector('td:nth-child(2)').textContent;
      if (confirm(`¿Seguro que deseas eliminar al cliente "${nombre}"?`)) {
        row.remove();
      }
    }

    if (e.target.closest('.btn-edit')) {
      const row = e.target.closest('tr');
      if (editingRow && editingRow !== row) {
        alert('Termina la edición actual antes de editar otra fila.');
        return;
      }
      if (row.classList.contains('editing')) {
       
        saveRow(row);
      } else {
    
        editRow(row);
      }
    }
  });

  function editRow(row) {
    editingRow = row;
    row.classList.add('editing');
    const cells = row.querySelectorAll('.editable');
    cells.forEach(cell => {
      const text = cell.textContent;
      const input = document.createElement('input');
      input.type = 'text';
      input.className = 'edit-input form-control form-control-sm';
      input.value = text;
      cell.textContent = '';
      cell.appendChild(input);
    });
 
    const btnEdit = row.querySelector('.btn-edit');
    btnEdit.innerHTML = '<i class="fas fa-save"></i>';
    btnEdit.title = "Guardar";
    

    let btnCancel = document.createElement('button');
    btnCancel.className = 'btn btn-sm btn-secondary ms-1 btn-cancel';
    btnCancel.title = "Cancelar";
    btnCancel.innerHTML = '<i class="fas fa-times"></i>';
    btnCancel.onclick = () => cancelEdit(row);
    btnEdit.after(btnCancel);
  }

  function saveRow(row) {
    const inputs = row.querySelectorAll('input.edit-input');
    inputs.forEach(input => {
      const cell = input.parentElement;
      cell.textContent = input.value.trim() || '[vacío]';
    });
    endEditing(row);
  }

  function cancelEdit(row) {
    const inputs = row.querySelectorAll('input.edit-input');
    inputs.forEach(input => {
      const cell = input.parentElement;
      cell.textContent = input.defaultValue;
    });
    endEditing(row);
  }

  function endEditing(row) {
    editingRow = null;
    row.classList.remove('editing');
    const btnEdit = row.querySelector('.btn-edit');
    btnEdit.innerHTML = '<i class="fas fa-edit"></i>';
    btnEdit.title = "Editar";
    const btnCancel = row.querySelector('.btn-cancel');
    if (btnCancel) btnCancel.remove();
  }
</script>
</body>
</html>