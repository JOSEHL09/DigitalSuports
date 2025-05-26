<%-- 
    Document   : login
    Created on : 20 abr 2025, 20:50:12
    Author     : huama
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Iniciar Sesión</title>
    <style>
        /* Fondo degradado */
        body {
            margin: 0;
            height: 100vh;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea, #764ba2);
            display: flex;
            justify-content: center;
            align-items: center;
            color: #fff;
        }

        /* Contenedor del formulario */
        .login-container {
            background: rgba(0, 0, 0, 0.65);
            padding: 40px 50px;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.3);
            width: 350px;
            text-align: center;
        }

        .login-container h2 {
            margin-bottom: 30px;
            font-weight: 700;
            font-size: 28px;
            letter-spacing: 1px;
            text-transform: uppercase;
            color: #ffd700;
            text-shadow: 1px 1px 5px rgba(255, 215, 0, 0.7);
        }

        /* Inputs */
        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 12px 15px;
            margin: 12px 0 24px 0;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            outline: none;
            transition: 0.3s ease;
        }

        input[type="email"]:focus,
        input[type="password"]:focus {
            box-shadow: 0 0 8px #ffd700;
            background-color: #fff;
            color: #333;
        }

        /* Botón */
        button {
            width: 100%;
            padding: 14px 0;
            background-color: #ffd700;
            border: none;
            border-radius: 8px;
            font-weight: 700;
            font-size: 18px;
            cursor: pointer;
            color: #333;
            transition: background-color 0.3s ease;
            box-shadow: 0 4px 10px rgba(255, 215, 0, 0.7);
        }

        button:hover {
            background-color: #ffc107;
            box-shadow: 0 6px 15px rgba(255, 193, 7, 0.9);
        }

        /* Label */
        label {
            display: block;
            font-weight: 600;
            font-size: 14px;
            margin-bottom: 6px;
            text-align: left;
            color: #ffd700;
            text-shadow: 1px 1px 2px rgba(255, 215, 0, 0.9);
        }
    </style>
</head>
<body>

    <div class="login-container">
        <h2>Iniciar Sesión</h2>
        <form action="#" method="POST" id="loginForm">
            <label for="email">Correo Electrónico:</label>
            <input type="email" id="email" name="email" placeholder="usuario@ejemplo.com" required />

            <label for="contrasena">Contraseña:</label>
            <input type="password" id="contrasena" name="contrasena" placeholder="••••••••" required />

            <button type="submit">Ingresar</button>
        </form>
    </div>

    <!-- Aquí pegas el script justo antes de cerrar body -->
    <script>
    document.getElementById('loginForm').addEventListener('submit', function(e) {
        e.preventDefault();

        const email = document.getElementById('email').value;
        const contrasena = document.getElementById('contrasena').value;

        fetch('api/login', {
            method: 'POST',
            headers: {'Content-Type': 'application/json'},
            body: JSON.stringify({ email, contrasena })
        })
        .then(res => {
            if (!res.ok) throw new Error('Error en autenticación');
            return res.json();
        })
        .then(data => {
            console.log('Usuario logueado:', data);
            
            window.location.href = 'View/index.jsp';
        })
        .catch(err => {
            alert(err.message);
        });
    });
    </script>
</body>
</html>
