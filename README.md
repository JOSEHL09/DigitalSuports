# 💻 Digital Support - Sistema de Soporte Técnico

Este proyecto es un sistema web desarrollado en Java con arquitectura MVC para la gestión de solicitudes de soporte técnico, ideal para empresas o áreas de TI que manejan requerimientos digitales.

---

## 📂 Estructura del Proyecto

- **Modelo**: Clases Java que representan la lógica de negocio.
- **Vista**: Páginas JSP que forman la interfaz gráfica.
- **Controlador**: Servlets que gestionan la interacción entre vista y modelo.
- **Base de Datos**: SQL Server, conexión vía JDBC.

---

## 🧩 Tecnologías Usadas

- Java 8+
- NetBeans
- JDBC
- SQL Server
- HTML / CSS / JSP
- Git & GitHub

---

## 🧑‍💻 Funcionalidades Principales

✅ Registro e inicio de sesión de usuarios  
✅ Creación y seguimiento de solicitudes  
✅ Asignación de solicitudes a colaboradores  
✅ Registro de actividades realizadas  
✅ Dashboard con estado de solicitudes  
✅ Conexión a base de datos con validación  

---

## 🛠️ Cómo Ejecutar

1. Clona este repositorio:

```bash
git clone https://github.com/JOSEHL09/DigitalSuports.git

## 🗂️ Base de Datos

Este proyecto incluye un archivo llamado `script.sql` ubicado en la raíz del repositorio. Este archivo contiene todos los scripts necesarios para crear la base de datos, las tablas y las relaciones requeridas por el sistema.

### 🧾 Requisitos

- Tener instalado **SQL Server**
- Tener acceso a **SQL Server Management Studio (SSMS)** o un cliente compatible

### ⚙️ Pasos para importar la base de datos

1. Abre **SQL Server Management Studio (SSMS)**
2. Conéctate a tu servidor
3. Crea una base de datos vacía
4. Haz clic derecho sobre ella → `New query`
5. Copia el contenido del archivo `script.sql` o importalo en el SQL Server Management Studio (SSMS)
6. Ejecuta el script (F5)

> 🔐 **Nota**: Asegúrate de configurar correctamente las credenciales de conexión en tu archivo de configuración Java (por ejemplo, en `TestConexionServlet.java`).

