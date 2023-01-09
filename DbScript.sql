USE [master]
GO
/****** Object:  Database [ToDo]    Script Date: 1/8/2023 6:54:47 PM ******/
CREATE DATABASE [ToDo]
 CONTAINMENT = NONE
GO
ALTER DATABASE [ToDo] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ToDo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ToDo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ToDo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ToDo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ToDo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ToDo] SET ARITHABORT OFF 
GO
ALTER DATABASE [ToDo] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ToDo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ToDo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ToDo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ToDo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ToDo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ToDo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ToDo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ToDo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ToDo] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ToDo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ToDo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ToDo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ToDo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ToDo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ToDo] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [ToDo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ToDo] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ToDo] SET  MULTI_USER 
GO
ALTER DATABASE [ToDo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ToDo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ToDo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ToDo] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ToDo] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ToDo] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ToDo] SET QUERY_STORE = OFF
GO
USE [ToDo]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 1/8/2023 6:54:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TodoLists]    Script Date: 1/8/2023 6:54:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TodoLists](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[WhenCreated] [datetimeoffset](7) NOT NULL,
 CONSTRAINT [PK_TodoLists] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TodoTasks]    Script Date: 1/8/2023 6:54:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TodoTasks](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Status] [nvarchar](max) NOT NULL,
	[TodoListId] [int] NULL,
 CONSTRAINT [PK_TodoTasks] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[TodoLists] ON 

INSERT [dbo].[TodoLists] ([Id], [Title], [WhenCreated]) VALUES (1, N'Trabajo', CAST(N'2023-01-09T00:21:47.0670000+00:00' AS DateTimeOffset))
INSERT [dbo].[TodoLists] ([Id], [Title], [WhenCreated]) VALUES (2, N'Cursos', CAST(N'2023-01-09T00:23:46.9980000+00:00' AS DateTimeOffset))
INSERT [dbo].[TodoLists] ([Id], [Title], [WhenCreated]) VALUES (3, N'Extra', CAST(N'2023-01-09T00:25:45.9130000+00:00' AS DateTimeOffset))
SET IDENTITY_INSERT [dbo].[TodoLists] OFF
GO
SET IDENTITY_INSERT [dbo].[TodoTasks] ON 

INSERT [dbo].[TodoTasks] ([Id], [Title], [Status], [TodoListId]) VALUES (1, N'Crear proyecto', N'Completada', 1)
INSERT [dbo].[TodoTasks] ([Id], [Title], [Status], [TodoListId]) VALUES (2, N'Empezar con el modelo', N'Completada', 1)
INSERT [dbo].[TodoTasks] ([Id], [Title], [Status], [TodoListId]) VALUES (3, N'Subir cambios', N'Pendiente', 1)
INSERT [dbo].[TodoTasks] ([Id], [Title], [Status], [TodoListId]) VALUES (5, N'.Net 7', N'Pendiente', 2)
INSERT [dbo].[TodoTasks] ([Id], [Title], [Status], [TodoListId]) VALUES (6, N'C#', N'Pendiente', 2)
INSERT [dbo].[TodoTasks] ([Id], [Title], [Status], [TodoListId]) VALUES (7, N'Revisar cambios', N'Pendiente', 1)
INSERT [dbo].[TodoTasks] ([Id], [Title], [Status], [TodoListId]) VALUES (8, N'Trabajo extra', N'Completada', 3)
SET IDENTITY_INSERT [dbo].[TodoTasks] OFF
GO
/****** Object:  Index [IX_TodoTasks_TodoListId]    Script Date: 1/8/2023 6:54:47 PM ******/
CREATE NONCLUSTERED INDEX [IX_TodoTasks_TodoListId] ON [dbo].[TodoTasks]
(
	[TodoListId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TodoTasks]  WITH CHECK ADD  CONSTRAINT [FK_TodoTasks_TodoLists_TodoListId] FOREIGN KEY([TodoListId])
REFERENCES [dbo].[TodoLists] ([Id])
GO
ALTER TABLE [dbo].[TodoTasks] CHECK CONSTRAINT [FK_TodoTasks_TodoLists_TodoListId]
GO
USE [master]
GO
ALTER DATABASE [ToDo] SET  READ_WRITE 
GO
