USE [master]
GO
/****** Object:  Database [DBPRUEBAS]    Script Date: 25/05/2022 18:40:48 ******/
CREATE DATABASE [DBPRUEBAS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBPRUEBAS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DBPRUEBAS.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DBPRUEBAS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DBPRUEBAS_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DBPRUEBAS] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBPRUEBAS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBPRUEBAS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBPRUEBAS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBPRUEBAS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBPRUEBAS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBPRUEBAS] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBPRUEBAS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DBPRUEBAS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBPRUEBAS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBPRUEBAS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBPRUEBAS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBPRUEBAS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBPRUEBAS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBPRUEBAS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBPRUEBAS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBPRUEBAS] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DBPRUEBAS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBPRUEBAS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBPRUEBAS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBPRUEBAS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBPRUEBAS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBPRUEBAS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBPRUEBAS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBPRUEBAS] SET RECOVERY FULL 
GO
ALTER DATABASE [DBPRUEBAS] SET  MULTI_USER 
GO
ALTER DATABASE [DBPRUEBAS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBPRUEBAS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBPRUEBAS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBPRUEBAS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DBPRUEBAS] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DBPRUEBAS] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DBPRUEBAS', N'ON'
GO
ALTER DATABASE [DBPRUEBAS] SET QUERY_STORE = OFF
GO
USE [DBPRUEBAS]
GO
/****** Object:  Table [dbo].[CATEGORIA]    Script Date: 25/05/2022 18:40:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CATEGORIA](
	[IdCategoria] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](100) NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CLIENTE]    Script Date: 25/05/2022 18:40:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CLIENTE](
	[IdCliente] [int] IDENTITY(1,1) NOT NULL,
	[TipoDocumento] [varchar](50) NULL,
	[NumeroDocumento] [varchar](50) NULL,
	[Nombre] [varchar](50) NULL,
	[Direccion] [varchar](50) NULL,
	[Telefono] [varchar](40) NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[COMPRA]    Script Date: 25/05/2022 18:40:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COMPRA](
	[IdCompra] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NULL,
	[IdProveedor] [int] NULL,
	[IdTienda] [int] NULL,
	[TotalCosto] [float] NULL,
	[TipoComprobante] [varchar](50) NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCompra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DETALLE_COMPRA]    Script Date: 25/05/2022 18:40:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DETALLE_COMPRA](
	[IdDetalleCompra] [int] IDENTITY(1,1) NOT NULL,
	[IdCompra] [int] NULL,
	[IdProducto] [int] NULL,
	[Cantidad] [float] NULL,
	[PrecioUnitarioCompra] [float] NULL,
	[PrecioUnitarioVenta] [float] NULL,
	[TotalCosto] [float] NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdDetalleCompra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DETALLE_VENTA]    Script Date: 25/05/2022 18:40:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DETALLE_VENTA](
	[IdDetalleVenta] [int] IDENTITY(1,1) NOT NULL,
	[IdVenta] [int] NULL,
	[IdProducto] [int] NULL,
	[Cantidad] [int] NULL,
	[PrecioUnidad] [float] NULL,
	[ImporteTotal] [float] NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdDetalleVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MENU]    Script Date: 25/05/2022 18:40:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MENU](
	[IdMenu] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](60) NULL,
	[Icono] [varchar](60) NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdMenu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PERMISOS]    Script Date: 25/05/2022 18:40:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PERMISOS](
	[IdPermisos] [int] IDENTITY(1,1) NOT NULL,
	[IdRol] [int] NULL,
	[IdSubMenu] [int] NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdPermisos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRODUCTO]    Script Date: 25/05/2022 18:40:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCTO](
	[IdProducto] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [varchar](100) NULL,
	[ValorCodigo] [int] NULL,
	[Nombre] [varchar](100) NULL,
	[Descripcion] [varchar](100) NULL,
	[IdCategoria] [int] NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRODUCTO_TIENDA]    Script Date: 25/05/2022 18:40:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCTO_TIENDA](
	[IdProductoTienda] [int] IDENTITY(1,1) NOT NULL,
	[IdProducto] [int] NULL,
	[IdTienda] [int] NULL,
	[PrecioUnidadCompra] [float] NULL,
	[PrecioUnidadVenta] [float] NULL,
	[Stock] [bigint] NULL,
	[Activo] [bit] NULL,
	[Iniciado] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdProductoTienda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PROVEEDOR]    Script Date: 25/05/2022 18:40:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PROVEEDOR](
	[IdProveedor] [int] IDENTITY(1,1) NOT NULL,
	[RUC] [varchar](50) NULL,
	[RazonSocial] [varchar](100) NULL,
	[Telefono] [varchar](50) NULL,
	[Correo] [varchar](50) NULL,
	[Direccion] [varchar](50) NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ROL]    Script Date: 25/05/2022 18:40:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ROL](
	[IdRol] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](60) NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SUBMENU]    Script Date: 25/05/2022 18:40:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SUBMENU](
	[IdSubMenu] [int] IDENTITY(1,1) NOT NULL,
	[IdMenu] [int] NULL,
	[Nombre] [varchar](60) NULL,
	[NombreFormulario] [varchar](60) NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdSubMenu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TIENDA]    Script Date: 25/05/2022 18:40:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TIENDA](
	[IdTienda] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](60) NULL,
	[RUC] [varchar](60) NULL,
	[Direccion] [varchar](100) NULL,
	[Telefono] [varchar](50) NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdTienda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USUARIO]    Script Date: 25/05/2022 18:40:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USUARIO](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Nombres] [varchar](60) NULL,
	[Apellidos] [varchar](60) NULL,
	[Correo] [varchar](60) NULL,
	[Usuario] [varchar](60) NULL,
	[Clave] [varchar](60) NULL,
	[IdTienda] [int] NULL,
	[IdRol] [int] NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VENTA]    Script Date: 25/05/2022 18:40:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VENTA](
	[IdVenta] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [varchar](100) NULL,
	[ValorCodigo] [int] NULL,
	[IdTienda] [int] NULL,
	[IdUsuario] [int] NULL,
	[IdCliente] [int] NULL,
	[TipoDocumento] [varchar](50) NULL,
	[CantidadProducto] [int] NULL,
	[CantidadTotal] [int] NULL,
	[TotalCosto] [float] NULL,
	[ImporteRecibido] [float] NULL,
	[ImporteCambio] [float] NULL,
	[Activo] [bit] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CATEGORIA] ON 
GO
INSERT [dbo].[CATEGORIA] ([IdCategoria], [Descripcion], [Activo], [FechaRegistro]) VALUES (1, N'Sillas', 1, CAST(N'2022-05-16T20:57:20.567' AS DateTime))
GO
INSERT [dbo].[CATEGORIA] ([IdCategoria], [Descripcion], [Activo], [FechaRegistro]) VALUES (2, N'Mesas', 1, CAST(N'2022-05-16T20:57:20.567' AS DateTime))
GO
INSERT [dbo].[CATEGORIA] ([IdCategoria], [Descripcion], [Activo], [FechaRegistro]) VALUES (3, N'Cabañas', 1, CAST(N'2022-05-16T20:57:20.567' AS DateTime))
GO
INSERT [dbo].[CATEGORIA] ([IdCategoria], [Descripcion], [Activo], [FechaRegistro]) VALUES (4, N'Perreras', 1, CAST(N'2022-05-16T20:57:20.567' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[CATEGORIA] OFF
GO
SET IDENTITY_INSERT [dbo].[CLIENTE] ON 
GO
INSERT [dbo].[CLIENTE] ([IdCliente], [TipoDocumento], [NumeroDocumento], [Nombre], [Direccion], [Telefono], [Activo], [FechaRegistro]) VALUES (1, N'DNI', N'1010258714', N'Santiago', N'Calle15#3-1 El Rosal', N'3012547896', 1, CAST(N'2022-05-16T21:13:49.137' AS DateTime))
GO
INSERT [dbo].[CLIENTE] ([IdCliente], [TipoDocumento], [NumeroDocumento], [Nombre], [Direccion], [Telefono], [Activo], [FechaRegistro]) VALUES (2, N'DNI', N'1010240365', N'Julieth Ramos', N'Calle73#105a45', N'3108741236', 1, CAST(N'2022-05-24T20:17:49.680' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[CLIENTE] OFF
GO
SET IDENTITY_INSERT [dbo].[COMPRA] ON 
GO
INSERT [dbo].[COMPRA] ([IdCompra], [IdUsuario], [IdProveedor], [IdTienda], [TotalCosto], [TipoComprobante], [Activo], [FechaRegistro]) VALUES (1, 1, 1, 1, 16000, N'Boleta', 1, CAST(N'2022-05-16T21:12:22.087' AS DateTime))
GO
INSERT [dbo].[COMPRA] ([IdCompra], [IdUsuario], [IdProveedor], [IdTienda], [TotalCosto], [TipoComprobante], [Activo], [FechaRegistro]) VALUES (2, 1, 1, 1, 16000, N'Boleta', 1, CAST(N'2022-05-21T08:03:42.957' AS DateTime))
GO
INSERT [dbo].[COMPRA] ([IdCompra], [IdUsuario], [IdProveedor], [IdTienda], [TotalCosto], [TipoComprobante], [Activo], [FechaRegistro]) VALUES (3, 1, 1, 1, 600, N'Boleta', 1, CAST(N'2022-05-24T20:15:03.720' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[COMPRA] OFF
GO
SET IDENTITY_INSERT [dbo].[DETALLE_COMPRA] ON 
GO
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioUnitarioCompra], [PrecioUnitarioVenta], [TotalCosto], [Activo], [FechaRegistro]) VALUES (1, 1, 1, 2, 8000, 15000, 16000, 1, CAST(N'2022-05-16T21:12:22.093' AS DateTime))
GO
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioUnitarioCompra], [PrecioUnitarioVenta], [TotalCosto], [Activo], [FechaRegistro]) VALUES (2, 2, 4, 2, 8000, 8200, 16000, 1, CAST(N'2022-05-21T08:03:42.970' AS DateTime))
GO
INSERT [dbo].[DETALLE_COMPRA] ([IdDetalleCompra], [IdCompra], [IdProducto], [Cantidad], [PrecioUnitarioCompra], [PrecioUnitarioVenta], [TotalCosto], [Activo], [FechaRegistro]) VALUES (3, 3, 4, 1, 600, 800, 600, 1, CAST(N'2022-05-24T20:15:03.730' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[DETALLE_COMPRA] OFF
GO
SET IDENTITY_INSERT [dbo].[DETALLE_VENTA] ON 
GO
INSERT [dbo].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnidad], [ImporteTotal], [Activo], [FechaRegistro]) VALUES (1, 1, 1, 1, 15000, 15000, 1, CAST(N'2022-05-16T21:13:49.157' AS DateTime))
GO
INSERT [dbo].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [PrecioUnidad], [ImporteTotal], [Activo], [FechaRegistro]) VALUES (2, 2, 4, 2, 800, 1600, 1, CAST(N'2022-05-24T20:17:49.780' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[DETALLE_VENTA] OFF
GO
SET IDENTITY_INSERT [dbo].[MENU] ON 
GO
INSERT [dbo].[MENU] ([IdMenu], [Nombre], [Icono], [Activo], [FechaRegistro]) VALUES (1, N'Mantenedor', N'fa fa-cogs', 1, CAST(N'2022-05-16T20:57:20.433' AS DateTime))
GO
INSERT [dbo].[MENU] ([IdMenu], [Nombre], [Icono], [Activo], [FechaRegistro]) VALUES (2, N'Compras', N'fa fa-shopping-basket', 1, CAST(N'2022-05-16T20:57:20.433' AS DateTime))
GO
INSERT [dbo].[MENU] ([IdMenu], [Nombre], [Icono], [Activo], [FechaRegistro]) VALUES (3, N'Ventas', N'fa fa-tags', 1, CAST(N'2022-05-16T20:57:20.433' AS DateTime))
GO
INSERT [dbo].[MENU] ([IdMenu], [Nombre], [Icono], [Activo], [FechaRegistro]) VALUES (4, N'Reportes', N'fa fa-tasks', 1, CAST(N'2022-05-16T20:57:20.433' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[MENU] OFF
GO
SET IDENTITY_INSERT [dbo].[PERMISOS] ON 
GO
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (1, 1, 1, 1, CAST(N'2022-05-16T20:57:20.540' AS DateTime))
GO
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (2, 1, 2, 1, CAST(N'2022-05-16T20:57:20.540' AS DateTime))
GO
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (3, 1, 3, 1, CAST(N'2022-05-16T20:57:20.540' AS DateTime))
GO
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (4, 1, 4, 1, CAST(N'2022-05-16T20:57:20.540' AS DateTime))
GO
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (5, 1, 5, 1, CAST(N'2022-05-16T20:57:20.540' AS DateTime))
GO
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (6, 1, 6, 1, CAST(N'2022-05-16T20:57:20.540' AS DateTime))
GO
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (7, 1, 7, 1, CAST(N'2022-05-16T20:57:20.540' AS DateTime))
GO
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (8, 1, 8, 1, CAST(N'2022-05-16T20:57:20.540' AS DateTime))
GO
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (9, 1, 9, 1, CAST(N'2022-05-16T20:57:20.540' AS DateTime))
GO
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (10, 1, 10, 1, CAST(N'2022-05-16T20:57:20.540' AS DateTime))
GO
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (11, 1, 11, 1, CAST(N'2022-05-16T20:57:20.540' AS DateTime))
GO
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (12, 1, 12, 1, CAST(N'2022-05-16T20:57:20.540' AS DateTime))
GO
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (13, 1, 13, 1, CAST(N'2022-05-16T20:57:20.540' AS DateTime))
GO
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (14, 1, 14, 1, CAST(N'2022-05-16T20:57:20.540' AS DateTime))
GO
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (15, 2, 1, 0, CAST(N'2022-05-16T20:57:20.547' AS DateTime))
GO
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (16, 2, 2, 0, CAST(N'2022-05-16T20:57:20.547' AS DateTime))
GO
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (17, 2, 3, 0, CAST(N'2022-05-16T20:57:20.547' AS DateTime))
GO
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (18, 2, 4, 0, CAST(N'2022-05-16T20:57:20.547' AS DateTime))
GO
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (19, 2, 5, 1, CAST(N'2022-05-16T20:57:20.547' AS DateTime))
GO
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (20, 2, 6, 1, CAST(N'2022-05-16T20:57:20.547' AS DateTime))
GO
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (21, 2, 7, 1, CAST(N'2022-05-16T20:57:20.547' AS DateTime))
GO
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (22, 2, 8, 1, CAST(N'2022-05-16T20:57:20.547' AS DateTime))
GO
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (23, 2, 9, 1, CAST(N'2022-05-16T20:57:20.547' AS DateTime))
GO
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (24, 2, 10, 1, CAST(N'2022-05-16T20:57:20.547' AS DateTime))
GO
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (25, 2, 11, 1, CAST(N'2022-05-16T20:57:20.547' AS DateTime))
GO
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (26, 2, 12, 1, CAST(N'2022-05-16T20:57:20.547' AS DateTime))
GO
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (27, 2, 13, 0, CAST(N'2022-05-16T20:57:20.547' AS DateTime))
GO
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (28, 2, 14, 1, CAST(N'2022-05-16T20:57:20.547' AS DateTime))
GO
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (29, 3, 1, 0, CAST(N'2022-05-24T19:11:09.210' AS DateTime))
GO
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (30, 3, 2, 0, CAST(N'2022-05-24T19:11:09.210' AS DateTime))
GO
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (31, 3, 3, 0, CAST(N'2022-05-24T19:11:09.210' AS DateTime))
GO
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (32, 3, 4, 0, CAST(N'2022-05-24T19:11:09.210' AS DateTime))
GO
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (33, 3, 5, 0, CAST(N'2022-05-24T19:11:09.210' AS DateTime))
GO
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (34, 3, 6, 0, CAST(N'2022-05-24T19:11:09.210' AS DateTime))
GO
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (35, 3, 7, 0, CAST(N'2022-05-24T19:11:09.210' AS DateTime))
GO
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (36, 3, 8, 0, CAST(N'2022-05-24T19:11:09.210' AS DateTime))
GO
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (37, 3, 9, 0, CAST(N'2022-05-24T19:11:09.210' AS DateTime))
GO
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (38, 3, 10, 1, CAST(N'2022-05-24T19:11:09.210' AS DateTime))
GO
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (39, 3, 11, 0, CAST(N'2022-05-24T19:11:09.210' AS DateTime))
GO
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (40, 3, 12, 1, CAST(N'2022-05-24T19:11:09.210' AS DateTime))
GO
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (41, 3, 13, 1, CAST(N'2022-05-24T19:11:09.210' AS DateTime))
GO
INSERT [dbo].[PERMISOS] ([IdPermisos], [IdRol], [IdSubMenu], [Activo], [FechaRegistro]) VALUES (42, 3, 14, 1, CAST(N'2022-05-24T19:11:09.210' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[PERMISOS] OFF
GO
SET IDENTITY_INSERT [dbo].[PRODUCTO] ON 
GO
INSERT [dbo].[PRODUCTO] ([IdProducto], [Codigo], [ValorCodigo], [Nombre], [Descripcion], [IdCategoria], [Activo], [FechaRegistro]) VALUES (1, N'000001', 1, N'Silla Lilla Åland', N'La silla Lilla Aland es elaborada 100% en madera y', 1, 1, CAST(N'2022-05-16T20:57:20.583' AS DateTime))
GO
INSERT [dbo].[PRODUCTO] ([IdProducto], [Codigo], [ValorCodigo], [Nombre], [Descripcion], [IdCategoria], [Activo], [FechaRegistro]) VALUES (2, N'000002', 2, N'Silla Wiggle Side Chair', N'tipo de silla muy original que rápidamente se conv', 1, 1, CAST(N'2022-05-16T20:57:20.597' AS DateTime))
GO
INSERT [dbo].[PRODUCTO] ([IdProducto], [Codigo], [ValorCodigo], [Nombre], [Descripcion], [IdCategoria], [Activo], [FechaRegistro]) VALUES (3, N'000003', 3, N'Comedores de madera de cedro', N'son brillantes y resistentes. ', 2, 1, CAST(N'2022-05-16T20:57:20.610' AS DateTime))
GO
INSERT [dbo].[PRODUCTO] ([IdProducto], [Codigo], [ValorCodigo], [Nombre], [Descripcion], [IdCategoria], [Activo], [FechaRegistro]) VALUES (4, N'000004', 4, N'Comedores de madera rústicos', N'Son los que más le dan un toque acogedor al hogar.', 2, 1, CAST(N'2022-05-16T20:57:20.620' AS DateTime))
GO
INSERT [dbo].[PRODUCTO] ([IdProducto], [Codigo], [ValorCodigo], [Nombre], [Descripcion], [IdCategoria], [Activo], [FechaRegistro]) VALUES (5, N'000005', 5, N'Mesas de comedor', N'es ahí donde comemos o incluso hacemos alguna tare', 2, 1, CAST(N'2022-05-16T20:57:20.630' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[PRODUCTO] OFF
GO
SET IDENTITY_INSERT [dbo].[PRODUCTO_TIENDA] ON 
GO
INSERT [dbo].[PRODUCTO_TIENDA] ([IdProductoTienda], [IdProducto], [IdTienda], [PrecioUnidadCompra], [PrecioUnidadVenta], [Stock], [Activo], [Iniciado], [FechaRegistro]) VALUES (1, 1, 1, 8000, 15000, 1, 1, 1, CAST(N'2022-05-16T21:09:40.240' AS DateTime))
GO
INSERT [dbo].[PRODUCTO_TIENDA] ([IdProductoTienda], [IdProducto], [IdTienda], [PrecioUnidadCompra], [PrecioUnidadVenta], [Stock], [Activo], [Iniciado], [FechaRegistro]) VALUES (2, 4, 1, 600, 800, 1, 1, 1, CAST(N'2022-05-21T08:00:20.310' AS DateTime))
GO
INSERT [dbo].[PRODUCTO_TIENDA] ([IdProductoTienda], [IdProducto], [IdTienda], [PrecioUnidadCompra], [PrecioUnidadVenta], [Stock], [Activo], [Iniciado], [FechaRegistro]) VALUES (3, 2, 1, 0, 0, 0, 1, 0, CAST(N'2022-05-24T23:39:44.663' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[PRODUCTO_TIENDA] OFF
GO
SET IDENTITY_INSERT [dbo].[PROVEEDOR] ON 
GO
INSERT [dbo].[PROVEEDOR] ([IdProveedor], [RUC], [RazonSocial], [Telefono], [Correo], [Direccion], [Activo], [FechaRegistro]) VALUES (1, N'25689789654', N'Maderas del Norte', N'310254782', N'jorgevalderrama2@gmail.com', N'Cra. 2 #3-111 a 3-11, Subachoque, Cundinamarca', 1, CAST(N'2022-05-16T21:02:29.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[PROVEEDOR] OFF
GO
SET IDENTITY_INSERT [dbo].[ROL] ON 
GO
INSERT [dbo].[ROL] ([IdRol], [Descripcion], [Activo], [FechaRegistro]) VALUES (1, N'ADMINISTRADOR', 1, CAST(N'2022-05-16T20:57:20.413' AS DateTime))
GO
INSERT [dbo].[ROL] ([IdRol], [Descripcion], [Activo], [FechaRegistro]) VALUES (2, N'EMPLEADO', 1, CAST(N'2022-05-16T20:57:20.413' AS DateTime))
GO
INSERT [dbo].[ROL] ([IdRol], [Descripcion], [Activo], [FechaRegistro]) VALUES (3, N'USUARIO', 1, CAST(N'2022-05-24T19:11:09.193' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[ROL] OFF
GO
SET IDENTITY_INSERT [dbo].[SUBMENU] ON 
GO
INSERT [dbo].[SUBMENU] ([IdSubMenu], [IdMenu], [Nombre], [NombreFormulario], [Activo], [FechaRegistro]) VALUES (1, 1, N'Rol', N'frmRol', 1, CAST(N'2022-05-16T20:57:20.497' AS DateTime))
GO
INSERT [dbo].[SUBMENU] ([IdSubMenu], [IdMenu], [Nombre], [NombreFormulario], [Activo], [FechaRegistro]) VALUES (2, 1, N'Asignar rol permisos', N'frmRolPermiso', 1, CAST(N'2022-05-16T20:57:20.497' AS DateTime))
GO
INSERT [dbo].[SUBMENU] ([IdSubMenu], [IdMenu], [Nombre], [NombreFormulario], [Activo], [FechaRegistro]) VALUES (3, 1, N'Usuario', N'frmUsuario', 1, CAST(N'2022-05-16T20:57:20.497' AS DateTime))
GO
INSERT [dbo].[SUBMENU] ([IdSubMenu], [IdMenu], [Nombre], [NombreFormulario], [Activo], [FechaRegistro]) VALUES (4, 1, N'Proveedor', N'frmProveedor', 1, CAST(N'2022-05-16T20:57:20.497' AS DateTime))
GO
INSERT [dbo].[SUBMENU] ([IdSubMenu], [IdMenu], [Nombre], [NombreFormulario], [Activo], [FechaRegistro]) VALUES (5, 1, N'Tienda', N'frmTienda', 1, CAST(N'2022-05-16T20:57:20.497' AS DateTime))
GO
INSERT [dbo].[SUBMENU] ([IdSubMenu], [IdMenu], [Nombre], [NombreFormulario], [Activo], [FechaRegistro]) VALUES (6, 1, N'Categoria', N'frmCategoria', 1, CAST(N'2022-05-16T20:57:20.497' AS DateTime))
GO
INSERT [dbo].[SUBMENU] ([IdSubMenu], [IdMenu], [Nombre], [NombreFormulario], [Activo], [FechaRegistro]) VALUES (7, 1, N'Producto', N'frmProducto', 1, CAST(N'2022-05-16T20:57:20.497' AS DateTime))
GO
INSERT [dbo].[SUBMENU] ([IdSubMenu], [IdMenu], [Nombre], [NombreFormulario], [Activo], [FechaRegistro]) VALUES (8, 1, N'Asignar producto a tienda', N'frmProductoTienda', 1, CAST(N'2022-05-16T20:57:20.497' AS DateTime))
GO
INSERT [dbo].[SUBMENU] ([IdSubMenu], [IdMenu], [Nombre], [NombreFormulario], [Activo], [FechaRegistro]) VALUES (9, 2, N'Registrar', N'frmRegistrarCompra', 1, CAST(N'2022-05-16T20:57:20.497' AS DateTime))
GO
INSERT [dbo].[SUBMENU] ([IdSubMenu], [IdMenu], [Nombre], [NombreFormulario], [Activo], [FechaRegistro]) VALUES (10, 2, N'Consultas', N'frmConsultarCompra', 1, CAST(N'2022-05-16T20:57:20.497' AS DateTime))
GO
INSERT [dbo].[SUBMENU] ([IdSubMenu], [IdMenu], [Nombre], [NombreFormulario], [Activo], [FechaRegistro]) VALUES (11, 3, N'Crear Nueva', N'frmCrearVenta', 1, CAST(N'2022-05-16T20:57:20.497' AS DateTime))
GO
INSERT [dbo].[SUBMENU] ([IdSubMenu], [IdMenu], [Nombre], [NombreFormulario], [Activo], [FechaRegistro]) VALUES (12, 3, N'Consultar', N'frmConsultarVenta', 1, CAST(N'2022-05-16T20:57:20.497' AS DateTime))
GO
INSERT [dbo].[SUBMENU] ([IdSubMenu], [IdMenu], [Nombre], [NombreFormulario], [Activo], [FechaRegistro]) VALUES (13, 4, N'Productos por tienda', N'rptProductoTienda', 1, CAST(N'2022-05-16T20:57:20.497' AS DateTime))
GO
INSERT [dbo].[SUBMENU] ([IdSubMenu], [IdMenu], [Nombre], [NombreFormulario], [Activo], [FechaRegistro]) VALUES (14, 4, N'Ventas', N'rptVentas', 1, CAST(N'2022-05-16T20:57:20.497' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[SUBMENU] OFF
GO
SET IDENTITY_INSERT [dbo].[TIENDA] ON 
GO
INSERT [dbo].[TIENDA] ([IdTienda], [Nombre], [RUC], [Direccion], [Telefono], [Activo], [FechaRegistro]) VALUES (1, N'ConstruSantander', N'25689789654', N'Autopista Bogotá Medellín KM 34', N'3114691198', 1, CAST(N'2022-05-16T20:57:20.507' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[TIENDA] OFF
GO
SET IDENTITY_INSERT [dbo].[USUARIO] ON 
GO
INSERT [dbo].[USUARIO] ([IdUsuario], [Nombres], [Apellidos], [Correo], [Usuario], [Clave], [IdTienda], [IdRol], [Activo], [FechaRegistro]) VALUES (1, N'Santiago', N'Hernandez Rojas', N'santihr9807@gmail.com', N'Santiago', N'12345678', 1, 1, 1, CAST(N'2022-05-16T20:57:20.520' AS DateTime))
GO
INSERT [dbo].[USUARIO] ([IdUsuario], [Nombres], [Apellidos], [Correo], [Usuario], [Clave], [IdTienda], [IdRol], [Activo], [FechaRegistro]) VALUES (2, N'Brian Alexander ', N'Patiño', N'briblackyt@gmail.com', N'Alexander', N'alexander123', 1, 2, 1, CAST(N'2022-05-16T20:57:20.530' AS DateTime))
GO
INSERT [dbo].[USUARIO] ([IdUsuario], [Nombres], [Apellidos], [Correo], [Usuario], [Clave], [IdTienda], [IdRol], [Activo], [FechaRegistro]) VALUES (3, N'Elkin', N'Roa Ariza', N'egroa@ucundinamarca.edu.co', N'elkin10', N'elkin22', 1, 2, 1, CAST(N'2022-05-16T22:02:21.683' AS DateTime))
GO
INSERT [dbo].[USUARIO] ([IdUsuario], [Nombres], [Apellidos], [Correo], [Usuario], [Clave], [IdTienda], [IdRol], [Activo], [FechaRegistro]) VALUES (4, N'Sebastian', N'Mahecha Benavidez', N'sebasniñorata@gmail.com', N'sebas2022', N'sebas123', 1, 1, 1, CAST(N'2022-05-21T07:57:23.293' AS DateTime))
GO
INSERT [dbo].[USUARIO] ([IdUsuario], [Nombres], [Apellidos], [Correo], [Usuario], [Clave], [IdTienda], [IdRol], [Activo], [FechaRegistro]) VALUES (5, N'Karen ', N'Diaz  Orjuela', N'karenorjuela@hotmail.es', N'karendiaz21', N'karen123', 1, 3, 1, CAST(N'2022-05-24T19:13:13.310' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[USUARIO] OFF
GO
SET IDENTITY_INSERT [dbo].[VENTA] ON 
GO
INSERT [dbo].[VENTA] ([IdVenta], [Codigo], [ValorCodigo], [IdTienda], [IdUsuario], [IdCliente], [TipoDocumento], [CantidadProducto], [CantidadTotal], [TotalCosto], [ImporteRecibido], [ImporteCambio], [Activo], [FechaRegistro]) VALUES (1, N'000001', 1, 1, 1, 1, N'Factura', 1, 1, 15000, 20000, 5000, 1, CAST(N'2022-05-16T21:13:49.150' AS DateTime))
GO
INSERT [dbo].[VENTA] ([IdVenta], [Codigo], [ValorCodigo], [IdTienda], [IdUsuario], [IdCliente], [TipoDocumento], [CantidadProducto], [CantidadTotal], [TotalCosto], [ImporteRecibido], [ImporteCambio], [Activo], [FechaRegistro]) VALUES (2, N'000002', 2, 1, 1, 2, N'Factura', 1, 2, 1600, 3000, 1400, 1, CAST(N'2022-05-24T20:17:49.770' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[VENTA] OFF
GO
ALTER TABLE [dbo].[CATEGORIA] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[CATEGORIA] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[CLIENTE] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[CLIENTE] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[COMPRA] ADD  DEFAULT ((0)) FOR [TotalCosto]
GO
ALTER TABLE [dbo].[COMPRA] ADD  DEFAULT ('Boleta') FOR [TipoComprobante]
GO
ALTER TABLE [dbo].[COMPRA] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[COMPRA] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[DETALLE_COMPRA] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[DETALLE_COMPRA] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[DETALLE_VENTA] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[DETALLE_VENTA] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[MENU] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[MENU] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[PERMISOS] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[PERMISOS] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[PRODUCTO] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[PRODUCTO] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[PRODUCTO_TIENDA] ADD  DEFAULT ((0)) FOR [PrecioUnidadCompra]
GO
ALTER TABLE [dbo].[PRODUCTO_TIENDA] ADD  DEFAULT ((0)) FOR [PrecioUnidadVenta]
GO
ALTER TABLE [dbo].[PRODUCTO_TIENDA] ADD  DEFAULT ((0)) FOR [Stock]
GO
ALTER TABLE [dbo].[PRODUCTO_TIENDA] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[PRODUCTO_TIENDA] ADD  DEFAULT ((0)) FOR [Iniciado]
GO
ALTER TABLE [dbo].[PRODUCTO_TIENDA] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[PROVEEDOR] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[PROVEEDOR] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[ROL] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[ROL] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[SUBMENU] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[SUBMENU] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[TIENDA] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[TIENDA] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[USUARIO] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[USUARIO] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[VENTA] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[VENTA] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[COMPRA]  WITH CHECK ADD FOREIGN KEY([IdProveedor])
REFERENCES [dbo].[PROVEEDOR] ([IdProveedor])
GO
ALTER TABLE [dbo].[COMPRA]  WITH CHECK ADD FOREIGN KEY([IdTienda])
REFERENCES [dbo].[TIENDA] ([IdTienda])
GO
ALTER TABLE [dbo].[COMPRA]  WITH CHECK ADD FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[USUARIO] ([IdUsuario])
GO
ALTER TABLE [dbo].[DETALLE_COMPRA]  WITH CHECK ADD FOREIGN KEY([IdCompra])
REFERENCES [dbo].[COMPRA] ([IdCompra])
GO
ALTER TABLE [dbo].[DETALLE_COMPRA]  WITH CHECK ADD FOREIGN KEY([IdProducto])
REFERENCES [dbo].[PRODUCTO] ([IdProducto])
GO
ALTER TABLE [dbo].[DETALLE_VENTA]  WITH CHECK ADD FOREIGN KEY([IdProducto])
REFERENCES [dbo].[PRODUCTO] ([IdProducto])
GO
ALTER TABLE [dbo].[DETALLE_VENTA]  WITH CHECK ADD FOREIGN KEY([IdVenta])
REFERENCES [dbo].[VENTA] ([IdVenta])
GO
ALTER TABLE [dbo].[PERMISOS]  WITH CHECK ADD FOREIGN KEY([IdRol])
REFERENCES [dbo].[ROL] ([IdRol])
GO
ALTER TABLE [dbo].[PERMISOS]  WITH CHECK ADD FOREIGN KEY([IdSubMenu])
REFERENCES [dbo].[SUBMENU] ([IdSubMenu])
GO
ALTER TABLE [dbo].[PRODUCTO]  WITH CHECK ADD FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[CATEGORIA] ([IdCategoria])
GO
ALTER TABLE [dbo].[PRODUCTO_TIENDA]  WITH CHECK ADD FOREIGN KEY([IdProducto])
REFERENCES [dbo].[PRODUCTO] ([IdProducto])
GO
ALTER TABLE [dbo].[PRODUCTO_TIENDA]  WITH CHECK ADD FOREIGN KEY([IdTienda])
REFERENCES [dbo].[TIENDA] ([IdTienda])
GO
ALTER TABLE [dbo].[SUBMENU]  WITH CHECK ADD FOREIGN KEY([IdMenu])
REFERENCES [dbo].[MENU] ([IdMenu])
GO
ALTER TABLE [dbo].[USUARIO]  WITH CHECK ADD FOREIGN KEY([IdRol])
REFERENCES [dbo].[ROL] ([IdRol])
GO
ALTER TABLE [dbo].[USUARIO]  WITH CHECK ADD FOREIGN KEY([IdTienda])
REFERENCES [dbo].[TIENDA] ([IdTienda])
GO
ALTER TABLE [dbo].[VENTA]  WITH CHECK ADD FOREIGN KEY([IdCliente])
REFERENCES [dbo].[CLIENTE] ([IdCliente])
GO
ALTER TABLE [dbo].[VENTA]  WITH CHECK ADD FOREIGN KEY([IdTienda])
REFERENCES [dbo].[TIENDA] ([IdTienda])
GO
ALTER TABLE [dbo].[VENTA]  WITH CHECK ADD FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[USUARIO] ([IdUsuario])
GO
/****** Object:  StoredProcedure [dbo].[usp_ActualizarPermisos]    Script Date: 25/05/2022 18:40:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTO PARA ACTUALIZAR PERMISOS
create procedure [dbo].[usp_ActualizarPermisos](
@Detalle xml,
@Resultado bit output
)
as
begin
begin try

	BEGIN TRANSACTION
	declare @permisos table(idpermisos int,activo bit)

	insert into @permisos(idpermisos,activo)
	select 
	idpermisos = Node.Data.value('(IdPermisos)[1]','int'),
	activo = Node.Data.value('(Activo)[1]','bit')
	FROM @Detalle.nodes('/DETALLE/PERMISO') Node(Data)

	select * from @permisos

	update p set p.Activo = pe.activo from PERMISOS p
	inner join @permisos pe on pe.idpermisos = p.IdPermisos

	COMMIT
	set @Resultado = 1

end try
begin catch
	ROLLBACK
	set @Resultado = 0
end catch
end

GO
/****** Object:  StoredProcedure [dbo].[usp_ControlarStock]    Script Date: 25/05/2022 18:40:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTO PARA STOCK PRODUCTO_TIENDA

CREATE PROCEDURE [dbo].[usp_ControlarStock](
@IdProducto int,
@IdTienda int,
@Cantidad int,
@Restar bit,
@Resultado bit output)
as
begin
	set @Resultado = 1
	begin try
		if(@Restar = 1)
			update PRODUCTO_TIENDA set Stock = Stock - @Cantidad where IdProducto = @IdProducto and IdTienda = @IdTienda and Iniciado = 1
		else
			update PRODUCTO_TIENDA set Stock = Stock + @Cantidad where IdProducto = @IdProducto and IdTienda = @IdTienda and Iniciado = 1
	end try
	begin catch
		set @Resultado = 0
	end catch
end


GO
/****** Object:  StoredProcedure [dbo].[usp_EliminarCategoria]    Script Date: 25/05/2022 18:40:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTO PARA ELIMINAR CATEGORIA
create procedure [dbo].[usp_EliminarCategoria](
@IdCategoria int,
@Resultado bit output
)
as
begin
	SET @Resultado = 1

	--validamos que ninguna categoria este relacionada a un producto
	IF not EXISTS (select * from CATEGORIA c
	inner join PRODUCTO p on c.IdCategoria  = p.IdCategoria
	where c.IdCategoria = @IdCategoria)

		delete from CATEGORIA where IdCategoria = @IdCategoria

	ELSE
		SET @Resultado = 0

end



GO
/****** Object:  StoredProcedure [dbo].[usp_EliminarProducto]    Script Date: 25/05/2022 18:40:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTO PARA ELIMINAR PRODUCTO
create procedure [dbo].[usp_EliminarProducto](
@IdProducto int,
@Resultado bit output
)
as
begin
	SET @Resultado = 1

	--validamos que ningun producto se encuentre relacionado a una tienda
	IF not EXISTS (select top 1 * from PRODUCTO_TIENDA PT
INNER JOIN PRODUCTO P ON P.IdProducto = PT.IdProducto
WHERE P.IdProducto = @IdProducto)
		delete from PRODUCTO where IdProducto = @IdProducto

	ELSE
		SET @Resultado = 0

end

GO
/****** Object:  StoredProcedure [dbo].[usp_EliminarProductoTienda]    Script Date: 25/05/2022 18:40:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTO PARA ELIMINAR PRODUCTO_TIENDA
create procedure [dbo].[usp_EliminarProductoTienda](
@IdProductoTienda int,
@Resultado bit output
)
as
begin
	SET @Resultado = 1

	IF NOT EXISTS (SELECT * FROM PRODUCTO_TIENDA WHERE IdProductoTienda = @IdProductoTienda and Iniciado = 1 )

		delete from PRODUCTO_TIENDA where IdProductoTienda = @IdProductoTienda

	ELSE
		SET @Resultado = 0

end

GO
/****** Object:  StoredProcedure [dbo].[usp_EliminarProveedor]    Script Date: 25/05/2022 18:40:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTO PARA ELIMINAR PROVEEDOR
create procedure [dbo].[usp_EliminarProveedor](
@IdProveedor int,
@Resultado bit output
)
as
begin
	SET @Resultado = 1
	--validamos que ningun proveedor se encuentre asignado a una compra
	IF not EXISTS (select top 1 * from COMPRA c
inner join PROVEEDOR p on p.IdProveedor = c.IdProveedor
where p.IdProveedor = @IdProveedor)

		delete from PROVEEDOR where IdProveedor = @IdProveedor
	ELSE
		SET @Resultado = 0

end

GO
/****** Object:  StoredProcedure [dbo].[usp_EliminarRol]    Script Date: 25/05/2022 18:40:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTO PARA ELIMINAR ROL
create procedure [dbo].[usp_EliminarRol](
@IdRol int,
@Resultado bit output
)
as
begin
	SET @Resultado = 1

	--validamos que el rol no se encuentre asignado a algun usuario
	IF not EXISTS (select * from USUARIO u
	inner join ROL r on r.IdRol  = u.IdRol
	where r.IdRol = @IdRol)
	begin	
		delete from PERMISOS where IdRol = @IdRol
		delete from ROL where IdRol = @IdRol
	end
	ELSE
		SET @Resultado = 0

end

GO
/****** Object:  StoredProcedure [dbo].[usp_EliminarTienda]    Script Date: 25/05/2022 18:40:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDIMIENTO PARA ELIMINAR TIENDA
create procedure [dbo].[usp_EliminarTienda](
@IdTienda int,
@Resultado bit output
)
as
begin
	SET @Resultado = 1

	--validamos que la tienda no se encuentre asignada a un usuario y una venta
	IF not EXISTS (select * from USUARIO u
	inner join TIENDA t on t.IdTienda = u.IdTienda
	where t.IdTienda = @IdTienda)

		delete from TIENDA where IdTienda = @IdTienda

	ELSE
		SET @Resultado = 0

end

GO
/****** Object:  StoredProcedure [dbo].[usp_EliminarUsuario]    Script Date: 25/05/2022 18:40:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTO PARA ELIMINAR USUARIO
create procedure [dbo].[usp_EliminarUsuario](
@IdUsuario int,
@Resultado bit output
)
as
begin
	SET @Resultado = 1

	--validamos que ningun usuario se encuentre relacionado a una tienda
	IF (not EXISTS (select c.* from COMPRA c 
		inner join USUARIO u on u.IdUsuario = c.IdUsuario 
		where u.IdUsuario = @IdUsuario
		) and 
		not EXISTS (select v.* from VENTA v 
		inner join USUARIO u on u.IdUsuario = v.IdUsuario 
		where u.IdUsuario = @IdUsuario
		)
	)
		delete from USUARIO where IdUsuario = @IdUsuario
	ELSE
		SET @Resultado = 0

end

GO
/****** Object:  StoredProcedure [dbo].[usp_LoginUsuario]    Script Date: 25/05/2022 18:40:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDMIENTO PARA OBTENER USUARIO

create procedure [dbo].[usp_LoginUsuario](
@Usuario varchar(60),
@Clave varchar(60),
@IdUsuario int output
)
as
begin
	set @IdUsuario = 0
	if exists(select * from USUARIO where [Usuario] COLLATE Latin1_General_CS_AS = @Usuario and Clave COLLATE Latin1_General_CS_AS = @Clave and Activo = 1)
		set @IdUsuario = (select top 1 IdUsuario from USUARIO where [Usuario]  COLLATE Latin1_General_CS_AS = @Usuario and Clave COLLATE Latin1_General_CS_AS = @Clave and Activo = 1)
end

GO
/****** Object:  StoredProcedure [dbo].[usp_ModificarCategoria]    Script Date: 25/05/2022 18:40:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTO PARA MODIFICAR CATEGORIA
create procedure [dbo].[usp_ModificarCategoria](
@IdCategoria int,
@Descripcion varchar(60),
@Activo bit,
@Resultado bit output
)
as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM CATEGORIA WHERE Descripcion =@Descripcion and IdCategoria != @IdCategoria)
		
		update CATEGORIA set 
		Descripcion = @Descripcion,
		Activo = @Activo
		where IdCategoria = @IdCategoria
	ELSE
		SET @Resultado = 0

end

GO
/****** Object:  StoredProcedure [dbo].[usp_ModificarProducto]    Script Date: 25/05/2022 18:40:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTO PARA MODIFICAR PRODUCTO
create procedure [dbo].[usp_ModificarProducto](
@IdProducto int,
@Nombre varchar(50),
@Descripcion varchar(50),
@IdCategoria int,
@Activo bit,
@Resultado bit output
)
as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM PRODUCTO WHERE rtrim(ltrim(Nombre)) = rtrim(ltrim(@Nombre)) and IdProducto != @IdProducto)
		
		update PRODUCTO set
		Nombre = @Nombre,
		Descripcion = @Descripcion,
		IdCategoria = @IdCategoria,
		Activo = @Activo
		where IdProducto = @IdProducto
	ELSE
		SET @Resultado = 0

end

GO
/****** Object:  StoredProcedure [dbo].[usp_ModificarProductoTienda]    Script Date: 25/05/2022 18:40:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTO PARA MODIFICAR PRODUCTO_TIENDA
create procedure [dbo].[usp_ModificarProductoTienda](
@IdProductoTienda int,
@IdProducto varchar(60),
@IdTienda varchar(60),
@Resultado bit output
)
as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM PRODUCTO_TIENDA WHERE @IdProductoTienda = @IdProductoTienda and Iniciado = 1 )
		
		update PRODUCTO_TIENDA set 
		IdProducto = @IdProducto,
		IdTienda = @IdTienda
		where IdProductoTienda = @IdProductoTienda
	ELSE
		SET @Resultado = 0

end

GO
/****** Object:  StoredProcedure [dbo].[usp_ModificarProveedor]    Script Date: 25/05/2022 18:40:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--PROCEDIMIENTO PARA MODIFICAR PROVEEDOR
create procedure [dbo].[usp_ModificarProveedor](
@IdProveedor int,
@Ruc varchar(50),
@RazonSocial varchar(100),
@Telefono varchar(50),
@Correo varchar(50),
@Direccion varchar(50),
@Activo bit,
@Resultado bit output
)
as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM PROVEEDOR WHERE RUC = @Ruc and IdProveedor != @IdProveedor)
		
		update PROVEEDOR set 
		RUC = @Ruc,
		RazonSocial = @RazonSocial,
		Telefono = @Telefono,
		Correo = @Correo,
		Direccion = @Direccion,
		Activo = @Activo
		where IdProveedor = @IdProveedor
	ELSE
		SET @Resultado = 0

end

GO
/****** Object:  StoredProcedure [dbo].[usp_ModificarRol]    Script Date: 25/05/2022 18:40:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTO PARA MODIFICAR ROLES
create procedure [dbo].[usp_ModificarRol](
@IdRol int,
@Descripcion varchar(60),
@Activo bit,
@Resultado bit output
)
as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM ROL WHERE Descripcion =@Descripcion and IdRol != @IdRol)
		
		update ROL set 
		Descripcion = @Descripcion,
		Activo = @Activo
		where IdRol = @IdRol
	ELSE
		SET @Resultado = 0

end

GO
/****** Object:  StoredProcedure [dbo].[usp_ModificarTienda]    Script Date: 25/05/2022 18:40:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDIMIENTO PARA MODIFICAR TIENDA
create procedure [dbo].[usp_ModificarTienda](
@IdTienda int,
@Nombre varchar(60),
@Ruc varchar(60),
@Direccion varchar(60),
@Telefono varchar(60),
@Activo bit,
@Resultado bit output
)
as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM TIENDA WHERE Nombre =@Nombre and IdTienda != @IdTienda)
		
		update TIENDA set 
		Nombre = @Nombre,
		RUC = @Ruc,
		Direccion = @Direccion,
		Telefono = @Telefono,
		Activo = @Activo
		where IdTienda = @IdTienda

	ELSE
		SET @Resultado = 0

end

GO
/****** Object:  StoredProcedure [dbo].[usp_ModificarUsuario]    Script Date: 25/05/2022 18:40:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDIMIENTO PARA MODIFICAR USUARIO
create procedure [dbo].[usp_ModificarUsuario](
@IdUsuario int,
@Nombres varchar(50),
@Apellidos varchar(50),
@Correo varchar(50),
@Usuario varchar(50),
@Clave varchar(50),
@IdTienda int,
@IdRol int,
@Activo bit,
@Resultado bit output
)
as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM USUARIO WHERE Usuario = @Usuario and IdUsuario != @IdUsuario)
		
		update USUARIO set 
		Nombres = @Nombres,
		Apellidos = @Apellidos,
		Correo = @Correo,
		Usuario = @Usuario,
		Clave = @Clave,
		IdTienda = @IdTienda,
		IdRol = @IdRol,
		Activo = @Activo
		where IdUsuario = @IdUsuario

	ELSE
		SET @Resultado = 0

end

GO
/****** Object:  StoredProcedure [dbo].[usp_ObtenerCategorias]    Script Date: 25/05/2022 18:40:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--PROCEDMIENTO PARA OBTENER CATEGORIA
CREATE PROC [dbo].[usp_ObtenerCategorias]
as
begin
 select IdCategoria,Descripcion,Activo from CATEGORIA
end

GO
/****** Object:  StoredProcedure [dbo].[usp_ObtenerDetalleCompra]    Script Date: 25/05/2022 18:40:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDMIENTO PARA OBTENER DETALLE COMPRA
create proc [dbo].[usp_ObtenerDetalleCompra](
@IdCompra int
)
as
begin


select  RIGHT('000000' + convert(varchar(max),c.IdCompra),6)[Codigo],
CONVERT(char(10),c.FechaRegistro,103)[FechaCompra],
CONVERT(decimal(10,2), c.TotalCosto)[TotalCosto],

(select p.RUC,p.RazonSocial from PROVEEDOR P
 where p.IdProveedor = c.IdProveedor
FOR XML PATH (''),TYPE) AS 'DETALLE_PROVEEDOR',

(select T.RUC, T.Nombre, T.Direccion from TIENDA T
 where T.IdTienda = c.IdTienda
FOR XML PATH (''),TYPE) AS 'DETALLE_TIENDA',

(select convert(int, dc.Cantidad)[Cantidad],concat(p.Nombre,' - ',p.Descripcion)[NombreProducto],
CONVERT(decimal(10,2),dc.PrecioUnitarioCompra)PrecioUnitarioCompra,
CONVERT(decimal(10,2),dc.TotalCosto)[TotalCosto] 
from DETALLE_COMPRA dc
inner join PRODUCTO p on p.IdProducto = dc.IdProducto
where dc.IdCompra = c.IdCompra
FOR XML PATH ('PRODUCTO'),TYPE) AS 'DETALLE_PRODUCTO'

from COMPRA c
where c.IdCompra =@IdCompra
FOR XML PATH(''), ROOT('DETALLE_COMPRA') 
end

GO
/****** Object:  StoredProcedure [dbo].[usp_ObtenerDetalleUsuario]    Script Date: 25/05/2022 18:40:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDMIENTO PARA OBTENER DETALLE USUARIO
create proc [dbo].[usp_ObtenerDetalleUsuario](
@IdUsuario int
)
as
begin

 select 
*,
(select * from TIENDA t
 where t.IdTienda = up.IdTienda
FOR XML PATH (''),TYPE) AS 'DetalleTienda'
,
(select * from ROL r
 where r.IdRol = up.IdRol
FOR XML PATH (''),TYPE) AS 'DetalleRol'
,
 (
 select t.NombreMenu,t.Icono,
 (select sm.Nombre[NombreSubMenu],sm.NombreFormulario,p.Activo
	 from PERMISOS p
	 inner join ROL r on r.IdRol = p.IdRol
	 inner join SUBMENU sm on sm.IdSubMenu = p.IdSubMenu
	 inner join MENU m on m.IdMenu = sm.IdMenu
	 inner join USUARIO u on u.IdRol = r.IdRol and u.IdUsuario = up.IdUsuario
	where sm.IdMenu = t.IdMenu
  FOR XML PATH ('SubMenu'),TYPE) AS 'DetalleSubMenu' 

 from (
 select distinct m.Nombre[NombreMenu],m.IdMenu,m.Icono
 from PERMISOS p
 inner join ROL r on r.IdRol = p.IdRol
 inner join SUBMENU sm on sm.IdSubMenu = p.IdSubMenu
 inner join MENU m on m.IdMenu = sm.IdMenu
 inner join USUARIO u on u.IdRol = r.IdRol and u.IdUsuario = up.IdUsuario
 where p.Activo = 1) t
 FOR XML PATH ('Menu'),TYPE) AS 'DetalleMenu'  
 from USUARIO up
 where UP.IdUsuario = @IdUsuario
 FOR XML PATH(''), ROOT('Usuario')  

end

GO
/****** Object:  StoredProcedure [dbo].[usp_ObtenerDetalleVenta]    Script Date: 25/05/2022 18:40:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDMIENTO PARA OBTENER DETALLE VENTA
create proc [dbo].[usp_ObtenerDetalleVenta](
@IdVenta int
)
as
begin


select V.TipoDocumento, V.Codigo,
CONVERT(decimal(10,2), V.TotalCosto)[TotalCosto],
CONVERT(decimal(10,2),V.ImporteRecibido)[ImporteRecibido],
CONVERT(decimal(10,2), V.ImporteCambio)[ImporteCambio],
convert(char(10),v.fechaRegistro,103)[FechaRegistro],
(select u.Nombres,u.Apellidos from USUARIO U
 where U.IdUsuario = v.IdUsuario
FOR XML PATH (''),TYPE) AS 'DETALLE_USUARIO',

(select T.RUC, T.Nombre, T.Direccion from TIENDA T
 where T.IdTienda = V.IdTienda
FOR XML PATH (''),TYPE) AS 'DETALLE_TIENDA',

(select C.Nombre,C.Direccion,C.NumeroDocumento,C.Telefono from CLIENTE c
 where c.IdCliente = V.IdCliente
FOR XML PATH (''),TYPE) AS 'DETALLE_CLIENTE',

(select dv.Cantidad,concat(p.Nombre,'-',p.Descripcion)[NombreProducto],
CONVERT(decimal(10,2),dv.PrecioUnidad)[PrecioUnidad],
CONVERT(decimal(10,2),dv.ImporteTotal)[ImporteTotal] 
from DETALLE_VENTA dv
inner join PRODUCTO p on p.IdProducto = dv.IdProducto
where dv.IdVenta = v.IdVenta
FOR XML PATH ('PRODUCTO'),TYPE) AS 'DETALLE_PRODUCTO'

from VENTA v
where v.IdVenta = @IdVenta
FOR XML PATH(''), ROOT('DETALLE_VENTA') 

end

GO
/****** Object:  StoredProcedure [dbo].[usp_ObtenerListaCompra]    Script Date: 25/05/2022 18:40:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--PROCEDMIENTO PARA OBTENER LISTA COMPRA
create procedure [dbo].[usp_ObtenerListaCompra](
@FechaInicio date,
@FechaFin date,
@IdProveedor int = 0 ,
@IdTienda int = 0
)
as
begin
SET DATEFORMAT dmy;
select c.IdCompra,RIGHT('000000' + convert(varchar(max),c.IdCompra),6)[NumeroCompra], p.RazonSocial,t.Nombre,
convert(char(10),c.FechaRegistro,103)[FechaCompra],c.TotalCosto from COMPRA c
inner join PROVEEDOR p on p.IdProveedor = c.IdProveedor
inner join TIENDA t on t.IdTienda = c.IdTienda
where 
CONVERT(date,c.FechaRegistro) between @FechaInicio and @FechaFin and
p.IdProveedor = iif(@IdProveedor = 0,p.IdProveedor,@IdProveedor) and
t.IdTienda =iif(@IdTienda = 0,t.IdTienda,@IdTienda) 

end


GO
/****** Object:  StoredProcedure [dbo].[usp_ObtenerListaVenta]    Script Date: 25/05/2022 18:40:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDMIENTO PARA OBTENER LISTA VENTA

create procedure [dbo].[usp_ObtenerListaVenta](
@Codigo varchar(50) = '',
@FechaInicio date,
@FechaFin date,
@NumeroDocumento varchar(50) = '',
@Nombre varchar(100) = ''
)
as
begin
SET DATEFORMAT dmy;
select v.IdVenta, v.TipoDocumento,v.Codigo,v.FechaRegistro,c.NumeroDocumento,c.Nombre,v.TotalCosto from VENTA v 
inner join CLIENTE c on c.IdCliente = v.IdCliente
where 
v.Codigo = iif(@Codigo='',v.Codigo,@Codigo) and
CONVERT(date,v.FechaRegistro) between @FechaInicio and @FechaFin and
c.NumeroDocumento like CONCAT('%',@NumeroDocumento,'%') and
c.Nombre like CONCAT('%',@Nombre,'%')

end

GO
/****** Object:  StoredProcedure [dbo].[usp_ObtenerPermisos]    Script Date: 25/05/2022 18:40:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDMIENTO PARA OBTENER PERMISOS
create procedure [dbo].[usp_ObtenerPermisos](
@IdRol int)
as
begin
select p.IdPermisos,m.Nombre[Menu],sm.Nombre[SubMenu],p.Activo from PERMISOS p
inner join SUBMENU sm on sm.IdSubMenu = p.IdSubMenu
inner join MENU m on m.IdMenu = sm.IdMenu
where p.IdRol = @IdRol
end

GO
/****** Object:  StoredProcedure [dbo].[usp_ObtenerProductos]    Script Date: 25/05/2022 18:40:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEMIENTO PARA OBTENER PRODUCTO
CREATE PROC [dbo].[usp_ObtenerProductos]
as
begin
 select IdProducto,Codigo,ValorCodigo,Nombre,p.Descripcion[DescripcionProducto],p.IdCategoria,p.Activo,c.Descripcion[DescripcionCategoria] from PRODUCTO p
 inner join CATEGORIA c on c.IdCategoria = p.IdCategoria

end

GO
/****** Object:  StoredProcedure [dbo].[usp_ObtenerProductoTienda]    Script Date: 25/05/2022 18:40:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/********************* PRODUCTO_TIENDA **************************/


