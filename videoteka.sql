USE [master]
GO
/****** Object:  Database [videoteka]    Script Date: 20.3.2019. 14:43:58 ******/
CREATE DATABASE [videoteka]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'videoteka', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\videoteka.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'videoteka_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\videoteka_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [videoteka] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [videoteka].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [videoteka] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [videoteka] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [videoteka] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [videoteka] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [videoteka] SET ARITHABORT OFF 
GO
ALTER DATABASE [videoteka] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [videoteka] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [videoteka] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [videoteka] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [videoteka] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [videoteka] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [videoteka] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [videoteka] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [videoteka] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [videoteka] SET  DISABLE_BROKER 
GO
ALTER DATABASE [videoteka] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [videoteka] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [videoteka] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [videoteka] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [videoteka] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [videoteka] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [videoteka] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [videoteka] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [videoteka] SET  MULTI_USER 
GO
ALTER DATABASE [videoteka] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [videoteka] SET DB_CHAINING OFF 
GO
ALTER DATABASE [videoteka] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [videoteka] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [videoteka] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [videoteka] SET QUERY_STORE = OFF
GO
USE [videoteka]
GO
/****** Object:  Table [dbo].[cijene]    Script Date: 20.3.2019. 14:43:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cijene](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[vrsta] [nvarchar](50) NOT NULL,
	[cijena] [int] NOT NULL,
	[zakasnina] [nchar](10) NOT NULL,
 CONSTRAINT [PK_cijene] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[clanovi]    Script Date: 20.3.2019. 14:43:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clanovi](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ime] [nvarchar](50) NOT NULL,
	[prezime] [nvarchar](50) NULL,
	[oib] [nchar](13) NOT NULL,
 CONSTRAINT [PK_clanovi] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[filmovi]    Script Date: 20.3.2019. 14:43:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[filmovi](
	[id] [int] IDENTITY(1000,1) NOT NULL,
	[naziv] [nvarchar](50) NOT NULL,
	[vhs_kolicina] [int] NULL,
	[dvd_kolicina] [int] NULL,
	[blu_ray_kolicina] [int] NULL,
	[id_zanra] [int] NOT NULL,
	[id_cijene] [int] NOT NULL,
 CONSTRAINT [PK_filmovi] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[posudbe]    Script Date: 20.3.2019. 14:43:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[posudbe](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[datum_posudbe] [date] NOT NULL,
	[datum_vracanja] [date] NULL,
	[id_clana] [int] NOT NULL,
	[id_filma] [int] NOT NULL,
 CONSTRAINT [PK_posudbe] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[zanrovi]    Script Date: 20.3.2019. 14:43:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zanrovi](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[zanr] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_zanrovi] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[cijene] ON 

INSERT [dbo].[cijene] ([id], [vrsta], [cijena], [zakasnina]) VALUES (1, N'hit', 10, N'3         ')
INSERT [dbo].[cijene] ([id], [vrsta], [cijena], [zakasnina]) VALUES (2, N'obični', 8, N'2         ')
INSERT [dbo].[cijene] ([id], [vrsta], [cijena], [zakasnina]) VALUES (3, N'stari', 5, N'1         ')
SET IDENTITY_INSERT [dbo].[cijene] OFF
SET IDENTITY_INSERT [dbo].[clanovi] ON 

INSERT [dbo].[clanovi] ([id], [ime], [prezime], [oib]) VALUES (3, N'Miro', N'Mirić', N'1231321231234')
INSERT [dbo].[clanovi] ([id], [ime], [prezime], [oib]) VALUES (4, N'Pero', N'Perić', N'3213123213124')
INSERT [dbo].[clanovi] ([id], [ime], [prezime], [oib]) VALUES (5, N'Marko', N'Markić', N'4324324324321')
INSERT [dbo].[clanovi] ([id], [ime], [prezime], [oib]) VALUES (6, N'Niko', N'Nikić', N'4232344322341')
INSERT [dbo].[clanovi] ([id], [ime], [prezime], [oib]) VALUES (7, N'Ivan', N'Ivanić', N'0980988908909')
INSERT [dbo].[clanovi] ([id], [ime], [prezime], [oib]) VALUES (8, N'Mara', N'Marić', N'8768768768767')
INSERT [dbo].[clanovi] ([id], [ime], [prezime], [oib]) VALUES (9, N'Ana', N'Anić', N'5765675675676')
INSERT [dbo].[clanovi] ([id], [ime], [prezime], [oib]) VALUES (10, N'Kata', N'Katić', N'0987657896542')
INSERT [dbo].[clanovi] ([id], [ime], [prezime], [oib]) VALUES (11, N'Iva', N'Ivić', N'9872348763457')
SET IDENTITY_INSERT [dbo].[clanovi] OFF
SET IDENTITY_INSERT [dbo].[filmovi] ON 

INSERT [dbo].[filmovi] ([id], [naziv], [vhs_kolicina], [dvd_kolicina], [blu_ray_kolicina], [id_zanra], [id_cijene]) VALUES (1000, N'Rio Bravo', 5, 10, 5, 2, 3)
INSERT [dbo].[filmovi] ([id], [naziv], [vhs_kolicina], [dvd_kolicina], [blu_ray_kolicina], [id_zanra], [id_cijene]) VALUES (1001, N'Tarzan', 3, 15, 10, 6, 2)
INSERT [dbo].[filmovi] ([id], [naziv], [vhs_kolicina], [dvd_kolicina], [blu_ray_kolicina], [id_zanra], [id_cijene]) VALUES (1002, N'Aquaman', NULL, 20, 20, 5, 1)
INSERT [dbo].[filmovi] ([id], [naziv], [vhs_kolicina], [dvd_kolicina], [blu_ray_kolicina], [id_zanra], [id_cijene]) VALUES (1003, N'Egzorcist', 5, 10, 7, 4, 3)
INSERT [dbo].[filmovi] ([id], [naziv], [vhs_kolicina], [dvd_kolicina], [blu_ray_kolicina], [id_zanra], [id_cijene]) VALUES (1004, N'Vragolasti Denis', 2, 15, 8, 1, 2)
INSERT [dbo].[filmovi] ([id], [naziv], [vhs_kolicina], [dvd_kolicina], [blu_ray_kolicina], [id_zanra], [id_cijene]) VALUES (1005, N'Iskupljenje u Shawshanku', 7, 15, 10, 3, 2)
INSERT [dbo].[filmovi] ([id], [naziv], [vhs_kolicina], [dvd_kolicina], [blu_ray_kolicina], [id_zanra], [id_cijene]) VALUES (1006, N'Logan', NULL, 15, 15, 3, 1)
SET IDENTITY_INSERT [dbo].[filmovi] OFF
SET IDENTITY_INSERT [dbo].[posudbe] ON 

INSERT [dbo].[posudbe] ([id], [datum_posudbe], [datum_vracanja], [id_clana], [id_filma]) VALUES (1, CAST(N'2019-03-01' AS Date), NULL, 5, 1000)
INSERT [dbo].[posudbe] ([id], [datum_posudbe], [datum_vracanja], [id_clana], [id_filma]) VALUES (3, CAST(N'2019-03-15' AS Date), CAST(N'2019-03-20' AS Date), 3, 1001)
INSERT [dbo].[posudbe] ([id], [datum_posudbe], [datum_vracanja], [id_clana], [id_filma]) VALUES (4, CAST(N'2019-03-17' AS Date), NULL, 7, 1003)
INSERT [dbo].[posudbe] ([id], [datum_posudbe], [datum_vracanja], [id_clana], [id_filma]) VALUES (6, CAST(N'2019-03-10' AS Date), CAST(N'2019-03-16' AS Date), 5, 1006)
INSERT [dbo].[posudbe] ([id], [datum_posudbe], [datum_vracanja], [id_clana], [id_filma]) VALUES (7, CAST(N'2019-02-28' AS Date), CAST(N'2019-03-05' AS Date), 4, 1000)
INSERT [dbo].[posudbe] ([id], [datum_posudbe], [datum_vracanja], [id_clana], [id_filma]) VALUES (8, CAST(N'2019-03-19' AS Date), NULL, 8, 1002)
INSERT [dbo].[posudbe] ([id], [datum_posudbe], [datum_vracanja], [id_clana], [id_filma]) VALUES (9, CAST(N'2019-03-16' AS Date), NULL, 10, 1004)
INSERT [dbo].[posudbe] ([id], [datum_posudbe], [datum_vracanja], [id_clana], [id_filma]) VALUES (10, CAST(N'2019-03-18' AS Date), NULL, 11, 1005)
INSERT [dbo].[posudbe] ([id], [datum_posudbe], [datum_vracanja], [id_clana], [id_filma]) VALUES (12, CAST(N'2019-03-18' AS Date), CAST(N'2019-03-20' AS Date), 9, 1002)
INSERT [dbo].[posudbe] ([id], [datum_posudbe], [datum_vracanja], [id_clana], [id_filma]) VALUES (13, CAST(N'2019-03-17' AS Date), CAST(N'2019-03-19' AS Date), 6, 1003)
SET IDENTITY_INSERT [dbo].[posudbe] OFF
SET IDENTITY_INSERT [dbo].[zanrovi] ON 

INSERT [dbo].[zanrovi] ([id], [zanr]) VALUES (1, N'komedija')
INSERT [dbo].[zanrovi] ([id], [zanr]) VALUES (2, N'vestern')
INSERT [dbo].[zanrovi] ([id], [zanr]) VALUES (3, N'drama')
INSERT [dbo].[zanrovi] ([id], [zanr]) VALUES (4, N'horor')
INSERT [dbo].[zanrovi] ([id], [zanr]) VALUES (5, N'akcija')
INSERT [dbo].[zanrovi] ([id], [zanr]) VALUES (6, N'animirani')
SET IDENTITY_INSERT [dbo].[zanrovi] OFF
ALTER TABLE [dbo].[filmovi]  WITH CHECK ADD  CONSTRAINT [FK_filmovi_cijene] FOREIGN KEY([id_cijene])
REFERENCES [dbo].[cijene] ([id])
GO
ALTER TABLE [dbo].[filmovi] CHECK CONSTRAINT [FK_filmovi_cijene]
GO
ALTER TABLE [dbo].[filmovi]  WITH CHECK ADD  CONSTRAINT [FK_filmovi_zanrovi] FOREIGN KEY([id_zanra])
REFERENCES [dbo].[zanrovi] ([id])
GO
ALTER TABLE [dbo].[filmovi] CHECK CONSTRAINT [FK_filmovi_zanrovi]
GO
ALTER TABLE [dbo].[posudbe]  WITH CHECK ADD  CONSTRAINT [FK_posudbe_clanovi] FOREIGN KEY([id_clana])
REFERENCES [dbo].[clanovi] ([id])
GO
ALTER TABLE [dbo].[posudbe] CHECK CONSTRAINT [FK_posudbe_clanovi]
GO
ALTER TABLE [dbo].[posudbe]  WITH CHECK ADD  CONSTRAINT [FK_posudbe_filmovi] FOREIGN KEY([id_filma])
REFERENCES [dbo].[filmovi] ([id])
GO
ALTER TABLE [dbo].[posudbe] CHECK CONSTRAINT [FK_posudbe_filmovi]
GO
ALTER TABLE [dbo].[clanovi]  WITH CHECK ADD  CONSTRAINT [chk_oib] CHECK  (([oib] like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'))
GO
ALTER TABLE [dbo].[clanovi] CHECK CONSTRAINT [chk_oib]
GO
USE [master]
GO
ALTER DATABASE [videoteka] SET  READ_WRITE 
GO
