USE [master]
GO
/****** Object:  Database [tvrtka]    Script Date: 20.3.2019. 3:37:53 ******/
CREATE DATABASE [tvrtka]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'tvrtka', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\tvrtka.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'tvrtka_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\tvrtka_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [tvrtka] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [tvrtka].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [tvrtka] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [tvrtka] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [tvrtka] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [tvrtka] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [tvrtka] SET ARITHABORT OFF 
GO
ALTER DATABASE [tvrtka] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [tvrtka] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [tvrtka] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [tvrtka] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [tvrtka] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [tvrtka] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [tvrtka] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [tvrtka] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [tvrtka] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [tvrtka] SET  DISABLE_BROKER 
GO
ALTER DATABASE [tvrtka] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [tvrtka] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [tvrtka] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [tvrtka] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [tvrtka] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [tvrtka] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [tvrtka] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [tvrtka] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [tvrtka] SET  MULTI_USER 
GO
ALTER DATABASE [tvrtka] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [tvrtka] SET DB_CHAINING OFF 
GO
ALTER DATABASE [tvrtka] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [tvrtka] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [tvrtka] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [tvrtka] SET QUERY_STORE = OFF
GO
USE [tvrtka]
GO
/****** Object:  Table [dbo].[odjeli]    Script Date: 20.3.2019. 3:37:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[odjeli](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[naziv] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_odjeli] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[operacije]    Script Date: 20.3.2019. 3:37:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[operacije](
	[id_radnika] [int] NOT NULL,
	[id_odjela] [int] NOT NULL,
	[aktivnost] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_operacije_1] PRIMARY KEY CLUSTERED 
(
	[id_radnika] ASC,
	[id_odjela] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[radnici]    Script Date: 20.3.2019. 3:37:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[radnici](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ime] [nvarchar](50) NOT NULL,
	[prezime] [nvarchar](50) NULL,
 CONSTRAINT [PK_radnici] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[odjeli] ON 

INSERT [dbo].[odjeli] ([id], [naziv]) VALUES (1, N'nabava')
INSERT [dbo].[odjeli] ([id], [naziv]) VALUES (2, N'prodaja')
INSERT [dbo].[odjeli] ([id], [naziv]) VALUES (3, N'proizvodnja')
SET IDENTITY_INSERT [dbo].[odjeli] OFF
INSERT [dbo].[operacije] ([id_radnika], [id_odjela], [aktivnost]) VALUES (1, 1, N'vodi')
INSERT [dbo].[operacije] ([id_radnika], [id_odjela], [aktivnost]) VALUES (2, 1, N'radi')
INSERT [dbo].[operacije] ([id_radnika], [id_odjela], [aktivnost]) VALUES (3, 2, N'radi')
INSERT [dbo].[operacije] ([id_radnika], [id_odjela], [aktivnost]) VALUES (4, 2, N'vodi')
INSERT [dbo].[operacije] ([id_radnika], [id_odjela], [aktivnost]) VALUES (6, 3, N'vodi')
INSERT [dbo].[operacije] ([id_radnika], [id_odjela], [aktivnost]) VALUES (8, 2, N'radi')
INSERT [dbo].[operacije] ([id_radnika], [id_odjela], [aktivnost]) VALUES (9, 1, N'radi')
INSERT [dbo].[operacije] ([id_radnika], [id_odjela], [aktivnost]) VALUES (10, 3, N'radi')
INSERT [dbo].[operacije] ([id_radnika], [id_odjela], [aktivnost]) VALUES (11, 3, N'radi')
SET IDENTITY_INSERT [dbo].[radnici] ON 

INSERT [dbo].[radnici] ([id], [ime], [prezime]) VALUES (1, N'Pero', N'Perić')
INSERT [dbo].[radnici] ([id], [ime], [prezime]) VALUES (2, N'Mara', N'Marić')
INSERT [dbo].[radnici] ([id], [ime], [prezime]) VALUES (3, N'Marko', N'Markić')
INSERT [dbo].[radnici] ([id], [ime], [prezime]) VALUES (4, N'Moro', N'Morović')
INSERT [dbo].[radnici] ([id], [ime], [prezime]) VALUES (6, N'Niko', N'Nikić')
INSERT [dbo].[radnici] ([id], [ime], [prezime]) VALUES (8, N'Vide', N'Vidić')
INSERT [dbo].[radnici] ([id], [ime], [prezime]) VALUES (9, N'Ivo', N'Ivić')
INSERT [dbo].[radnici] ([id], [ime], [prezime]) VALUES (10, N'Jozo', N'Jozić')
INSERT [dbo].[radnici] ([id], [ime], [prezime]) VALUES (11, N'Mirko', N'Mirić')
SET IDENTITY_INSERT [dbo].[radnici] OFF
ALTER TABLE [dbo].[operacije]  WITH CHECK ADD  CONSTRAINT [FK_operacije_odjeli] FOREIGN KEY([id_odjela])
REFERENCES [dbo].[odjeli] ([id])
GO
ALTER TABLE [dbo].[operacije] CHECK CONSTRAINT [FK_operacije_odjeli]
GO
ALTER TABLE [dbo].[operacije]  WITH CHECK ADD  CONSTRAINT [FK_operacije_radnici] FOREIGN KEY([id_radnika])
REFERENCES [dbo].[radnici] ([id])
GO
ALTER TABLE [dbo].[operacije] CHECK CONSTRAINT [FK_operacije_radnici]
GO
USE [master]
GO
ALTER DATABASE [tvrtka] SET  READ_WRITE 
GO