--PROCEDMIENTO PARA OBTENER PRODUCTO_TIENDA
CREATE PROC [dbo].[usp_ObtenerProductoTienda]
as
begin
 select pt.IdProductoTienda,p.IdProducto,p.Codigo[CodigoProducto], p.Nombre[NombreProducto],p.Descripcion[DescripcionProducto],
 t.IdTienda,t.RUC,t.Nombre[NombreTienda] ,t.Direccion[DireccionTienda],pt.PrecioUnidadCompra,pt.PrecioUnidadVenta,pt.Stock,pt.Iniciado
 from PRODUCTO_TIENDA pt
 inner join PRODUCTO p on p.IdProducto = pt.IdProducto
 inner join TIENDA t on t.IdTienda = pt.IdTienda
end

GO
/****** Object:  StoredProcedure [dbo].[usp_ObtenerProveedores]    Script Date: 25/05/2022 18:40:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDMIENTO PARA OBTENER PROVEEDORES
CREATE PROC [dbo].[usp_ObtenerProveedores]
as
begin
 select IdProveedor,RUC,RazonSocial,Telefono,Correo,Direccion,Activo from PROVEEDOR
end

GO
/****** Object:  StoredProcedure [dbo].[usp_ObtenerRoles]    Script Date: 25/05/2022 18:40:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDMIENTO PARA OBTENER ROLES
CREATE PROC [dbo].[usp_ObtenerRoles]
as
begin
 select IdRol, Descripcion,Activo from ROL
end

GO
/****** Object:  StoredProcedure [dbo].[usp_ObtenerTienda]    Script Date: 25/05/2022 18:40:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDMIENTO PARA OBTENER TIENDAS
CREATE PROC [dbo].[usp_ObtenerTienda]
as
begin
 select IdTienda,Nombre,RUC,Direccion,Telefono,Activo from TIENDA
end

GO
/****** Object:  StoredProcedure [dbo].[usp_ObtenerUsuario]    Script Date: 25/05/2022 18:40:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDMIENTO PARA OBTENER USUARIOS
CREATE PROC [dbo].[usp_ObtenerUsuario]
as
begin
 select u.IdUsuario,u.Nombres,u.Apellidos,u.Correo,u.Usuario,u.Clave,u.IdTienda,u.IdRol,u.Activo,u.FechaRegistro,r.Descripcion[DescripcionRol],u.Activo from USUARIO u
 inner join ROL r on r.IdRol = u.IdRol
end

GO
/****** Object:  StoredProcedure [dbo].[usp_RegistrarCategoria]    Script Date: 25/05/2022 18:40:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTO PARA GUARDAR CATEGORIA
CREATE PROC [dbo].[usp_RegistrarCategoria](
@Descripcion varchar(50),
@Resultado bit output
)as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM CATEGORIA WHERE Descripcion = @Descripcion)

		insert into CATEGORIA(Descripcion) values (
		@Descripcion
		)
	ELSE
		SET @Resultado = 0
	
end

GO
/****** Object:  StoredProcedure [dbo].[usp_RegistrarCompra]    Script Date: 25/05/2022 18:40:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/********************* COMPRA **************************/

