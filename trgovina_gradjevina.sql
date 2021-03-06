USE [master]
GO
/****** Object:  Database [trgovina]    Script Date: 20.3.2019. 12:05:28 ******/
CREATE DATABASE [trgovina]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'trgovina', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\trgovina.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'trgovina_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\trgovina_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [trgovina] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [trgovina].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [trgovina] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [trgovina] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [trgovina] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [trgovina] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [trgovina] SET ARITHABORT OFF 
GO
ALTER DATABASE [trgovina] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [trgovina] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [trgovina] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [trgovina] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [trgovina] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [trgovina] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [trgovina] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [trgovina] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [trgovina] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [trgovina] SET  DISABLE_BROKER 
GO
ALTER DATABASE [trgovina] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [trgovina] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [trgovina] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [trgovina] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [trgovina] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [trgovina] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [trgovina] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [trgovina] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [trgovina] SET  MULTI_USER 
GO
ALTER DATABASE [trgovina] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [trgovina] SET DB_CHAINING OFF 
GO
ALTER DATABASE [trgovina] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [trgovina] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [trgovina] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [trgovina] SET QUERY_STORE = OFF
GO
USE [trgovina]
GO
/****** Object:  Table [dbo].[aktivnosti]    Script Date: 20.3.2019. 12:05:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aktivnosti](
	[id_radnika] [int] NOT NULL,
	[id_skladista] [int] NOT NULL,
	[aktivnost] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_aktivnosti] PRIMARY KEY CLUSTERED 
(
	[id_radnika] ASC,
	[id_skladista] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[proizvodi]    Script Date: 20.3.2019. 12:05:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[proizvodi](
	[id] [int] IDENTITY(1000,1) NOT NULL,
	[naziv] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_proizvodi] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[skladista]    Script Date: 20.3.2019. 12:05:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[skladista](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[naziv] [nvarchar](50) NOT NULL,
	[adresa] [nvarchar](50) NULL,
	[mjesto] [nvarchar](50) NULL,
 CONSTRAINT [PK_skladista] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[stanja]    Script Date: 20.3.2019. 12:05:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stanja](
	[id_skladista] [int] NOT NULL,
	[id_proizvoda] [int] NOT NULL,
	[kolicina] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[trgovci]    Script Date: 20.3.2019. 12:05:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[trgovci](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ime] [nvarchar](50) NOT NULL,
	[prezime] [nvarchar](50) NULL,
	[spol] [bit] NULL,
 CONSTRAINT [PK_trgovci] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[aktivnosti] ([id_radnika], [id_skladista], [aktivnost]) VALUES (1, 3, N'radi')
INSERT [dbo].[aktivnosti] ([id_radnika], [id_skladista], [aktivnost]) VALUES (2, 1, N'vodi')
INSERT [dbo].[aktivnosti] ([id_radnika], [id_skladista], [aktivnost]) VALUES (3, 2, N'radi')
INSERT [dbo].[aktivnosti] ([id_radnika], [id_skladista], [aktivnost]) VALUES (4, 3, N'vodi')
INSERT [dbo].[aktivnosti] ([id_radnika], [id_skladista], [aktivnost]) VALUES (5, 2, N'vodi')
INSERT [dbo].[aktivnosti] ([id_radnika], [id_skladista], [aktivnost]) VALUES (6, 1, N'radi')
INSERT [dbo].[aktivnosti] ([id_radnika], [id_skladista], [aktivnost]) VALUES (7, 2, N'radi')
INSERT [dbo].[aktivnosti] ([id_radnika], [id_skladista], [aktivnost]) VALUES (8, 1, N'radi')
SET IDENTITY_INSERT [dbo].[proizvodi] ON 

INSERT [dbo].[proizvodi] ([id], [naziv]) VALUES (1000, N'cigle')
INSERT [dbo].[proizvodi] ([id], [naziv]) VALUES (1001, N'crijepovi')
INSERT [dbo].[proizvodi] ([id], [naziv]) VALUES (1002, N'blokovi')
INSERT [dbo].[proizvodi] ([id], [naziv]) VALUES (1003, N'daske')
INSERT [dbo].[proizvodi] ([id], [naziv]) VALUES (1004, N'grede')
INSERT [dbo].[proizvodi] ([id], [naziv]) VALUES (1005, N'lamperija')
INSERT [dbo].[proizvodi] ([id], [naziv]) VALUES (1006, N'cement')
INSERT [dbo].[proizvodi] ([id], [naziv]) VALUES (1007, N'gips')
INSERT [dbo].[proizvodi] ([id], [naziv]) VALUES (1008, N'glet')
SET IDENTITY_INSERT [dbo].[proizvodi] OFF
SET IDENTITY_INSERT [dbo].[skladista] ON 

INSERT [dbo].[skladista] ([id], [naziv], [adresa], [mjesto]) VALUES (1, N'Keramička građa', N'Đordanova 6', N'Zagreb')
INSERT [dbo].[skladista] ([id], [naziv], [adresa], [mjesto]) VALUES (2, N'Drvena građa', N'Đeksonova 12', N'Rijeka')
INSERT [dbo].[skladista] ([id], [naziv], [adresa], [mjesto]) VALUES (3, N'Vezivni materijal', N'Šumaherova 27', N'Sisak')
SET IDENTITY_INSERT [dbo].[skladista] OFF
INSERT [dbo].[stanja] ([id_skladista], [id_proizvoda], [kolicina]) VALUES (1, 1000, 10000)
INSERT [dbo].[stanja] ([id_skladista], [id_proizvoda], [kolicina]) VALUES (1, 1001, 20000)
INSERT [dbo].[stanja] ([id_skladista], [id_proizvoda], [kolicina]) VALUES (1, 1002, 15000)
INSERT [dbo].[stanja] ([id_skladista], [id_proizvoda], [kolicina]) VALUES (2, 1003, 5000)
INSERT [dbo].[stanja] ([id_skladista], [id_proizvoda], [kolicina]) VALUES (2, 1004, 1000)
INSERT [dbo].[stanja] ([id_skladista], [id_proizvoda], [kolicina]) VALUES (2, 1005, 10000)
INSERT [dbo].[stanja] ([id_skladista], [id_proizvoda], [kolicina]) VALUES (3, 1006, 5000)
INSERT [dbo].[stanja] ([id_skladista], [id_proizvoda], [kolicina]) VALUES (3, 1006, 3000)
INSERT [dbo].[stanja] ([id_skladista], [id_proizvoda], [kolicina]) VALUES (3, 1008, 2500)
SET IDENTITY_INSERT [dbo].[trgovci] ON 

INSERT [dbo].[trgovci] ([id], [ime], [prezime], [spol]) VALUES (1, N'Pero', N'Perić', 0)
INSERT [dbo].[trgovci] ([id], [ime], [prezime], [spol]) VALUES (2, N'Mara', N'Marić', 1)
INSERT [dbo].[trgovci] ([id], [ime], [prezime], [spol]) VALUES (3, N'Janja', N'Janjić', 1)
INSERT [dbo].[trgovci] ([id], [ime], [prezime], [spol]) VALUES (4, N'Drago', N'Dragić', 0)
INSERT [dbo].[trgovci] ([id], [ime], [prezime], [spol]) VALUES (5, N'Josip', N'Josić', 0)
INSERT [dbo].[trgovci] ([id], [ime], [prezime], [spol]) VALUES (6, N'Karlo', N'Karlić', 0)
INSERT [dbo].[trgovci] ([id], [ime], [prezime], [spol]) VALUES (7, N'Marko', N'Markić', 0)
INSERT [dbo].[trgovci] ([id], [ime], [prezime], [spol]) VALUES (8, N'Kata', N'Katić', 1)
SET IDENTITY_INSERT [dbo].[trgovci] OFF
ALTER TABLE [dbo].[aktivnosti]  WITH CHECK ADD  CONSTRAINT [FK_aktivnosti_skladista] FOREIGN KEY([id_skladista])
REFERENCES [dbo].[skladista] ([id])
GO
ALTER TABLE [dbo].[aktivnosti] CHECK CONSTRAINT [FK_aktivnosti_skladista]
GO
ALTER TABLE [dbo].[aktivnosti]  WITH CHECK ADD  CONSTRAINT [FK_aktivnosti_trgovci] FOREIGN KEY([id_radnika])
REFERENCES [dbo].[trgovci] ([id])
GO
ALTER TABLE [dbo].[aktivnosti] CHECK CONSTRAINT [FK_aktivnosti_trgovci]
GO
ALTER TABLE [dbo].[stanja]  WITH CHECK ADD  CONSTRAINT [FK_stanja_proizvodi] FOREIGN KEY([id_proizvoda])
REFERENCES [dbo].[proizvodi] ([id])
GO
ALTER TABLE [dbo].[stanja] CHECK CONSTRAINT [FK_stanja_proizvodi]
GO
ALTER TABLE [dbo].[stanja]  WITH CHECK ADD  CONSTRAINT [FK_stanja_skladista] FOREIGN KEY([id_skladista])
REFERENCES [dbo].[skladista] ([id])
GO
ALTER TABLE [dbo].[stanja] CHECK CONSTRAINT [FK_stanja_skladista]
GO
ALTER TABLE [dbo].[skladista]  WITH CHECK ADD  CONSTRAINT [chk_mjesto] CHECK  (([mjesto]='Zagreb' OR [mjesto]='Sisak' OR [mjesto]='Rijeka'))
GO
ALTER TABLE [dbo].[skladista] CHECK CONSTRAINT [chk_mjesto]
GO
USE [master]
GO
ALTER DATABASE [trgovina] SET  READ_WRITE 
GO
