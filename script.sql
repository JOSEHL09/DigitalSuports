USE [master]
GO
/****** Object:  Database [BD_SOPORTE_DIGITAL]    Script Date: 21/04/2025 18:06:59 ******/
CREATE DATABASE [BD_SOPORTE_DIGITAL]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BD_SOPORTE_DIGITAL', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\BD_SOPORTE_DIGITAL.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BD_SOPORTE_DIGITAL_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\BD_SOPORTE_DIGITAL_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [BD_SOPORTE_DIGITAL] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BD_SOPORTE_DIGITAL].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BD_SOPORTE_DIGITAL] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BD_SOPORTE_DIGITAL] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BD_SOPORTE_DIGITAL] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BD_SOPORTE_DIGITAL] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BD_SOPORTE_DIGITAL] SET ARITHABORT OFF 
GO
ALTER DATABASE [BD_SOPORTE_DIGITAL] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BD_SOPORTE_DIGITAL] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BD_SOPORTE_DIGITAL] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BD_SOPORTE_DIGITAL] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BD_SOPORTE_DIGITAL] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BD_SOPORTE_DIGITAL] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BD_SOPORTE_DIGITAL] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BD_SOPORTE_DIGITAL] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BD_SOPORTE_DIGITAL] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BD_SOPORTE_DIGITAL] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BD_SOPORTE_DIGITAL] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BD_SOPORTE_DIGITAL] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BD_SOPORTE_DIGITAL] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BD_SOPORTE_DIGITAL] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BD_SOPORTE_DIGITAL] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BD_SOPORTE_DIGITAL] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BD_SOPORTE_DIGITAL] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BD_SOPORTE_DIGITAL] SET RECOVERY FULL 
GO
ALTER DATABASE [BD_SOPORTE_DIGITAL] SET  MULTI_USER 
GO
ALTER DATABASE [BD_SOPORTE_DIGITAL] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BD_SOPORTE_DIGITAL] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BD_SOPORTE_DIGITAL] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BD_SOPORTE_DIGITAL] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BD_SOPORTE_DIGITAL] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BD_SOPORTE_DIGITAL] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'BD_SOPORTE_DIGITAL', N'ON'
GO
ALTER DATABASE [BD_SOPORTE_DIGITAL] SET QUERY_STORE = ON
GO
ALTER DATABASE [BD_SOPORTE_DIGITAL] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [BD_SOPORTE_DIGITAL]
GO
/****** Object:  Schema [DigitalSuport]    Script Date: 21/04/2025 18:07:00 ******/
CREATE SCHEMA [DigitalSuport]
GO
/****** Object:  Table [DigitalSuport].[TBL_COLABORADOR]    Script Date: 21/04/2025 18:07:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DigitalSuport].[TBL_COLABORADOR](
	[nIdColaborador] [int] IDENTITY(1,1) NOT NULL,
	[sNombre] [varchar](50) NOT NULL,
	[sApellido] [varchar](50) NOT NULL,
	[sEmail] [varchar](100) NOT NULL,
	[sContrasena] [varchar](100) NOT NULL,
	[nIdRolColaborador] [int] NOT NULL,
	[bEstado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[nIdColaborador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [DigitalSuport].[TBL_DETALLE_SOLICITUD]    Script Date: 21/04/2025 18:07:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DigitalSuport].[TBL_DETALLE_SOLICITUD](
	[nIdDetalleSolicitud] [int] IDENTITY(1,1) NOT NULL,
	[nIdUsuario] [int] NOT NULL,
	[nIdTipoSolicitud] [int] NOT NULL,
	[sMotivo] [varchar](max) NOT NULL,
	[dFechaCreacion] [datetime] NOT NULL,
	[dFechaFinalizacion] [datetime] NULL,
	[sEstado] [varchar](20) NULL,
	[bEstado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[nIdDetalleSolicitud] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [DigitalSuport].[TBL_REGISTRO_TRABAJO]    Script Date: 21/04/2025 18:07:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DigitalSuport].[TBL_REGISTRO_TRABAJO](
	[nIdRegistroTrabajo] [int] IDENTITY(1,1) NOT NULL,
	[nIdDetalleSolicitud] [int] NOT NULL,
	[nIdColaborador] [int] NOT NULL,
	[dFecha] [date] NOT NULL,
	[sActividad] [varchar](max) NOT NULL,
	[nHorasTrabajadas] [decimal](4, 2) NOT NULL,
	[bEstado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[nIdRegistroTrabajo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [DigitalSuport].[TBL_ROL_COLABORADOR]    Script Date: 21/04/2025 18:07:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DigitalSuport].[TBL_ROL_COLABORADOR](
	[nIdRolColaborador] [int] IDENTITY(1,1) NOT NULL,
	[sDescripcion] [varchar](50) NOT NULL,
	[bEstado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[nIdRolColaborador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [DigitalSuport].[TBL_SOLICITUD_COLABORADOR]    Script Date: 21/04/2025 18:07:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DigitalSuport].[TBL_SOLICITUD_COLABORADOR](
	[nIdSolicitudColaborador] [int] NULL,
	[nIdColaborador] [int] NULL,
	[bEsCoordinador] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [DigitalSuport].[TBL_TIPO_SOLICITUD]    Script Date: 21/04/2025 18:07:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DigitalSuport].[TBL_TIPO_SOLICITUD](
	[nIdTipoSolicitud] [int] IDENTITY(1,1) NOT NULL,
	[sDescripcion] [varchar](max) NOT NULL,
	[bEstado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[nIdTipoSolicitud] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [DigitalSuport].[TBL_TIPO_USUARIO]    Script Date: 21/04/2025 18:07:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DigitalSuport].[TBL_TIPO_USUARIO](
	[nIdTipoUsuario] [int] IDENTITY(1,1) NOT NULL,
	[sDescripcion] [varchar](50) NOT NULL,
	[bEstado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[nIdTipoUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [DigitalSuport].[TBL_USUARIO]    Script Date: 21/04/2025 18:07:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DigitalSuport].[TBL_USUARIO](
	[nIdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[sNombre] [varchar](50) NOT NULL,
	[sApellido] [varchar](50) NOT NULL,
	[sGenero] [varchar](15) NOT NULL,
	[nEdad] [int] NOT NULL,
	[dFechaNacimiento] [date] NOT NULL,
	[sEmail] [varchar](100) NOT NULL,
	[sContrasena] [varchar](100) NOT NULL,
	[nIdTipoUsuario] [int] NOT NULL,
	[bEstado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[nIdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [DigitalSuport].[TBL_COLABORADOR] ON 

INSERT [DigitalSuport].[TBL_COLABORADOR] ([nIdColaborador], [sNombre], [sApellido], [sEmail], [sContrasena], [nIdRolColaborador], [bEstado]) VALUES (1, N'Pedro', N'Martinez', N'pmartinez@123digit.com', N'pedropass', 4, 1)
INSERT [DigitalSuport].[TBL_COLABORADOR] ([nIdColaborador], [sNombre], [sApellido], [sEmail], [sContrasena], [nIdRolColaborador], [bEstado]) VALUES (2, N'Lucia', N'Gomez', N'lgomez@123digit.com', N'luciapass', 1, 1)
INSERT [DigitalSuport].[TBL_COLABORADOR] ([nIdColaborador], [sNombre], [sApellido], [sEmail], [sContrasena], [nIdRolColaborador], [bEstado]) VALUES (3, N'Jorge', N'Fernandez', N'jfernandez@123digit.com', N'jorgepass', 3, 1)
INSERT [DigitalSuport].[TBL_COLABORADOR] ([nIdColaborador], [sNombre], [sApellido], [sEmail], [sContrasena], [nIdRolColaborador], [bEstado]) VALUES (4, N'Ana', N'Quispe', N'aquispe@123digit.com', N'anapass', 2, 1)
INSERT [DigitalSuport].[TBL_COLABORADOR] ([nIdColaborador], [sNombre], [sApellido], [sEmail], [sContrasena], [nIdRolColaborador], [bEstado]) VALUES (5, N'Marco', N'Velarde', N'mvelarde@123digit.com', N'Velarde123', 1, 1)
INSERT [DigitalSuport].[TBL_COLABORADOR] ([nIdColaborador], [sNombre], [sApellido], [sEmail], [sContrasena], [nIdRolColaborador], [bEstado]) VALUES (6, N'Luciana', N'Meza', N'lmeza@123digit.com', N'LuciMez2024', 2, 1)
INSERT [DigitalSuport].[TBL_COLABORADOR] ([nIdColaborador], [sNombre], [sApellido], [sEmail], [sContrasena], [nIdRolColaborador], [bEstado]) VALUES (7, N'Jorge', N'Reyna', N'jreyna@123digit.com', N'JRey23$$', 6, 1)
INSERT [DigitalSuport].[TBL_COLABORADOR] ([nIdColaborador], [sNombre], [sApellido], [sEmail], [sContrasena], [nIdRolColaborador], [bEstado]) VALUES (8, N'Korrina', N'Rapzel', N'krapzel@123digit.com', N'RapsFlower432*', 3, 1)
INSERT [DigitalSuport].[TBL_COLABORADOR] ([nIdColaborador], [sNombre], [sApellido], [sEmail], [sContrasena], [nIdRolColaborador], [bEstado]) VALUES (9, N'Tatiana', N'Silva', N'tsilva@123digit.com', N'TatSilv89*', 5, 1)
INSERT [DigitalSuport].[TBL_COLABORADOR] ([nIdColaborador], [sNombre], [sApellido], [sEmail], [sContrasena], [nIdRolColaborador], [bEstado]) VALUES (10, N'Carlos', N'Aranda', N'caranda@123digit.com', N'AranCarlo01#', 3, 1)
INSERT [DigitalSuport].[TBL_COLABORADOR] ([nIdColaborador], [sNombre], [sApellido], [sEmail], [sContrasena], [nIdRolColaborador], [bEstado]) VALUES (11, N'Leyla', N'Rangel', N'lrangel@123digit.com', N'kimrang$216', 6, 1)
SET IDENTITY_INSERT [DigitalSuport].[TBL_COLABORADOR] OFF
GO
SET IDENTITY_INSERT [DigitalSuport].[TBL_DETALLE_SOLICITUD] ON 

INSERT [DigitalSuport].[TBL_DETALLE_SOLICITUD] ([nIdDetalleSolicitud], [nIdUsuario], [nIdTipoSolicitud], [sMotivo], [dFechaCreacion], [dFechaFinalizacion], [sEstado], [bEstado]) VALUES (1, 2, 1, N'El sistema se cierra inesperadamente al generar reportes.', CAST(N'2025-04-10T10:00:00.000' AS DateTime), NULL, N'Pendiente', 1)
INSERT [DigitalSuport].[TBL_DETALLE_SOLICITUD] ([nIdDetalleSolicitud], [nIdUsuario], [nIdTipoSolicitud], [sMotivo], [dFechaCreacion], [dFechaFinalizacion], [sEstado], [bEstado]) VALUES (2, 1, 2, N'Deseo una capacitación sobre el nuevo módulo de ventas.', CAST(N'2025-04-12T15:30:00.000' AS DateTime), NULL, N'En Proceso', 1)
INSERT [DigitalSuport].[TBL_DETALLE_SOLICITUD] ([nIdDetalleSolicitud], [nIdUsuario], [nIdTipoSolicitud], [sMotivo], [dFechaCreacion], [dFechaFinalizacion], [sEstado], [bEstado]) VALUES (3, 3, 3, N'Solicito un nuevo módulo para manejo de inventario en tiempo real.', CAST(N'2025-04-15T09:45:00.000' AS DateTime), NULL, N'Pendiente', 1)
INSERT [DigitalSuport].[TBL_DETALLE_SOLICITUD] ([nIdDetalleSolicitud], [nIdUsuario], [nIdTipoSolicitud], [sMotivo], [dFechaCreacion], [dFechaFinalizacion], [sEstado], [bEstado]) VALUES (4, 3, 1, N'Solicita reinstalación del software por errores recurrentes.', CAST(N'2025-04-15T09:45:00.000' AS DateTime), NULL, N'En Proceso', 1)
INSERT [DigitalSuport].[TBL_DETALLE_SOLICITUD] ([nIdDetalleSolicitud], [nIdUsuario], [nIdTipoSolicitud], [sMotivo], [dFechaCreacion], [dFechaFinalizacion], [sEstado], [bEstado]) VALUES (5, 6, 4, N'Laptop no enciende. Posible problema en la placa.', CAST(N'2025-04-12T14:20:00.000' AS DateTime), NULL, N'Pendiente', 1)
INSERT [DigitalSuport].[TBL_DETALLE_SOLICITUD] ([nIdDetalleSolicitud], [nIdUsuario], [nIdTipoSolicitud], [sMotivo], [dFechaCreacion], [dFechaFinalizacion], [sEstado], [bEstado]) VALUES (6, 5, 5, N'Red no disponible', CAST(N'2025-04-10T08:10:00.000' AS DateTime), CAST(N'2025-04-11T16:30:00.000' AS DateTime), N'Finalizado', 0)
INSERT [DigitalSuport].[TBL_DETALLE_SOLICITUD] ([nIdDetalleSolicitud], [nIdUsuario], [nIdTipoSolicitud], [sMotivo], [dFechaCreacion], [dFechaFinalizacion], [sEstado], [bEstado]) VALUES (7, 4, 6, N'Solicitud de mantenimiento general preventivo.', CAST(N'2025-04-16T11:55:00.000' AS DateTime), NULL, N'Pendiente', 1)
SET IDENTITY_INSERT [DigitalSuport].[TBL_DETALLE_SOLICITUD] OFF
GO
SET IDENTITY_INSERT [DigitalSuport].[TBL_REGISTRO_TRABAJO] ON 

INSERT [DigitalSuport].[TBL_REGISTRO_TRABAJO] ([nIdRegistroTrabajo], [nIdDetalleSolicitud], [nIdColaborador], [dFecha], [sActividad], [nHorasTrabajadas], [bEstado]) VALUES (1, 1, 1, CAST(N'2025-04-11' AS Date), N'Análisis del error reportado por el cliente', CAST(2.50 AS Decimal(4, 2)), 1)
INSERT [DigitalSuport].[TBL_REGISTRO_TRABAJO] ([nIdRegistroTrabajo], [nIdDetalleSolicitud], [nIdColaborador], [dFecha], [sActividad], [nHorasTrabajadas], [bEstado]) VALUES (2, 1, 3, CAST(N'2025-04-11' AS Date), N'Revisión de logs y debugging del sistema', CAST(3.00 AS Decimal(4, 2)), 1)
INSERT [DigitalSuport].[TBL_REGISTRO_TRABAJO] ([nIdRegistroTrabajo], [nIdDetalleSolicitud], [nIdColaborador], [dFecha], [sActividad], [nHorasTrabajadas], [bEstado]) VALUES (3, 2, 2, CAST(N'2025-03-30' AS Date), N'Preparación del material para la capacitación', CAST(1.50 AS Decimal(4, 2)), 1)
INSERT [DigitalSuport].[TBL_REGISTRO_TRABAJO] ([nIdRegistroTrabajo], [nIdDetalleSolicitud], [nIdColaborador], [dFecha], [sActividad], [nHorasTrabajadas], [bEstado]) VALUES (4, 2, 4, CAST(N'2025-03-30' AS Date), N'Capacitación remota vía Zoom', CAST(2.00 AS Decimal(4, 2)), 1)
INSERT [DigitalSuport].[TBL_REGISTRO_TRABAJO] ([nIdRegistroTrabajo], [nIdDetalleSolicitud], [nIdColaborador], [dFecha], [sActividad], [nHorasTrabajadas], [bEstado]) VALUES (5, 3, 1, CAST(N'2025-05-05' AS Date), N'Revisión de requerimientos del cliente', CAST(2.00 AS Decimal(4, 2)), 1)
INSERT [DigitalSuport].[TBL_REGISTRO_TRABAJO] ([nIdRegistroTrabajo], [nIdDetalleSolicitud], [nIdColaborador], [dFecha], [sActividad], [nHorasTrabajadas], [bEstado]) VALUES (6, 3, 2, CAST(N'2025-05-05' AS Date), N'Diseño preliminar del nuevo módulo', CAST(2.50 AS Decimal(4, 2)), 1)
INSERT [DigitalSuport].[TBL_REGISTRO_TRABAJO] ([nIdRegistroTrabajo], [nIdDetalleSolicitud], [nIdColaborador], [dFecha], [sActividad], [nHorasTrabajadas], [bEstado]) VALUES (7, 4, 5, CAST(N'2025-04-15' AS Date), N'Actualización del sistema operativo en equipos cliente', CAST(2.00 AS Decimal(4, 2)), 1)
INSERT [DigitalSuport].[TBL_REGISTRO_TRABAJO] ([nIdRegistroTrabajo], [nIdDetalleSolicitud], [nIdColaborador], [dFecha], [sActividad], [nHorasTrabajadas], [bEstado]) VALUES (8, 4, 7, CAST(N'2025-04-15' AS Date), N'Supervisión de la actualización y validación de servicios', CAST(2.50 AS Decimal(4, 2)), 1)
INSERT [DigitalSuport].[TBL_REGISTRO_TRABAJO] ([nIdRegistroTrabajo], [nIdDetalleSolicitud], [nIdColaborador], [dFecha], [sActividad], [nHorasTrabajadas], [bEstado]) VALUES (9, 5, 9, CAST(N'2025-04-17' AS Date), N'Implementación de nuevo antivirus en estación de trabajo', CAST(3.00 AS Decimal(4, 2)), 1)
INSERT [DigitalSuport].[TBL_REGISTRO_TRABAJO] ([nIdRegistroTrabajo], [nIdDetalleSolicitud], [nIdColaborador], [dFecha], [sActividad], [nHorasTrabajadas], [bEstado]) VALUES (10, 5, 6, CAST(N'2025-04-17' AS Date), N'Revisión de seguridad posterior a instalación', CAST(2.00 AS Decimal(4, 2)), 1)
INSERT [DigitalSuport].[TBL_REGISTRO_TRABAJO] ([nIdRegistroTrabajo], [nIdDetalleSolicitud], [nIdColaborador], [dFecha], [sActividad], [nHorasTrabajadas], [bEstado]) VALUES (11, 6, 8, CAST(N'2025-04-18' AS Date), N'Verificación de conexiones de red en sede secundaria', CAST(1.50 AS Decimal(4, 2)), 1)
INSERT [DigitalSuport].[TBL_REGISTRO_TRABAJO] ([nIdRegistroTrabajo], [nIdDetalleSolicitud], [nIdColaborador], [dFecha], [sActividad], [nHorasTrabajadas], [bEstado]) VALUES (12, 6, 11, CAST(N'2025-04-18' AS Date), N'Reporte técnico entregado a soporte central', CAST(2.50 AS Decimal(4, 2)), 1)
SET IDENTITY_INSERT [DigitalSuport].[TBL_REGISTRO_TRABAJO] OFF
GO
SET IDENTITY_INSERT [DigitalSuport].[TBL_ROL_COLABORADOR] ON 

INSERT [DigitalSuport].[TBL_ROL_COLABORADOR] ([nIdRolColaborador], [sDescripcion], [bEstado]) VALUES (1, N'Analista', 1)
INSERT [DigitalSuport].[TBL_ROL_COLABORADOR] ([nIdRolColaborador], [sDescripcion], [bEstado]) VALUES (2, N'Diseñador', 1)
INSERT [DigitalSuport].[TBL_ROL_COLABORADOR] ([nIdRolColaborador], [sDescripcion], [bEstado]) VALUES (3, N'Programador', 1)
INSERT [DigitalSuport].[TBL_ROL_COLABORADOR] ([nIdRolColaborador], [sDescripcion], [bEstado]) VALUES (4, N'Soporte Técnico', 1)
INSERT [DigitalSuport].[TBL_ROL_COLABORADOR] ([nIdRolColaborador], [sDescripcion], [bEstado]) VALUES (5, N'Coordinador', 1)
INSERT [DigitalSuport].[TBL_ROL_COLABORADOR] ([nIdRolColaborador], [sDescripcion], [bEstado]) VALUES (6, N'Ingeniero de Redes', 1)
SET IDENTITY_INSERT [DigitalSuport].[TBL_ROL_COLABORADOR] OFF
GO
INSERT [DigitalSuport].[TBL_SOLICITUD_COLABORADOR] ([nIdSolicitudColaborador], [nIdColaborador], [bEsCoordinador]) VALUES (1, 1, 0)
INSERT [DigitalSuport].[TBL_SOLICITUD_COLABORADOR] ([nIdSolicitudColaborador], [nIdColaborador], [bEsCoordinador]) VALUES (1, 3, 1)
INSERT [DigitalSuport].[TBL_SOLICITUD_COLABORADOR] ([nIdSolicitudColaborador], [nIdColaborador], [bEsCoordinador]) VALUES (2, 2, 0)
INSERT [DigitalSuport].[TBL_SOLICITUD_COLABORADOR] ([nIdSolicitudColaborador], [nIdColaborador], [bEsCoordinador]) VALUES (2, 4, 1)
INSERT [DigitalSuport].[TBL_SOLICITUD_COLABORADOR] ([nIdSolicitudColaborador], [nIdColaborador], [bEsCoordinador]) VALUES (3, 1, 0)
INSERT [DigitalSuport].[TBL_SOLICITUD_COLABORADOR] ([nIdSolicitudColaborador], [nIdColaborador], [bEsCoordinador]) VALUES (3, 2, 1)
INSERT [DigitalSuport].[TBL_SOLICITUD_COLABORADOR] ([nIdSolicitudColaborador], [nIdColaborador], [bEsCoordinador]) VALUES (4, 5, 0)
INSERT [DigitalSuport].[TBL_SOLICITUD_COLABORADOR] ([nIdSolicitudColaborador], [nIdColaborador], [bEsCoordinador]) VALUES (4, 7, 1)
INSERT [DigitalSuport].[TBL_SOLICITUD_COLABORADOR] ([nIdSolicitudColaborador], [nIdColaborador], [bEsCoordinador]) VALUES (5, 9, 0)
INSERT [DigitalSuport].[TBL_SOLICITUD_COLABORADOR] ([nIdSolicitudColaborador], [nIdColaborador], [bEsCoordinador]) VALUES (5, 6, 1)
INSERT [DigitalSuport].[TBL_SOLICITUD_COLABORADOR] ([nIdSolicitudColaborador], [nIdColaborador], [bEsCoordinador]) VALUES (6, 8, 0)
INSERT [DigitalSuport].[TBL_SOLICITUD_COLABORADOR] ([nIdSolicitudColaborador], [nIdColaborador], [bEsCoordinador]) VALUES (6, 11, 1)
GO
SET IDENTITY_INSERT [DigitalSuport].[TBL_TIPO_SOLICITUD] ON 

INSERT [DigitalSuport].[TBL_TIPO_SOLICITUD] ([nIdTipoSolicitud], [sDescripcion], [bEstado]) VALUES (1, N'Error de Software', 1)
INSERT [DigitalSuport].[TBL_TIPO_SOLICITUD] ([nIdTipoSolicitud], [sDescripcion], [bEstado]) VALUES (2, N'Capacitación sobre uso del software', 1)
INSERT [DigitalSuport].[TBL_TIPO_SOLICITUD] ([nIdTipoSolicitud], [sDescripcion], [bEstado]) VALUES (3, N'Requerimiento de Software', 1)
INSERT [DigitalSuport].[TBL_TIPO_SOLICITUD] ([nIdTipoSolicitud], [sDescripcion], [bEstado]) VALUES (4, N'Reparación de hardware', 1)
INSERT [DigitalSuport].[TBL_TIPO_SOLICITUD] ([nIdTipoSolicitud], [sDescripcion], [bEstado]) VALUES (5, N'Configuración de red', 1)
INSERT [DigitalSuport].[TBL_TIPO_SOLICITUD] ([nIdTipoSolicitud], [sDescripcion], [bEstado]) VALUES (6, N'Mantenimiento preventivo', 1)
SET IDENTITY_INSERT [DigitalSuport].[TBL_TIPO_SOLICITUD] OFF
GO
SET IDENTITY_INSERT [DigitalSuport].[TBL_TIPO_USUARIO] ON 

INSERT [DigitalSuport].[TBL_TIPO_USUARIO] ([nIdTipoUsuario], [sDescripcion], [bEstado]) VALUES (1, N'Administrador', 1)
INSERT [DigitalSuport].[TBL_TIPO_USUARIO] ([nIdTipoUsuario], [sDescripcion], [bEstado]) VALUES (2, N'Supervisor', 1)
INSERT [DigitalSuport].[TBL_TIPO_USUARIO] ([nIdTipoUsuario], [sDescripcion], [bEstado]) VALUES (3, N'Cliente Individual', 1)
INSERT [DigitalSuport].[TBL_TIPO_USUARIO] ([nIdTipoUsuario], [sDescripcion], [bEstado]) VALUES (4, N'Cliente Empresa', 1)
SET IDENTITY_INSERT [DigitalSuport].[TBL_TIPO_USUARIO] OFF
GO
SET IDENTITY_INSERT [DigitalSuport].[TBL_USUARIO] ON 

INSERT [DigitalSuport].[TBL_USUARIO] ([nIdUsuario], [sNombre], [sApellido], [sGenero], [nEdad], [dFechaNacimiento], [sEmail], [sContrasena], [nIdTipoUsuario], [bEstado]) VALUES (1, N'Alessandro Sebastian', N'Arroyo Guerra', N'Masculino', 21, CAST(N'2003-09-07' AS Date), N'alargu@gmail.com', N'GotyPoseidon2003', 1, 1)
INSERT [DigitalSuport].[TBL_USUARIO] ([nIdUsuario], [sNombre], [sApellido], [sGenero], [nEdad], [dFechaNacimiento], [sEmail], [sContrasena], [nIdTipoUsuario], [bEstado]) VALUES (2, N'Fabrizio Joshue', N'Cuno Barrios', N'Masculino', 20, CAST(N'2005-03-22' AS Date), N'facuba@gmail.com', N'Picosa22', 1, 1)
INSERT [DigitalSuport].[TBL_USUARIO] ([nIdUsuario], [sNombre], [sApellido], [sGenero], [nEdad], [dFechaNacimiento], [sEmail], [sContrasena], [nIdTipoUsuario], [bEstado]) VALUES (3, N'Alessandra Janeth', N'Tito Leon', N'Femenino', 22, CAST(N'2003-10-15' AS Date), N'altile@gmail.com', N'Radiant03', 1, 1)
INSERT [DigitalSuport].[TBL_USUARIO] ([nIdUsuario], [sNombre], [sApellido], [sGenero], [nEdad], [dFechaNacimiento], [sEmail], [sContrasena], [nIdTipoUsuario], [bEstado]) VALUES (4, N'Jose', N'Huamani Ledesma', N'Masculino', 24, CAST(N'2001-05-19' AS Date), N'johule@gmail.com', N'20IEaaaHS', 2, 1)
INSERT [DigitalSuport].[TBL_USUARIO] ([nIdUsuario], [sNombre], [sApellido], [sGenero], [nEdad], [dFechaNacimiento], [sEmail], [sContrasena], [nIdTipoUsuario], [bEstado]) VALUES (5, N'Jeremy Giampierre', N'Perez Gavidia', N'Masculino', 19, CAST(N'2006-01-30' AS Date), N'jepega@gmail.com', N'gigavi12JP', 2, 1)
INSERT [DigitalSuport].[TBL_USUARIO] ([nIdUsuario], [sNombre], [sApellido], [sGenero], [nEdad], [dFechaNacimiento], [sEmail], [sContrasena], [nIdTipoUsuario], [bEstado]) VALUES (6, N'Eduard', N'Nighbord kirwayo', N'Masculino', 36, CAST(N'1989-02-25' AS Date), N'edniki@gmail.com', N'KezmanHerodes02', 2, 1)
INSERT [DigitalSuport].[TBL_USUARIO] ([nIdUsuario], [sNombre], [sApellido], [sGenero], [nEdad], [dFechaNacimiento], [sEmail], [sContrasena], [nIdTipoUsuario], [bEstado]) VALUES (7, N'Camila Estefanía', N'Morales Díaz', N'Femenino', 27, CAST(N'1997-02-18' AS Date), N'camilamorales@gmail.com', N'EstefCami97!', 3, 1)
INSERT [DigitalSuport].[TBL_USUARIO] ([nIdUsuario], [sNombre], [sApellido], [sGenero], [nEdad], [dFechaNacimiento], [sEmail], [sContrasena], [nIdTipoUsuario], [bEstado]) VALUES (8, N'Juan Pablo', N'Cruz Herrera', N'Masculino', 35, CAST(N'1989-06-30' AS Date), N'juancruz89@gmail.com', N'JuanPabloCH1989$', 3, 1)
INSERT [DigitalSuport].[TBL_USUARIO] ([nIdUsuario], [sNombre], [sApellido], [sGenero], [nEdad], [dFechaNacimiento], [sEmail], [sContrasena], [nIdTipoUsuario], [bEstado]) VALUES (9, N'Valentina Sofía', N'López Mendoza', N'Femenino', 22, CAST(N'2002-03-14' AS Date), N'valentinalopezm@gmail.com', N'ValenSof02#', 3, 1)
INSERT [DigitalSuport].[TBL_USUARIO] ([nIdUsuario], [sNombre], [sApellido], [sGenero], [nEdad], [dFechaNacimiento], [sEmail], [sContrasena], [nIdTipoUsuario], [bEstado]) VALUES (10, N'Mateo Daniel', N'Ramírez Torres', N'Masculino', 19, CAST(N'2005-10-22' AS Date), N'mateoramirez@gmail.com', N'R@mirezT2005', 3, 1)
INSERT [DigitalSuport].[TBL_USUARIO] ([nIdUsuario], [sNombre], [sApellido], [sGenero], [nEdad], [dFechaNacimiento], [sEmail], [sContrasena], [nIdTipoUsuario], [bEstado]) VALUES (11, N'Lucía Fernanda', N'Gómez Paredes', N'Femenino', 30, CAST(N'1994-01-09' AS Date), N'luciagomez@gmail.com', N'LucGom94$', 3, 1)
INSERT [DigitalSuport].[TBL_USUARIO] ([nIdUsuario], [sNombre], [sApellido], [sGenero], [nEdad], [dFechaNacimiento], [sEmail], [sContrasena], [nIdTipoUsuario], [bEstado]) VALUES (12, N'Diego Alejandro', N'Salas Ríos', N'Masculino', 26, CAST(N'1998-05-17' AS Date), N'diegosalas@gmail.com', N'AlejSalas98*', 3, 1)
INSERT [DigitalSuport].[TBL_USUARIO] ([nIdUsuario], [sNombre], [sApellido], [sGenero], [nEdad], [dFechaNacimiento], [sEmail], [sContrasena], [nIdTipoUsuario], [bEstado]) VALUES (13, N'Isabella Andrea', N'Navarro Ruiz', N'Femenino', 24, CAST(N'2000-11-11' AS Date), N'isabellanavarro@gmail.com', N'NavRuizIsa24', 3, 1)
INSERT [DigitalSuport].[TBL_USUARIO] ([nIdUsuario], [sNombre], [sApellido], [sGenero], [nEdad], [dFechaNacimiento], [sEmail], [sContrasena], [nIdTipoUsuario], [bEstado]) VALUES (14, N'Sofía Julieta', N'Campos Soto', N'Femenino', 28, CAST(N'1996-04-25' AS Date), N'sofiacampos@gmail.com', N'SofiCam96$', 3, 1)
INSERT [DigitalSuport].[TBL_USUARIO] ([nIdUsuario], [sNombre], [sApellido], [sGenero], [nEdad], [dFechaNacimiento], [sEmail], [sContrasena], [nIdTipoUsuario], [bEstado]) VALUES (15, N'Renata Alejandra', N'Delgado Núñez', N'Femenino', 23, CAST(N'2001-07-19' AS Date), N'renatadelgado@gmail.com', N'RenDelg@01', 3, 1)
INSERT [DigitalSuport].[TBL_USUARIO] ([nIdUsuario], [sNombre], [sApellido], [sGenero], [nEdad], [dFechaNacimiento], [sEmail], [sContrasena], [nIdTipoUsuario], [bEstado]) VALUES (16, N'Sebastián Tomás', N'Ríos Marín', N'Masculino', 29, CAST(N'1995-03-08' AS Date), N'sebastianrios@gmail.com', N'RiosTomSeb95', 3, 1)
INSERT [DigitalSuport].[TBL_USUARIO] ([nIdUsuario], [sNombre], [sApellido], [sGenero], [nEdad], [dFechaNacimiento], [sEmail], [sContrasena], [nIdTipoUsuario], [bEstado]) VALUES (17, N'Emiliano Gabriel', N'Herrera Bonilla', N'Masculino', 31, CAST(N'1993-08-02' AS Date), N'eherrera@corptech.com', N'HerreraCorp31!', 4, 1)
INSERT [DigitalSuport].[TBL_USUARIO] ([nIdUsuario], [sNombre], [sApellido], [sGenero], [nEdad], [dFechaNacimiento], [sEmail], [sContrasena], [nIdTipoUsuario], [bEstado]) VALUES (18, N'Martina Carolina', N'Fuentes Castro', N'Femenino', 33, CAST(N'1991-09-12' AS Date), N'mfuentes@nextsolutions.com', N'FuentesNext33*', 4, 1)
INSERT [DigitalSuport].[TBL_USUARIO] ([nIdUsuario], [sNombre], [sApellido], [sGenero], [nEdad], [dFechaNacimiento], [sEmail], [sContrasena], [nIdTipoUsuario], [bEstado]) VALUES (19, N'Andrés Felipe', N'Peña Ortiz', N'Masculino', 36, CAST(N'1988-02-27' AS Date), N'apena@infodigital.com', N'OrtizInfo88$', 4, 1)
INSERT [DigitalSuport].[TBL_USUARIO] ([nIdUsuario], [sNombre], [sApellido], [sGenero], [nEdad], [dFechaNacimiento], [sEmail], [sContrasena], [nIdTipoUsuario], [bEstado]) VALUES (20, N'Zoe Mariana', N'Carrillo Beltrán', N'Femenino', 25, CAST(N'1999-06-15' AS Date), N'zcarrillo@softplus.com', N'CarrSoftZ99!', 4, 1)
INSERT [DigitalSuport].[TBL_USUARIO] ([nIdUsuario], [sNombre], [sApellido], [sGenero], [nEdad], [dFechaNacimiento], [sEmail], [sContrasena], [nIdTipoUsuario], [bEstado]) VALUES (21, N'Tomás Ignacio', N'Silva Rangel', N'Masculino', 32, CAST(N'1992-11-04' AS Date), N'tsilva@tecnoglobal.com', N'SilvaTeco92#', 4, 1)
INSERT [DigitalSuport].[TBL_USUARIO] ([nIdUsuario], [sNombre], [sApellido], [sGenero], [nEdad], [dFechaNacimiento], [sEmail], [sContrasena], [nIdTipoUsuario], [bEstado]) VALUES (22, N'Emma Luciana', N'Aguilar Escobar', N'Femenino', 21, CAST(N'2003-01-23' AS Date), N'eaguilar@innovasoft.com', N'EmmaInno03$', 4, 1)
INSERT [DigitalSuport].[TBL_USUARIO] ([nIdUsuario], [sNombre], [sApellido], [sGenero], [nEdad], [dFechaNacimiento], [sEmail], [sContrasena], [nIdTipoUsuario], [bEstado]) VALUES (23, N'Gabriel Esteban', N'Luna Márquez', N'Masculino', 27, CAST(N'1997-05-10' AS Date), N'gluna@devlink.com', N'LunaDev97!', 4, 1)
INSERT [DigitalSuport].[TBL_USUARIO] ([nIdUsuario], [sNombre], [sApellido], [sGenero], [nEdad], [dFechaNacimiento], [sEmail], [sContrasena], [nIdTipoUsuario], [bEstado]) VALUES (24, N'Antonella Victoria', N'Serrano Cárdenas', N'Femenino', 22, CAST(N'2002-08-28' AS Date), N'aserrano@redsolutions.com', N'SerRedAnt22#', 4, 1)
SET IDENTITY_INSERT [DigitalSuport].[TBL_USUARIO] OFF
GO
ALTER TABLE [DigitalSuport].[TBL_DETALLE_SOLICITUD] ADD  DEFAULT ('Pendiente') FOR [sEstado]
GO
ALTER TABLE [DigitalSuport].[TBL_SOLICITUD_COLABORADOR] ADD  DEFAULT ((0)) FOR [bEsCoordinador]
GO
ALTER TABLE [DigitalSuport].[TBL_COLABORADOR]  WITH CHECK ADD  CONSTRAINT [FK_Colaborador_RolColaborador] FOREIGN KEY([nIdRolColaborador])
REFERENCES [DigitalSuport].[TBL_ROL_COLABORADOR] ([nIdRolColaborador])
GO
ALTER TABLE [DigitalSuport].[TBL_COLABORADOR] CHECK CONSTRAINT [FK_Colaborador_RolColaborador]
GO
ALTER TABLE [DigitalSuport].[TBL_DETALLE_SOLICITUD]  WITH CHECK ADD  CONSTRAINT [FK_DetalleSolicitud_TipoSolicitud] FOREIGN KEY([nIdTipoSolicitud])
REFERENCES [DigitalSuport].[TBL_TIPO_SOLICITUD] ([nIdTipoSolicitud])
GO
ALTER TABLE [DigitalSuport].[TBL_DETALLE_SOLICITUD] CHECK CONSTRAINT [FK_DetalleSolicitud_TipoSolicitud]
GO
ALTER TABLE [DigitalSuport].[TBL_DETALLE_SOLICITUD]  WITH CHECK ADD  CONSTRAINT [FK_DetalleSolicitud_Usuario] FOREIGN KEY([nIdUsuario])
REFERENCES [DigitalSuport].[TBL_USUARIO] ([nIdUsuario])
GO
ALTER TABLE [DigitalSuport].[TBL_DETALLE_SOLICITUD] CHECK CONSTRAINT [FK_DetalleSolicitud_Usuario]
GO
ALTER TABLE [DigitalSuport].[TBL_REGISTRO_TRABAJO]  WITH CHECK ADD  CONSTRAINT [FK_RegistroTrabajo_Colaborador] FOREIGN KEY([nIdColaborador])
REFERENCES [DigitalSuport].[TBL_COLABORADOR] ([nIdColaborador])
GO
ALTER TABLE [DigitalSuport].[TBL_REGISTRO_TRABAJO] CHECK CONSTRAINT [FK_RegistroTrabajo_Colaborador]
GO
ALTER TABLE [DigitalSuport].[TBL_REGISTRO_TRABAJO]  WITH CHECK ADD  CONSTRAINT [FK_RegistroTrabajo_DetalleSolicitud] FOREIGN KEY([nIdDetalleSolicitud])
REFERENCES [DigitalSuport].[TBL_DETALLE_SOLICITUD] ([nIdDetalleSolicitud])
GO
ALTER TABLE [DigitalSuport].[TBL_REGISTRO_TRABAJO] CHECK CONSTRAINT [FK_RegistroTrabajo_DetalleSolicitud]
GO
ALTER TABLE [DigitalSuport].[TBL_SOLICITUD_COLABORADOR]  WITH CHECK ADD  CONSTRAINT [FK_SolicitudColaborador_Colaborador] FOREIGN KEY([nIdColaborador])
REFERENCES [DigitalSuport].[TBL_COLABORADOR] ([nIdColaborador])
GO
ALTER TABLE [DigitalSuport].[TBL_SOLICITUD_COLABORADOR] CHECK CONSTRAINT [FK_SolicitudColaborador_Colaborador]
GO
ALTER TABLE [DigitalSuport].[TBL_SOLICITUD_COLABORADOR]  WITH CHECK ADD  CONSTRAINT [FK_SolicitudColaborador_DetalleSolicitud] FOREIGN KEY([nIdSolicitudColaborador])
REFERENCES [DigitalSuport].[TBL_DETALLE_SOLICITUD] ([nIdDetalleSolicitud])
GO
ALTER TABLE [DigitalSuport].[TBL_SOLICITUD_COLABORADOR] CHECK CONSTRAINT [FK_SolicitudColaborador_DetalleSolicitud]
GO
ALTER TABLE [DigitalSuport].[TBL_USUARIO]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_TipoUsuario] FOREIGN KEY([nIdTipoUsuario])
REFERENCES [DigitalSuport].[TBL_TIPO_USUARIO] ([nIdTipoUsuario])
GO
ALTER TABLE [DigitalSuport].[TBL_USUARIO] CHECK CONSTRAINT [FK_Usuario_TipoUsuario]
GO
ALTER TABLE [DigitalSuport].[TBL_DETALLE_SOLICITUD]  WITH CHECK ADD  CONSTRAINT [CK_Estado_Solicitud] CHECK  (([sEstado]='Finalizado' OR [sEstado]='En Proceso' OR [sEstado]='Pendiente'))
GO
ALTER TABLE [DigitalSuport].[TBL_DETALLE_SOLICITUD] CHECK CONSTRAINT [CK_Estado_Solicitud]
GO
USE [master]
GO
ALTER DATABASE [BD_SOPORTE_DIGITAL] SET  READ_WRITE 
GO