--PROCEDIMIENTO PARA REGITRAR COMPRA
create procedure [dbo].[usp_RegistrarCompra](
@Detalle xml,
@Resultado bit output
)
as
begin


begin try

	BEGIN TRANSACTION

	declare @compra table(idusuario int,idproveedor int,idtienda int,totalcosto float)
	declare @detallecompra table(idcompra int,idproducto int,cantidad int,preciounidadcompra float,preciounidadventa float,totalcosto float)
	declare @tiendaproducto table(idtienda int,idproducto int,cantidad int,preciounidadcompra float,preciounidadventa float,totalcosto float)

	 insert into @compra(idusuario,idproveedor,idtienda,totalcosto)
	 select 
	 IdUsuario = Node.Data.value('(IdUsuario)[1]','int'),
	 IdProveedor = Node.Data.value('(IdProveedor)[1]','int'),
	 IdTienda = Node.Data.value('(IdTienda)[1]','int'),
	 TotalCosto = Node.Data.value('(TotalCosto)[1]','float')
	 FROM @Detalle.nodes('/DETALLE/COMPRA') Node(Data)
 
	 insert into @detallecompra(idcompra,idproducto,cantidad,preciounidadcompra,preciounidadventa,totalcosto)
	 select 
	 IdCompra = Node.Data.value('(IdCompra)[1]','int'),
	 IdProducto = Node.Data.value('(IdProducto)[1]','int'),
	 Cantidad = Node.Data.value('(Cantidad)[1]','int'),
	 PrecioUnidadCompra = Node.Data.value('(PrecioUnidadCompra)[1]','float'),
	 PrecioUnidadVenta = Node.Data.value('(PrecioUnidadVenta)[1]','float'),
	 TotalCosto = Node.Data.value('(TotalCosto)[1]','float')
	 FROM @Detalle.nodes('/DETALLE/DETALLE_COMPRA/DETALLE') Node(Data)

	 insert into @tiendaproducto(idtienda,idproducto,cantidad,preciounidadcompra,preciounidadventa,totalcosto)
	 select
	 (select top 1 idtienda from @compra),
	 idproducto,cantidad,preciounidadcompra,preciounidadventa,totalcosto
	 from @detallecompra


	 --******************* AREA DE TRABAJO *************************
	 declare @IdCompra int = 0

	 insert into COMPRA(IdUsuario,IdProveedor,IdTienda,TotalCosto)
	 select idusuario,idproveedor,idtienda,totalcosto from @compra

	 set @IdCompra = Scope_identity()
	 update @detallecompra set idcompra = @IdCompra

	 insert into DETALLE_COMPRA(IdCompra,IdProducto,Cantidad,PrecioUnitarioCompra,PrecioUnitarioVenta,TotalCosto)
	 select idcompra,idproducto,cantidad,preciounidadcompra,preciounidadventa,totalcosto from @detallecompra

	 update pt set 
	 pt.PrecioUnidadCompra = tp.preciounidadcompra, 
	 pt.PrecioUnidadVenta = tp.preciounidadventa,
	 pt.Stock = pt.Stock + tp.cantidad,
	 pt.Iniciado = 1
	 from PRODUCTO_TIENDA pt
	 inner join @tiendaproducto tp on tp.idtienda = pt.IdTienda and tp.idproducto = pt.IdProducto

	 COMMIT
	 set @Resultado = 1

 end try
 begin catch
	ROLLBACK
	set @Resultado = 0
 end catch
end



GO
/****** Object:  StoredProcedure [dbo].[usp_RegistrarProducto]    Script Date: 25/05/2022 18:40:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTO PARA GUARDAR PRODUCTO
CREATE PROC [dbo].[usp_RegistrarProducto](
@Nombre varchar(50),
@Descripcion varchar(50),
@IdCategoria int,
@Resultado bit output
)as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM PRODUCTO WHERE rtrim(ltrim(Nombre)) = rtrim(ltrim(@Nombre)))

		insert into PRODUCTO(Codigo,ValorCodigo,Nombre,Descripcion,IdCategoria) values (
		RIGHT('000000' + convert(varchar(max),(select isnull(max(ValorCodigo),0) + 1 from PRODUCTO)),6),(select isnull(max(ValorCodigo),0) + 1 from PRODUCTO),@Nombre,@Descripcion,@IdCategoria
		)
	ELSE
		SET @Resultado = 0
	
end

GO
/****** Object:  StoredProcedure [dbo].[usp_RegistrarProductoTienda]    Script Date: 25/05/2022 18:40:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--PROCEDIMIENTO PARA GUARDAR PRODUCTO_TIENDA
CREATE PROC [dbo].[usp_RegistrarProductoTienda](
@IdProducto int,
@IdTienda int,
@Resultado bit output
)as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM PRODUCTO_TIENDA WHERE IdProducto = @IdProducto and IdTienda = @IdTienda)

		insert into PRODUCTO_TIENDA(IdProducto,IdTienda) values (
		@IdProducto,@IdTienda
		)
	ELSE
		SET @Resultado = 0
	
end

GO
/****** Object:  StoredProcedure [dbo].[usp_RegistrarProveedor]    Script Date: 25/05/2022 18:40:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--PROCEDIMIENTO PARA GUARDAR PROVEEDOR
CREATE PROC [dbo].[usp_RegistrarProveedor](
@Ruc varchar(50),
@RazonSocial varchar(100),
@Telefono varchar(50),
@Correo varchar(50),
@Direccion varchar(50),
@Resultado bit output
)as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM PROVEEDOR WHERE RUC = @Ruc)

		insert into PROVEEDOR(RUC,RazonSocial,Telefono,Correo,Direccion)
		values(@Ruc,@RazonSocial,@Telefono,@Correo,@Direccion)

	ELSE
		SET @Resultado = 0
	
end

GO
/****** Object:  StoredProcedure [dbo].[usp_RegistrarRol]    Script Date: 25/05/2022 18:40:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTO PARA GUARDAR ROL
CREATE PROC [dbo].[usp_RegistrarRol](
@Descripcion varchar(50),
@Resultado bit output
)as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM ROL WHERE Descripcion = @Descripcion)
	begin
		declare @idrol int = 0
		insert into ROL(Descripcion) values (
		@Descripcion
		)
		set @idrol  = Scope_identity()

		insert into PERMISOS(IdRol,IdSubMenu,Activo)
		select @idrol, IdSubMenu,0 from SUBMENU
	end
	ELSE
		SET @Resultado = 0
	
end


GO
/****** Object:  StoredProcedure [dbo].[usp_RegistrarTienda]    Script Date: 25/05/2022 18:40:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDIMIENTO PARA GUARDAR TIENDA
CREATE PROC [dbo].[usp_RegistrarTienda](
@Nombre varchar(50),
@Ruc varchar(50),
@Direccion varchar(50),
@Telefono varchar(50),
@Resultado bit output
)as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM TIENDA WHERE Nombre = @Nombre)

		insert into TIENDA(Nombre,RUC,Direccion,Telefono) values (
		@Nombre,@Ruc,@Direccion,@Telefono
		)
	ELSE
		SET @Resultado = 0
	
end

GO
/****** Object:  StoredProcedure [dbo].[usp_RegistrarUsuario]    Script Date: 25/05/2022 18:40:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDIMIENTO PARA REGISTRAR USUARIO
CREATE PROC [dbo].[usp_RegistrarUsuario](
@Nombres varchar(50),
@Apellidos varchar(50),
@Correo varchar(50),
@Usuario varchar(50),
@Clave varchar(50),
@IdTienda int,
@IdRol int,
@Resultado bit output
)as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM USUARIO WHERE Usuario = @Usuario)

		insert into USUARIO(Nombres,Apellidos,Correo,Usuario,Clave,IdTienda,IdRol) values (
		@Nombres,@Apellidos,@Correo,@Usuario,@Clave,@IdTienda,@IdRol
		)
	ELSE
		SET @Resultado = 0
	
end

GO
/****** Object:  StoredProcedure [dbo].[usp_RegistrarVenta]    Script Date: 25/05/2022 18:40:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/********************* VENTA **************************/

--PROCEDIMIENTO PARA REGITRAR VENTA
create procedure [dbo].[usp_RegistrarVenta](
@Detalle xml,
@Resultado int output
)
as
begin


begin try

	BEGIN TRANSACTION
	
	declare @cliente table (tipodocumento varchar(50),numerodocumento varchar(50),nombre varchar(100),direccion varchar(100),telefono varchar(50))
	declare @venta table (idtienda int,idusuario int,idcliente int default 0,tipodocumento varchar(50),cantidadproducto int,cantidadtotal int,totalcosto float,importerecibido float,importecambio float)
	declare @detalleventa table (idventa int,idproducto int,cantidad int,preciounidad float,importetotal float)

	insert into @cliente(tipodocumento,numerodocumento,nombre,direccion,telefono)
		 select 
		 tipodocumento = Node.Data.value('(TipoDocumento)[1]','varchar(50)'),
		 numerodocumento = Node.Data.value('(NumeroDocumento)[1]','varchar(50)'),
		 nombre = Node.Data.value('(Nombre)[1]','varchar(100)'),
		 direccion = Node.Data.value('(Direccion)[1]','varchar(100)'),
		 telefono = Node.Data.value('(Telefono)[1]','varchar(50)')
		 FROM @Detalle.nodes('/DETALLE/DETALLE_CLIENTE/DATOS') Node(Data)

	insert into @venta(idtienda,idusuario,idcliente,tipodocumento,cantidadproducto,cantidadtotal,totalcosto,importerecibido,importecambio)
	select 
		 IdTienda = Node.Data.value('(IdTienda)[1]','varchar(50)'),
		 IdUsuario = Node.Data.value('(IdUsuario)[1]','varchar(50)'),
		 IdCliente = Node.Data.value('(IdCliente)[1]','varchar(100)'),
		 TipoDocumento = Node.Data.value('(TipoDocumento)[1]','varchar(100)'),
		 CantidadProducto = Node.Data.value('(CantidadProducto)[1]','varchar(50)'),
		 CantidadTotal = Node.Data.value('(CantidadTotal)[1]','varchar(50)'),
		 TotalCosto = Node.Data.value('(TotalCosto)[1]','varchar(50)'),
		 ImporteRecibido = Node.Data.value('(ImporteRecibido)[1]','varchar(50)'),
		 ImporteCambio = Node.Data.value('(ImporteCambio)[1]','varchar(50)')
		 FROM @Detalle.nodes('/DETALLE/VENTA') Node(Data)

	insert into @detalleventa(idventa,idproducto,cantidad,preciounidad,importetotal)
		 select 
		 IdVenta = Node.Data.value('(IdVenta)[1]','int'),
		 IdProducto = Node.Data.value('(IdProducto)[1]','int'),
		 Cantidad = Node.Data.value('(Cantidad)[1]','int'),
		 PrecioUnidad = Node.Data.value('(PrecioUnidad)[1]','float'),
		 ImporteTotal = Node.Data.value('(ImporteTotal)[1]','float')
		 FROM @Detalle.nodes('/DETALLE/DETALLE_VENTA/DATOS') Node(Data)

	--******************* AREA DE TRABAJO *************************
	declare @identity as table(ID int)

	insert into CLIENTE(TipoDocumento,NumeroDocumento,Nombre,Direccion,Telefono)
	output inserted.IdCliente into @identity
	select tipodocumento,numerodocumento,nombre,direccion,telefono from @cliente

	update @venta set idcliente = (select ID from @identity)
	delete from @identity

	insert into VENTA(Codigo,ValorCodigo,IdTienda,IdUsuario,IdCliente,TipoDocumento,CantidadProducto,CantidadTotal,TotalCosto,ImporteRecibido,ImporteCambio)
	output inserted.IdVenta into @identity
	select 
	RIGHT('000000' + convert(varchar(max),(select isnull(max(ValorCodigo),0) + 1 from VENTA) ),6),
	(select isnull(max(ValorCodigo),0) + 1 from VENTA),
	idtienda,idusuario,idcliente,tipodocumento,cantidadproducto,cantidadtotal,totalcosto,importerecibido,importecambio
	from @venta

	update @detalleventa set idventa = (select ID from @identity)

	insert into DETALLE_VENTA(IdVenta,IdProducto,Cantidad,PrecioUnidad,ImporteTotal)
	select idventa,idproducto,cantidad,preciounidad,importetotal from @detalleventa


	 COMMIT
	 set @Resultado = (select ID from @identity)

 end try
 begin catch
	ROLLBACK
	set @Resultado = 0
 end catch
end

GO
/****** Object:  StoredProcedure [dbo].[usp_rptProductoTienda]    Script Date: 25/05/2022 18:40:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROCEDMIENTO PARA REPORTE TIENDA PRODUCTO

 create procedure [dbo].[usp_rptProductoTienda](
 @IdTienda int = 0,
 @Codigo varchar(50)
 )
 as
 begin
 select 
 t.RUC[Ruc Tienda],t.Nombre[Nombre Tienda],t.Direccion[Direccion Tienda],
 p.Codigo[Codigo Producto],p.Nombre[Nombre Producto],p.Descripcion[Descripcion Producto],
 pt.Stock[Stock en tienda],convert(decimal(10,2),pt.PrecioUnidadCompra)[Precio Compra],convert(decimal(10,2),pt.PrecioUnidadVenta)[Precio Venta]
 from PRODUCTO_TIENDA pt
 inner join PRODUCTO p on p.IdProducto = pt.IdProducto
 inner join TIENDA t on t.IdTienda = pt.IdTienda
 where pt.IdTienda = iif(@IdTienda = 0,pt.IdTienda,@IdTienda) and
 p.Codigo like '%' + @Codigo + '%'
 end

GO
/****** Object:  StoredProcedure [dbo].[usp_rptVenta]    Script Date: 25/05/2022 18:40:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 --PROCEDMIENTO PARA REPORTE VENTA

create procedure [dbo].[usp_rptVenta] (
@FechaInicio date,
@FechaFin date,
@IdTienda int = 0
)
as
begin

 select convert(char(10), v.FechaRegistro ,103)[Fecha Venta],v.Codigo[Numero Documento],v.TipoDocumento[Tipo Documento],
 t.Nombre[Nombre Tienda], t.RUC[Ruc Tienda],
 concat(u.Nombres,' ', u.apellidos)[Nombre Empleado],
 v.CantidadTotal[Cantidad Unidades Vendidas],v.CantidadProducto[Cantidad Productos],v.TotalCosto[Total Venta] 
 from VENTA v
 inner join TIENDA t on t.IdTienda = v.IdTienda
 inner join USUARIO u on u.IdUsuario = v.IdUsuario
 where 
 CONVERT(date,v.FechaRegistro) between @FechaInicio and @FechaFin 
 and v.IdTienda = iif(@IdTienda =0 ,v.IdTienda,@IdTienda)
end
GO
USE [master]
GO
ALTER DATABASE [DBPRUEBAS] SET  READ_WRITE 
GO
