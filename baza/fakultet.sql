USE [master]
GO
/****** Object:  Database [Fakultet]    Script Date: 21.3.2019. 18:58:14 ******/
CREATE DATABASE [Fakultet]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Fakultet', FILENAME = N'D:\Code\AlgebraCSharp2019-1\Baze\Fakultet.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Fakultet_log', FILENAME = N'D:\Code\AlgebraCSharp2019-1\Baze\Fakultet_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Fakultet] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Fakultet].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Fakultet] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Fakultet] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Fakultet] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Fakultet] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Fakultet] SET ARITHABORT OFF 
GO
ALTER DATABASE [Fakultet] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Fakultet] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Fakultet] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Fakultet] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Fakultet] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Fakultet] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Fakultet] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Fakultet] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Fakultet] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Fakultet] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Fakultet] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Fakultet] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Fakultet] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Fakultet] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Fakultet] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Fakultet] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Fakultet] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Fakultet] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Fakultet] SET  MULTI_USER 
GO
ALTER DATABASE [Fakultet] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Fakultet] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Fakultet] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Fakultet] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Fakultet] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Fakultet] SET QUERY_STORE = OFF
GO
USE [Fakultet]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Fakultet]
GO
/****** Object:  Table [dbo].[orgjed]    Script Date: 21.3.2019. 18:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orgjed](
	[sifOrgjed] [int] NOT NULL,
	[nazOrgjed] [nvarchar](60) NOT NULL,
	[sifNadorgjed] [int] NULL,
 CONSTRAINT [PK_orgjed] PRIMARY KEY CLUSTERED 
(
	[sifOrgjed] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_orgjed_ukupno_jedinica]    Script Date: 21.3.2019. 18:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_orgjed_ukupno_jedinica]
AS
SELECT        TOP (100) PERCENT o1.sifOrgjed, o1.nazOrgjed, COUNT(o2.nazOrgjed) AS 'broj_zavoda'
FROM            dbo.orgjed AS o1 LEFT OUTER JOIN
                         dbo.orgjed AS o2 ON o1.sifOrgjed = o2.sifNadorgjed
GROUP BY o1.sifOrgjed, o1.nazOrgjed
HAVING        (COUNT(o2.nazOrgjed) <> 0)
GO
/****** Object:  Table [dbo].[nastavnik]    Script Date: 21.3.2019. 18:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nastavnik](
	[sifNastavnik] [int] NOT NULL,
	[imeNastavnik] [nvarchar](25) NOT NULL,
	[prezNastavnik] [nvarchar](25) NOT NULL,
	[pbrStan] [int] NOT NULL,
	[sifOrgjed] [int] NOT NULL,
	[koef] [decimal](3, 2) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mjesto]    Script Date: 21.3.2019. 18:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mjesto](
	[pbr] [int] NOT NULL,
	[nazMjesto] [nvarchar](40) NOT NULL,
	[sifZupanija] [smallint] NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_mjesta_bez_nastavnika]    Script Date: 21.3.2019. 18:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_mjesta_bez_nastavnika]
AS
SELECT        dbo.mjesto.nazMjesto
FROM            dbo.mjesto LEFT OUTER JOIN
                         dbo.nastavnik ON dbo.mjesto.pbr = dbo.nastavnik.pbrStan
WHERE        (dbo.nastavnik.imeNastavnik IS NULL)
GO
/****** Object:  View [dbo].[v_mjes_bez_nast_na_slovo_n]    Script Date: 21.3.2019. 18:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_mjes_bez_nast_na_slovo_n]
AS
SELECT        TOP (100) PERCENT nazMjesto
FROM            dbo.v_mjesta_bez_nastavnika
WHERE        (nazMjesto LIKE N'B%')
GO
/****** Object:  Table [dbo].[zupanija]    Script Date: 21.3.2019. 18:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zupanija](
	[sifZupanija] [smallint] NOT NULL,
	[nazZupanija] [nvarchar](40) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ispit]    Script Date: 21.3.2019. 18:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ispit](
	[mbrStud] [int] NOT NULL,
	[sifPred] [int] NOT NULL,
	[sifNastavnik] [int] NOT NULL,
	[datIspit] [datetime] NOT NULL,
	[ocjena] [smallint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[stud]    Script Date: 21.3.2019. 18:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stud](
	[mbrStud] [int] IDENTITY(1524,1) NOT NULL,
	[imeStud] [nvarchar](25) NULL,
	[prezStud] [nvarchar](25) NULL,
	[pbrRod] [int] NULL,
	[pbrStan] [int] NOT NULL,
	[datRodStud] [datetime] NULL,
	[jmbgStud] [nvarchar](13) NULL,
 CONSTRAINT [PK_tempstud] PRIMARY KEY CLUSTERED 
(
	[mbrStud] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_nastavnik_mjesto_student]    Script Date: 21.3.2019. 18:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_nastavnik_mjesto_student]
AS
SELECT        n.sifNastavnik, n.imeNastavnik, n.prezNastavnik, n.pbrStan, n.sifOrgjed, n.koef, m1.nazMjesto, m2.nazMjesto AS Expr1, z1.nazZupanija
FROM            dbo.nastavnik AS n LEFT OUTER JOIN
                         dbo.ispit AS i ON n.sifNastavnik = i.sifNastavnik INNER JOIN
                         dbo.stud AS s ON i.mbrStud = s.mbrStud LEFT OUTER JOIN
                         dbo.mjesto AS m1 ON m1.pbr = n.pbrStan LEFT OUTER JOIN
                         dbo.zupanija AS z1 ON z1.sifZupanija = m1.sifZupanija LEFT OUTER JOIN
                         dbo.mjesto AS m2 ON m2.pbr = s.pbrStan AND m1.sifZupanija = m2.sifZupanija LEFT OUTER JOIN
                         dbo.zupanija AS z2 ON z2.sifZupanija = m2.sifZupanija
WHERE        (m1.pbr <> m2.pbr)
GO
/****** Object:  View [dbo].[v_nastavnici_mjesto]    Script Date: 21.3.2019. 18:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_nastavnici_mjesto] AS
SELECT [imeNastavnik] AS ime
      ,[prezNastavnik] AS prezime
	  ,[Fakultet].[dbo].[mjesto].nazMjesto AS 'Mjesto u kojem �ivi'
  FROM [dbo].[nastavnik] LEFT JOIN mjesto
  ON nastavnik.pbrStan = mjesto.pbr
GO
/****** Object:  View [dbo].[v_stud]    Script Date: 21.3.2019. 18:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_stud] AS
SELECT TOP (1000) [mbrStud]
      ,[imeStud]
      ,[prezStud]
      ,[pbrRod]
      ,[pbrStan]
      ,[datRodStud]
      ,[jmbgStud]
  FROM [Fakultet].[dbo].[stud]
GO
/****** Object:  Table [dbo].[dvorana]    Script Date: 21.3.2019. 18:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dvorana](
	[oznDvorana] [nvarchar](5) NOT NULL,
	[kapacitet] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[nova_tablica]    Script Date: 21.3.2019. 18:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nova_tablica](
	[mbrStud] [int] IDENTITY(1520,1) NOT NULL,
	[imeStud] [nvarchar](25) NOT NULL,
	[prezStud] [nvarchar](25) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pred]    Script Date: 21.3.2019. 18:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pred](
	[sifPred] [int] NOT NULL,
	[kratPred] [nvarchar](8) NULL,
	[nazPred] [nvarchar](60) NOT NULL,
	[sifOrgjed] [int] NULL,
	[upisanoStud] [int] NULL,
	[brojSatiTjedno] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rezervacija]    Script Date: 21.3.2019. 18:58:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rezervacija](
	[oznDvorana] [nvarchar](5) NOT NULL,
	[oznVrstaDan] [nvarchar](2) NOT NULL,
	[sat] [smallint] NOT NULL,
	[sifPred] [int] NOT NULL
) ON [PRIMARY]
GO
INSERT [dbo].[dvorana] ([oznDvorana], [kapacitet]) VALUES (N'A001 ', 24)
INSERT [dbo].[dvorana] ([oznDvorana], [kapacitet]) VALUES (N'A002 ', 10)
INSERT [dbo].[dvorana] ([oznDvorana], [kapacitet]) VALUES (N'A101 ', 39)
INSERT [dbo].[dvorana] ([oznDvorana], [kapacitet]) VALUES (N'A102 ', 40)
INSERT [dbo].[dvorana] ([oznDvorana], [kapacitet]) VALUES (N'A104 ', 20)
INSERT [dbo].[dvorana] ([oznDvorana], [kapacitet]) VALUES (N'A105 ', 16)
INSERT [dbo].[dvorana] ([oznDvorana], [kapacitet]) VALUES (N'A111 ', 40)
INSERT [dbo].[dvorana] ([oznDvorana], [kapacitet]) VALUES (N'A201 ', 40)
INSERT [dbo].[dvorana] ([oznDvorana], [kapacitet]) VALUES (N'A202 ', 39)
INSERT [dbo].[dvorana] ([oznDvorana], [kapacitet]) VALUES (N'A204 ', 20)
INSERT [dbo].[dvorana] ([oznDvorana], [kapacitet]) VALUES (N'A205 ', 20)
INSERT [dbo].[dvorana] ([oznDvorana], [kapacitet]) VALUES (N'A209 ', 35)
INSERT [dbo].[dvorana] ([oznDvorana], [kapacitet]) VALUES (N'A210 ', 35)
INSERT [dbo].[dvorana] ([oznDvorana], [kapacitet]) VALUES (N'A211 ', 39)
INSERT [dbo].[dvorana] ([oznDvorana], [kapacitet]) VALUES (N'A301 ', 18)
INSERT [dbo].[dvorana] ([oznDvorana], [kapacitet]) VALUES (N'A302 ', 18)
INSERT [dbo].[dvorana] ([oznDvorana], [kapacitet]) VALUES (N'A304 ', 15)
INSERT [dbo].[dvorana] ([oznDvorana], [kapacitet]) VALUES (N'A309 ', 22)
INSERT [dbo].[dvorana] ([oznDvorana], [kapacitet]) VALUES (N'A310 ', 20)
INSERT [dbo].[dvorana] ([oznDvorana], [kapacitet]) VALUES (N'A311 ', 20)
INSERT [dbo].[dvorana] ([oznDvorana], [kapacitet]) VALUES (N'A312 ', 20)
INSERT [dbo].[dvorana] ([oznDvorana], [kapacitet]) VALUES (N'B1   ', 64)
INSERT [dbo].[dvorana] ([oznDvorana], [kapacitet]) VALUES (N'B2   ', 30)
INSERT [dbo].[dvorana] ([oznDvorana], [kapacitet]) VALUES (N'B3   ', 30)
INSERT [dbo].[dvorana] ([oznDvorana], [kapacitet]) VALUES (N'B4   ', 64)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1167, 229, 122, CAST(N'2002-08-23T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1210, 545, 481, CAST(N'2002-10-22T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1272, 607, 191, CAST(N'2003-01-14T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1312, 474, 142, CAST(N'2003-06-05T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1369, 57, 256, CAST(N'2002-12-30T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1426, 349, 379, CAST(N'2003-08-22T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1464, 146, 326, CAST(N'2002-12-17T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1490, 474, 501, CAST(N'2003-04-10T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1127, 430, 277, CAST(N'2002-11-27T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1306, 594, 456, CAST(N'2003-05-20T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1471, 367, 195, CAST(N'2003-06-24T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1421, 238, 277, CAST(N'2003-06-06T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1267, 194, 330, CAST(N'2003-04-02T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1376, 241, 501, CAST(N'2002-10-09T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1498, 238, 277, CAST(N'2003-05-30T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1370, 362, 456, CAST(N'2003-05-01T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1434, 37, 166, CAST(N'2003-06-20T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1393, 489, 371, CAST(N'2003-06-03T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1120, 545, 122, CAST(N'2003-08-25T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1125, 423, 150, CAST(N'2003-01-07T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1127, 458, 166, CAST(N'2002-12-30T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1172, 102, 232, CAST(N'2002-06-21T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1139, 607, 281, CAST(N'2002-12-10T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1140, 301, 301, CAST(N'2002-09-10T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1145, 355, 334, CAST(N'2003-06-03T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1230, 68, 371, CAST(N'2002-12-13T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1152, 549, 391, CAST(N'2002-03-26T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1153, 278, 436, CAST(N'2003-09-11T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1160, 99, 481, CAST(N'2002-12-02T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1331, 609, 505, CAST(N'2002-09-19T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1172, 305, 154, CAST(N'2003-09-03T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1173, 253, 166, CAST(N'2002-06-28T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1178, 515, 236, CAST(N'2002-10-07T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1386, 459, 256, CAST(N'2002-10-30T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1189, 367, 285, CAST(N'2003-08-27T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1190, 453, 301, CAST(N'2003-01-14T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1441, 420, 391, CAST(N'2002-11-08T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1204, 576, 436, CAST(N'2003-03-24T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1209, 267, 465, CAST(N'2002-09-12T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1216, 423, 509, CAST(N'2002-11-25T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1490, 229, 122, CAST(N'2002-12-11T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1222, 305, 154, CAST(N'2003-01-13T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1223, 253, 166, CAST(N'2003-01-07T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1229, 515, 236, CAST(N'2003-04-22T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1230, 459, 256, CAST(N'2003-04-18T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1237, 453, 301, CAST(N'2002-09-19T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1242, 525, 334, CAST(N'2003-08-27T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1243, 106, 375, CAST(N'2003-09-05T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1249, 420, 391, CAST(N'2003-09-04T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1254, 267, 465, CAST(N'2003-09-10T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1259, 545, 481, CAST(N'2003-06-27T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1261, 423, 509, CAST(N'2003-01-24T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1266, 474, 142, CAST(N'2003-04-15T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1222, 357, 154, CAST(N'2003-10-21T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1274, 39, 236, CAST(N'2002-10-25T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1279, 57, 256, CAST(N'2003-09-12T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1280, 304, 289, CAST(N'2002-10-22T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1266, 286, 326, CAST(N'2003-09-02T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1287, 288, 367, CAST(N'2003-02-04T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1292, 658, 379, CAST(N'2003-04-17T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1294, 594, 411, CAST(N'2003-06-19T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1299, 450, 436, CAST(N'2003-08-26T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1306, 229, 481, CAST(N'2002-09-30T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1314, 357, 154, CAST(N'2003-04-21T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1351, 607, 191, CAST(N'2003-05-06T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1317, 39, 236, CAST(N'2003-09-16T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1323, 57, 256, CAST(N'2003-01-23T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1324, 304, 289, CAST(N'2003-02-11T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1329, 286, 326, CAST(N'2003-04-01T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1393, 288, 367, CAST(N'2003-05-16T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1336, 658, 379, CAST(N'2003-05-09T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1337, 594, 411, CAST(N'2003-05-26T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1343, 450, 436, CAST(N'2002-07-05T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1344, 312, 465, CAST(N'2003-09-02T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1434, 229, 481, CAST(N'2002-12-26T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1351, 305, 514, CAST(N'2003-09-09T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1356, 474, 142, CAST(N'2003-04-30T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1357, 357, 154, CAST(N'2002-05-20T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1363, 607, 191, CAST(N'2003-09-12T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1483, 39, 236, CAST(N'2003-01-03T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1370, 304, 289, CAST(N'2003-06-12T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1376, 286, 326, CAST(N'2002-11-29T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1377, 288, 367, CAST(N'2003-04-10T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1381, 594, 411, CAST(N'2003-07-04T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1386, 450, 436, CAST(N'2003-05-23T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1388, 312, 465, CAST(N'2003-03-14T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1393, 229, 481, CAST(N'2003-03-10T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1230, 305, 514, CAST(N'2002-10-11T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1401, 646, 154, CAST(N'2003-01-22T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1406, 367, 195, CAST(N'2003-05-23T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1408, 429, 244, CAST(N'2003-03-12T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1331, 430, 277, CAST(N'2002-12-17T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1419, 146, 326, CAST(N'2003-02-18T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1421, 371, 367, CAST(N'2003-10-08T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1386, 362, 411, CAST(N'2003-01-31T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1433, 594, 456, CAST(N'2003-05-27T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1434, 441, 469, CAST(N'2003-01-13T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1439, 474, 501, CAST(N'2003-07-04T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1441, 357, 514, CAST(N'2002-01-07T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1441, 241, 142, CAST(N'2003-09-16T00:00:00.000' AS DateTime), 4)
GO
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1450, 646, 154, CAST(N'2003-01-21T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1451, 367, 195, CAST(N'2003-04-11T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1457, 429, 244, CAST(N'2003-03-03T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1458, 430, 277, CAST(N'2003-01-14T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1490, 356, 289, CAST(N'2003-08-27T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1470, 371, 367, CAST(N'2002-11-29T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1471, 349, 379, CAST(N'2003-04-23T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1476, 362, 411, CAST(N'2002-12-10T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1483, 594, 456, CAST(N'2002-09-24T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1484, 441, 469, CAST(N'2003-05-19T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1491, 357, 514, CAST(N'2003-08-20T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1498, 241, 142, CAST(N'2003-07-04T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1503, 646, 154, CAST(N'2002-11-04T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1504, 367, 195, CAST(N'2003-04-24T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1152, 356, 289, CAST(N'2003-09-16T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1173, 146, 326, CAST(N'2003-02-17T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1202, 371, 367, CAST(N'2003-01-17T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1370, 474, 501, CAST(N'2003-09-16T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1414, 241, 142, CAST(N'2002-09-11T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1439, 646, 154, CAST(N'2003-01-28T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1496, 429, 244, CAST(N'2003-02-14T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1202, 146, 326, CAST(N'2003-01-23T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1223, 371, 367, CAST(N'2002-09-20T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1249, 349, 379, CAST(N'2003-08-22T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1272, 362, 411, CAST(N'2003-01-29T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1324, 594, 456, CAST(N'2002-05-10T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1349, 441, 469, CAST(N'2003-09-22T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1393, 357, 514, CAST(N'2003-01-17T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1450, 262, 154, CAST(N'2002-03-06T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1471, 284, 232, CAST(N'2003-09-16T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1496, 343, 244, CAST(N'2002-09-18T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1147, 238, 277, CAST(N'2002-11-22T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1180, 194, 330, CAST(N'2003-10-14T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1202, 103, 367, CAST(N'2003-03-06T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1235, 419, 379, CAST(N'2002-09-05T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1253, 98, 411, CAST(N'2003-06-13T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1267, 362, 456, CAST(N'2003-04-16T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1286, 346, 469, CAST(N'2002-11-26T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1312, 241, 501, CAST(N'2003-03-06T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1324, 646, 514, CAST(N'2003-10-07T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1343, 264, 142, CAST(N'2003-01-10T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1357, 262, 154, CAST(N'2003-03-17T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1388, 284, 232, CAST(N'2003-09-02T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1439, 583, 289, CAST(N'2002-06-03T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1464, 194, 330, CAST(N'2002-01-18T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1483, 103, 367, CAST(N'2003-09-19T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1498, 419, 379, CAST(N'2003-05-23T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1132, 98, 411, CAST(N'2003-09-26T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1165, 362, 456, CAST(N'2003-09-22T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1180, 346, 469, CAST(N'2003-03-18T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1202, 241, 501, CAST(N'2003-06-03T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1217, 646, 514, CAST(N'2003-12-11T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1253, 264, 142, CAST(N'2002-09-10T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1267, 262, 154, CAST(N'2002-12-16T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1286, 284, 232, CAST(N'2003-11-03T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1294, 343, 244, CAST(N'2002-12-12T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1324, 238, 277, CAST(N'2003-09-18T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1343, 583, 289, CAST(N'2003-03-27T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1376, 103, 367, CAST(N'2003-09-12T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1406, 419, 379, CAST(N'2003-09-11T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1439, 362, 456, CAST(N'2002-11-20T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1450, 346, 469, CAST(N'2003-10-21T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1483, 241, 501, CAST(N'2002-12-06T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1498, 646, 514, CAST(N'2003-04-10T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1132, 264, 142, CAST(N'2002-10-03T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1147, 262, 154, CAST(N'2002-10-17T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1180, 284, 232, CAST(N'2003-02-18T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1202, 343, 244, CAST(N'2003-03-28T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1217, 238, 277, CAST(N'2003-02-10T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1235, 583, 289, CAST(N'2002-10-14T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1286, 103, 367, CAST(N'2003-05-16T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1294, 419, 379, CAST(N'2002-12-02T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1312, 98, 411, CAST(N'2003-06-25T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1343, 362, 456, CAST(N'2003-02-04T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1357, 346, 469, CAST(N'2003-10-07T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1388, 646, 514, CAST(N'2003-11-04T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1421, 264, 142, CAST(N'2003-02-24T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1439, 262, 154, CAST(N'2002-11-19T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1450, 284, 232, CAST(N'2003-08-25T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1464, 343, 244, CAST(N'2003-01-07T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1145, 583, 289, CAST(N'2003-10-27T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1222, 103, 367, CAST(N'2003-07-01T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1300, 419, 379, CAST(N'2003-04-22T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1336, 98, 411, CAST(N'2003-04-18T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1406, 346, 469, CAST(N'2002-10-31T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1484, 646, 514, CAST(N'2003-07-01T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1145, 99, 122, CAST(N'2003-04-22T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1180, 609, 146, CAST(N'2003-01-24T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1300, 370, 232, CAST(N'2003-03-27T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1336, 259, 244, CAST(N'2003-07-01T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1370, 265, 277, CAST(N'2003-04-23T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1441, 303, 289, CAST(N'2003-02-04T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1450, 650, 334, CAST(N'2003-10-10T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1484, 489, 371, CAST(N'2003-09-10T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1145, 209, 391, CAST(N'2003-02-04T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1222, 367, 420, CAST(N'2002-12-27T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1259, 98, 456, CAST(N'2003-04-10T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1300, 378, 469, CAST(N'2003-05-15T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1336, 264, 501, CAST(N'2003-08-15T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1406, 262, 514, CAST(N'2003-09-04T00:00:00.000' AS DateTime), 2)
GO
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1450, 609, 146, CAST(N'2003-02-07T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1145, 37, 166, CAST(N'2003-08-29T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1180, 370, 232, CAST(N'2003-07-04T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1259, 265, 277, CAST(N'2003-06-05T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1336, 303, 289, CAST(N'2002-11-01T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1370, 650, 334, CAST(N'2003-06-27T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1406, 489, 371, CAST(N'2003-01-03T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1441, 209, 391, CAST(N'2003-08-26T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1484, 367, 420, CAST(N'2003-09-16T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1173, 378, 469, CAST(N'2003-06-02T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1222, 264, 501, CAST(N'2003-04-11T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1351, 99, 122, CAST(N'2003-10-24T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1393, 609, 146, CAST(N'2003-03-31T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1173, 259, 244, CAST(N'2002-08-23T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1222, 265, 277, CAST(N'2003-06-03T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1266, 303, 289, CAST(N'2003-03-05T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1351, 650, 334, CAST(N'2003-09-23T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1434, 209, 391, CAST(N'2002-10-23T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1483, 367, 420, CAST(N'2003-03-11T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1173, 98, 456, CAST(N'2003-09-05T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1222, 378, 469, CAST(N'2003-10-13T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1266, 264, 501, CAST(N'2003-09-16T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1434, 609, 146, CAST(N'2003-03-24T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1483, 37, 166, CAST(N'2003-09-10T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1132, 370, 232, CAST(N'2003-04-23T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1222, 259, 244, CAST(N'2003-06-12T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1266, 265, 277, CAST(N'2003-08-27T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1312, 303, 289, CAST(N'2002-12-27T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1434, 489, 371, CAST(N'2002-05-16T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1483, 209, 391, CAST(N'2003-09-03T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1132, 367, 420, CAST(N'2003-04-07T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1266, 378, 469, CAST(N'2002-09-25T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1351, 262, 514, CAST(N'2003-01-28T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1393, 99, 122, CAST(N'2003-11-25T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1483, 609, 146, CAST(N'2003-04-17T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1172, 37, 166, CAST(N'2002-09-12T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1230, 370, 232, CAST(N'2003-08-29T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1490, 303, 289, CAST(N'2003-04-17T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1172, 650, 334, CAST(N'2003-11-18T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1230, 489, 371, CAST(N'2003-02-21T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1441, 367, 420, CAST(N'2003-09-09T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1490, 98, 456, CAST(N'2003-04-01T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1172, 378, 469, CAST(N'2002-04-26T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1386, 262, 514, CAST(N'2002-02-25T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1441, 99, 122, CAST(N'2003-10-08T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1490, 609, 146, CAST(N'2003-05-23T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1230, 37, 166, CAST(N'2003-09-26T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1331, 370, 232, CAST(N'2003-10-15T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1386, 259, 244, CAST(N'2003-01-02T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1441, 265, 277, CAST(N'2003-02-27T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1230, 650, 334, CAST(N'2003-01-24T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1331, 489, 371, CAST(N'2003-10-21T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1386, 209, 391, CAST(N'2003-05-02T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1490, 367, 420, CAST(N'2003-01-01T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1172, 98, 456, CAST(N'2003-10-06T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1230, 378, 469, CAST(N'2002-09-19T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1331, 264, 501, CAST(N'2003-08-28T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1133, 104, 256, CAST(N'2003-05-02T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1173, 576, 436, CAST(N'2003-10-21T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1307, 305, 514, CAST(N'2003-06-05T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1414, 356, 289, CAST(N'2003-11-26T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1324, 441, 469, CAST(N'2003-05-20T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1172, 303, 289, CAST(N'2003-09-05T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1196, 525, 334, CAST(N'2003-11-12T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1439, 264, 142, CAST(N'2004-02-10T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1406, 343, 244, CAST(N'2003-10-28T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1357, 194, 330, CAST(N'2003-10-30T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1331, 259, 244, CAST(N'2003-10-28T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1400, 241, 142, CAST(N'2003-07-02T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1421, 98, 411, CAST(N'2003-06-06T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1312, 264, 501, CAST(N'2003-10-24T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1312, 312, 465, CAST(N'2003-05-23T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1197, 106, 375, CAST(N'2003-08-22T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1513, 429, 244, CAST(N'2003-09-25T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1450, 241, 501, CAST(N'2003-06-23T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1312, 262, 514, CAST(N'2004-01-09T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1441, 262, 514, CAST(N'2003-04-10T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1172, 658, 379, CAST(N'2003-10-13T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1165, 583, 289, CAST(N'2003-11-19T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1259, 37, 166, CAST(N'2003-10-21T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1159, 169, 460, CAST(N'2003-09-24T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1127, 458, 166, CAST(N'2002-01-15T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1230, 68, 371, CAST(N'2002-08-27T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1190, 453, 301, CAST(N'2002-09-17T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1230, 459, 256, CAST(N'2002-11-22T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1173, 576, 436, CAST(N'2002-10-02T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1292, 658, 379, CAST(N'2003-04-07T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1329, 286, 326, CAST(N'2002-11-04T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1434, 229, 481, CAST(N'2002-09-04T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1386, 450, 436, CAST(N'2003-05-19T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1406, 367, 195, CAST(N'2002-12-12T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1441, 241, 142, CAST(N'2002-10-21T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1249, 349, 379, CAST(N'2002-12-05T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1439, 264, 142, CAST(N'2003-02-24T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1180, 194, 330, CAST(N'2003-01-15T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1312, 241, 501, CAST(N'2002-11-28T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1165, 362, 456, CAST(N'2002-10-14T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1286, 284, 232, CAST(N'2003-03-07T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1406, 419, 379, CAST(N'2002-10-24T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1132, 264, 142, CAST(N'2002-09-12T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1259, 37, 166, CAST(N'2002-10-18T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1484, 489, 371, CAST(N'2002-12-17T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1406, 262, 514, CAST(N'2003-04-07T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1259, 265, 277, CAST(N'2002-09-25T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1132, 98, 456, CAST(N'2002-04-09T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1132, 370, 232, CAST(N'2002-09-06T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1483, 209, 391, CAST(N'2002-09-04T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1393, 99, 122, CAST(N'2003-06-06T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1490, 303, 289, CAST(N'2002-04-12T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1172, 378, 469, CAST(N'2002-01-14T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1331, 370, 232, CAST(N'2003-07-08T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1386, 209, 391, CAST(N'2002-08-23T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1133, 104, 256, CAST(N'2002-10-18T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1159, 169, 460, CAST(N'2003-05-26T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1167, 229, 122, CAST(N'2002-01-18T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1196, 525, 334, CAST(N'2002-12-05T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1197, 106, 375, CAST(N'2002-07-02T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1210, 545, 481, CAST(N'2002-08-19T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1132, 367, 285, CAST(N'2002-08-23T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1173, 576, 436, CAST(N'2003-04-03T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1272, 607, 191, CAST(N'2002-08-23T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1312, 312, 465, CAST(N'2003-03-07T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1307, 305, 514, CAST(N'2003-01-20T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1312, 474, 142, CAST(N'2003-04-15T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1369, 57, 256, CAST(N'2002-09-27T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1172, 658, 379, CAST(N'2003-09-18T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1400, 241, 142, CAST(N'2002-09-24T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1414, 356, 289, CAST(N'2003-04-10T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1426, 349, 379, CAST(N'2002-12-06T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1464, 146, 326, CAST(N'2002-01-07T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1490, 474, 501, CAST(N'2002-11-25T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1513, 429, 244, CAST(N'2003-03-04T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1127, 430, 277, CAST(N'2002-10-15T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1249, 349, 379, CAST(N'2002-12-31T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1272, 362, 411, CAST(N'2002-06-07T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1306, 594, 456, CAST(N'2003-04-22T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1324, 441, 469, CAST(N'2003-01-22T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1393, 357, 514, CAST(N'2002-11-18T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1471, 367, 195, CAST(N'2003-02-21T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1127, 430, 277, CAST(N'2002-09-11T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1152, 356, 289, CAST(N'2002-12-04T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1370, 474, 501, CAST(N'2003-08-15T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1439, 264, 142, CAST(N'2002-11-04T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1165, 583, 289, CAST(N'2002-12-17T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1406, 343, 244, CAST(N'2003-02-18T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1421, 238, 277, CAST(N'2002-03-15T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1357, 194, 330, CAST(N'2003-06-06T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1421, 98, 411, CAST(N'2003-04-28T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1267, 194, 330, CAST(N'2003-01-24T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1376, 241, 501, CAST(N'2002-08-14T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1498, 238, 277, CAST(N'2003-05-19T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1180, 194, 330, CAST(N'2003-08-26T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1370, 362, 456, CAST(N'2002-11-20T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1450, 241, 501, CAST(N'2003-03-04T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1259, 37, 166, CAST(N'2003-05-19T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1441, 99, 122, CAST(N'2002-09-17T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1222, 259, 244, CAST(N'2002-10-30T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1132, 98, 456, CAST(N'2002-12-13T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1312, 262, 514, CAST(N'2002-11-22T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1434, 37, 166, CAST(N'2003-02-28T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1132, 370, 232, CAST(N'2003-02-11T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1393, 489, 371, CAST(N'2002-12-30T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1312, 262, 514, CAST(N'2003-01-23T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1393, 99, 122, CAST(N'2003-09-22T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1351, 650, 334, CAST(N'2002-09-20T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1173, 98, 456, CAST(N'2003-01-24T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1312, 264, 501, CAST(N'2003-01-03T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1331, 259, 244, CAST(N'2003-05-28T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1441, 265, 277, CAST(N'2003-01-07T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1386, 209, 391, CAST(N'2003-04-28T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1331, 264, 501, CAST(N'2002-08-15T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1172, 303, 289, CAST(N'2002-09-10T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1441, 262, 514, CAST(N'2002-12-17T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1196, 525, 334, CAST(N'2003-09-16T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1363, 607, 191, CAST(N'2002-12-27T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1471, 349, 379, CAST(N'2003-01-13T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1439, 264, 142, CAST(N'2002-11-12T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1406, 343, 244, CAST(N'2002-11-26T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1357, 194, 330, CAST(N'2003-03-28T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1312, 98, 411, CAST(N'2003-05-05T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1450, 241, 501, CAST(N'2003-03-20T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1441, 99, 122, CAST(N'2002-11-21T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1434, 37, 166, CAST(N'2003-03-03T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1483, 37, 166, CAST(N'2003-06-23T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1331, 259, 244, CAST(N'2003-01-09T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1133, 104, 256, CAST(N'2003-03-12T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1173, 576, 436, CAST(N'2003-01-27T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1307, 305, 514, CAST(N'2002-10-30T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1363, 607, 191, CAST(N'2003-04-10T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1414, 356, 289, CAST(N'2003-05-23T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1471, 349, 379, CAST(N'2002-09-19T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1324, 441, 469, CAST(N'2002-12-24T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1312, 98, 411, CAST(N'2002-09-17T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1450, 241, 501, CAST(N'2003-01-20T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1441, 99, 122, CAST(N'2003-08-20T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1434, 37, 166, CAST(N'2002-09-06T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1483, 37, 166, CAST(N'2003-04-18T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1172, 303, 289, CAST(N'2003-03-28T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1197, 106, 375, CAST(N'2003-06-03T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1312, 312, 465, CAST(N'2003-03-10T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1513, 429, 244, CAST(N'2003-05-09T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1180, 194, 330, CAST(N'2003-09-16T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1450, 241, 501, CAST(N'2003-04-10T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1312, 262, 514, CAST(N'2003-11-24T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1441, 262, 514, CAST(N'2003-03-18T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1197, 106, 375, CAST(N'2003-02-10T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1400, 241, 142, CAST(N'2003-06-27T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1513, 429, 244, CAST(N'2003-08-25T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1180, 194, 330, CAST(N'2003-09-12T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1421, 98, 411, CAST(N'2002-10-31T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1450, 241, 501, CAST(N'2003-03-25T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1312, 262, 514, CAST(N'2003-09-08T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1312, 264, 501, CAST(N'2003-09-22T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1441, 262, 514, CAST(N'2002-12-13T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1312, 312, 465, CAST(N'2003-02-26T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1400, 241, 142, CAST(N'2003-05-23T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1180, 194, 330, CAST(N'2003-01-21T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1421, 98, 411, CAST(N'2003-02-28T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1312, 264, 501, CAST(N'2003-03-19T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1159, 169, 460, CAST(N'2002-12-02T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1172, 658, 379, CAST(N'2002-06-11T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1165, 583, 289, CAST(N'2003-01-21T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1259, 37, 166, CAST(N'2002-12-12T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1172, 650, 334, CAST(N'2003-01-07T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1159, 169, 460, CAST(N'2003-03-18T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1172, 658, 379, CAST(N'2003-04-16T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1165, 583, 289, CAST(N'2003-10-28T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1259, 37, 166, CAST(N'2003-02-05T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1172, 650, 334, CAST(N'2002-11-29T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1159, 169, 460, CAST(N'2003-04-17T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1172, 650, 334, CAST(N'2003-02-28T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1172, 658, 379, CAST(N'2003-04-30T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1165, 583, 289, CAST(N'2003-09-12T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1259, 37, 166, CAST(N'2003-05-30T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ispit] ([mbrStud], [sifPred], [sifNastavnik], [datIspit], [ocjena]) VALUES (1172, 650, 334, CAST(N'2003-08-22T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (10000, N'Zagreb                                  ', 21)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (10010, N'Zagreb-Slobo�tina                       ', 21)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (10020, N'Zagreb-Novi Zagreb                      ', 21)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (10040, N'Zagreb-Dubrava                          ', 21)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (10090, N'Zagreb-Susedgrad                        ', 21)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (10250, N'Lu�ko                                   ', 1)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (10255, N'Gornji Stupnik                          ', 1)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (10290, N'Zapre�i�                                ', 1)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (10295, N'Kupljenovo                              ', 1)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (10310, N'Ivani�-Grad                             ', 1)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (10315, N'Novoselec                               ', 1)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (10340, N'Vrbovec                                 ', 1)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (10345, N'Gradec                                  ', 1)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (10360, N'Sesvete                                 ', 1)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (10370, N'Dugo Selo                               ', 1)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (10380, N'Sveti Ivan Zelina                       ', 21)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (10410, N'Velika Gorica                           ', 1)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (10415, N'Novo �i�e                               ', 1)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (10430, N'Samobor                                 ', 1)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (10435, N'Sveti Martin pod Oki�em                 ', 1)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (10450, N'Jastrebarsko                            ', 1)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (10455, N'Kostanjevac                             ', 1)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (20000, N'Dubrovnik                               ', 19)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (20205, N'Topolo                                  ', 19)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (20210, N'Cavtat                                  ', 19)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (20215, N'Gruda                                   ', 19)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (20225, N'Babino Polje                            ', 19)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (20230, N'Ston                                    ', 19)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (20235, N'Zaton Veliki                            ', 19)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (20240, N'Trpanj                                  ', 19)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (20242, N'Oskoru�no                               ', 19)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (20245, N'Trstenik                                ', 19)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (20250, N'Orebi�                                  ', 19)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (20260, N'Kor�ula                                 ', 19)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (20270, N'Vela Luka                               ', 19)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (20275, N'�rnovo                                  ', 19)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (20290, N'Lastovo                                 ', 19)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (20340, N'Plo�e                                   ', 19)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (20345, N'Sta�evica                               ', 19)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (20350, N'Metkovi�                                ', 19)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (20355, N'Opuzen                                  ', 19)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (21000, N'Split                                   ', 17)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (21205, N'Donji Dolac                             ', 17)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (21210, N'Solin                                   ', 17)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (21215, N'Ka�tel Luk�i�                           ', 17)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (21220, N'Trogir                                  ', 17)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (21225, N'Drvenik Veliki                          ', 17)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (21230, N'Sinj                                    ', 17)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (21232, N'Dicmo                                   ', 17)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (21235, N'Oti�i�                                  ', 17)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (21240, N'Trilj                                   ', 17)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (21245, N'Tijarica                                ', 17)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (21250, N'�estanovac                              ', 17)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (21255, N'Zadvarje                                ', 17)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (21260, N'Imotski                                 ', 17)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (21265, N'Studenci                                ', 17)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (21270, N'Zagvozd                                 ', 17)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (21275, N'Dragljane                               ', 17)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (21300, N'Makarska                                ', 17)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (21310, N'Omi�                                    ', 17)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (21315, N'Dugi Rat                                ', 17)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (21320, N'Ba�ka Voda                              ', 17)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (21325, N'Tu�epi                                  ', 17)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (21330, N'Gradac                                  ', 17)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (21335, N'Podaca                                  ', 17)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (21400, N'Supetar                                 ', 17)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (21405, N'Milna                                   ', 17)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (21410, N'Postira                                 ', 17)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (21420, N'Bol                                     ', 17)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (21425, N'Selca                                   ', 17)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (21430, N'Grohote                                 ', 17)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (21450, N'Hvar                                    ', 17)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (21460, N'Stari Grad                              ', 17)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (21465, N'Jelsa                                   ', 17)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (21480, N'Vis                                     ', 17)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (21485, N'Komi�a                                  ', 17)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (22000, N'�ibenik                                 ', 15)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (22010, N'�ibenik-Brodarica                       ', 15)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (22020, N'�ibenik-Ra�ine                          ', 15)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (22030, N'�ibenik-Zabla�e                         ', 15)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (22205, N'Perkovi�                                ', 15)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (22215, N'Zaton                                   ', 15)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (22235, N'Kaprije                                 ', 15)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (22240, N'Tisno                                   ', 15)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (22300, N'Knin                                    ', 15)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (22305, N'Kistanje                                ', 15)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (22310, N'Kijevo                                  ', 15)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (22320, N'Drni�                                   ', 15)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (23000, N'Zadar                                   ', 13)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (23205, N'Bibinje                                 ', 13)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (23210, N'Biograd na moru                         ', 13)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (23235, N'Vrsi                                    ', 13)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (23245, N'Tribanj                                 ', 13)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (23250, N'Pag                                     ', 13)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (23275, N'Ugljan                                  ', 13)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (23285, N'Brbinj                                  ', 13)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (23295, N'Silba                                   ', 13)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (23420, N'Benkovac                                ', 13)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (23440, N'Gra�ac                                  ', 13)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (23445, N'Srb                                     ', 13)
GO
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (23450, N'Obrovac                                 ', 13)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (31000, N'Osijek                                  ', 14)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (31205, N'Aljma�                                  ', 14)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (31215, N'Ernestinovo                             ', 14)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (31220, N'Vi�njevac                               ', 14)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (31225, N'Breznica Na�i�ka                        ', 14)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (31300, N'Beli Manastir                           ', 14)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (31301, N'Branjin Vrh                             ', 14)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (31305, N'Dra�                                    ', 14)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (31315, N'Karanac                                 ', 14)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (31325, N'�eminac                                 ', 14)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (31400, N'�akovo                                  ', 14)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (31410, N'Strizivojna                             ', 14)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (31415, N'Selci �akova�ki                         ', 14)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (31500, N'Na�ice                                  ', 14)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (31530, N'Podravska Moslavina                     ', 14)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (31531, N'Viljevo                                 ', 14)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (31540, N'Donji Miholjac                          ', 14)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (31550, N'Valpovo                                 ', 14)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (31555, N'Marijanci                               ', 14)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (32000, N'Vukovar                                 ', 16)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (32100, N'Vinkovci                                ', 16)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (32225, N'Bobota                                  ', 16)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (32235, N'Bapska                                  ', 16)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (32240, N'Mirkovci                                ', 16)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (32245, N'Nijemci                                 ', 16)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (32255, N'Soljani                                 ', 16)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (32260, N'Gunja                                   ', 16)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (32270, N'�upanja                                 ', 16)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (32275, N'Bo�njaci                                ', 16)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (32280, N'Jarmina                                 ', 16)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (33000, N'Virovitica                              ', 10)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (33405, N'Pitoma�a                                ', 10)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (33410, N'Suhopolje                               ', 10)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (33515, N'Orahovica                               ', 10)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (33520, N'Slatina                                 ', 10)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (33525, N'Sopje                                   ', 10)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (34000, N'Po�ega                                  ', 11)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (34310, N'Pleternica                              ', 11)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (34315, N'Ratkovica                               ', 11)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (34320, N'Orljavac                                ', 11)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (34330, N'Velika                                  ', 11)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (34335, N'Vetovo                                  ', 11)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (34340, N'Kutjevo                                 ', 11)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (34350, N'�aglin                                  ', 11)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (34550, N'Pakrac                                  ', 11)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (35000, N'Slavonski Brod                          ', 12)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (35210, N'Vrpolje                                 ', 12)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (35215, N'Svilaj                                  ', 12)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (35220, N'Slavonski �amac                         ', 12)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (35250, N'Oriovac                                 ', 12)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (35255, N'Slavonski Koba�                         ', 12)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (35400, N'Nova Gradi�ka                           ', 12)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (35420, N'Staro Petrovo Selo                      ', 12)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (35425, N'Davor                                   ', 12)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (35430, N'Oku�ani                                 ', 12)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (35435, N'Stara Gradi�ka                          ', 12)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (40000, N'�akovec                                 ', 20)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (40305, N'Nedeli��e                               ', 20)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (40315, N'Mursko Sredi��e                         ', 20)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (40320, N'Donji Kraljevec                         ', 20)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (40325, N'Dra�kovec                               ', 20)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (42000, N'Vara�din                                ', 5)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (42205, N'Vidovec                                 ', 5)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (42220, N'Novi Marof                              ', 5)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (42225, N'Brezni�ki Hum                           ', 5)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (42230, N'Ludbreg                                 ', 5)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (42240, N'Ivanec                                  ', 5)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (42245, N'Donja Vo�a                              ', 5)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (42250, N'Lepoglava                               ', 5)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (42255, N'Donja Vi�njica                          ', 5)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (43000, N'Bjelovar                                ', 7)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (43240, N'�azma                                   ', 7)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (43245, N'Gornji Draganec                         ', 7)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (43270, N'Veliki Gr�evac                          ', 7)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (43271, N'Velika Pisanica                         ', 7)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (43280, N'Gare�nica                               ', 7)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (43285, N'Velika Trnovitica                       ', 7)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (43290, N'Grubi�no Polje                          ', 7)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (43500, N'Daruvar                                 ', 7)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (43505, N'Kon�anica                               ', 7)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (43531, N'Veliki Bastaji                          ', 7)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (44000, N'Sisak                                   ', 3)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (44010, N'Sisak-Caprag                            ', 3)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (44205, N'Donja Ba�uga                            ', 3)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (44210, N'Sunja                                   ', 3)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (44250, N'Petrinja                                ', 3)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (44271, N'Letovani�                               ', 3)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (44320, N'Kutina                                  ', 3)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (44325, N'Krapje                                  ', 3)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (44330, N'Novska                                  ', 3)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (44400, N'Glina                                   ', 3)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (44405, N'Mali Gradac                             ', 3)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (44410, N'Gvozd                                   ', 3)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (44415, N'Topusko                                 ', 3)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (44425, N'Gornja Bu�ica                           ', 3)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (44430, N'Hrvatska Kostajnica                     ', 3)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (44435, N'Divu�a                                  ', 3)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (44440, N'Dvor                                    ', 3)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (44450, N'Hrvatska Dubica                         ', 3)
GO
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (47000, N'Karlovac                                ', 4)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (47201, N'Dragani�i                               ', 4)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (47205, N'Vukmani�                                ', 4)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (47220, N'Vojni�                                  ', 4)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (47240, N'Slunj                                   ', 4)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (47245, N'Rakovica                                ', 4)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (47250, N'Duga Resa                               ', 4)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (47251, N'Bosiljevo                               ', 4)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (47280, N'Ozalj                                   ', 4)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (47285, N'Radatovi�i                              ', 4)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (47300, N'Ogulin                                  ', 4)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (47302, N'O�tarije                                ', 4)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (47305, N'Li�ka Jesenica                          ', 4)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (48000, N'Koprivnica                              ', 6)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (48260, N'Kri�evci                                ', 6)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (48265, N'Raven                                   ', 6)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (48305, N'Reka                                    ', 6)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (48325, N'Novigrad Podravski                      ', 6)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (48350, N'�ur�evac                                ', 6)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (48355, N'Novo Virje                              ', 6)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (49000, N'Krapina                                 ', 2)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (49210, N'Zabok                                   ', 2)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (49215, N'Tuhelj                                  ', 2)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (49225, N'�urmanec                                ', 2)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (49240, N'Donja Stubica                           ', 2)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (49245, N'Gornja Stubica                          ', 2)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (49250, N'Zlatar                                  ', 2)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (49255, N'Novi Golubovec                          ', 2)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (49290, N'Klanjec                                 ', 2)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (49295, N'Kumrovec                                ', 2)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (51000, N'Rijeka                                  ', 8)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (51211, N'Matulji                                 ', 8)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (51215, N'Kastav                                  ', 8)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (51225, N'Praputnjak                              ', 8)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (51250, N'Novi Vinodolski                         ', 8)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (51251, N'Ledenice                                ', 8)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (51260, N'Crikvenica                              ', 8)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (51265, N'Dramalj                                 ', 8)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (51280, N'Rab                                     ', 8)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (51300, N'Delnice                                 ', 8)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (51305, N'Tr��e                                   ', 8)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (51315, N'Mrkopalj                                ', 8)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (51325, N'Moravice                                ', 8)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (51410, N'Opatija                                 ', 8)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (51415, N'Lovran                                  ', 8)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (51500, N'Krk                                     ', 8)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (51515, N'�ilo                                    ', 8)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (51550, N'Mali Lo�inj                             ', 8)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (51555, N'Belej                                   ', 8)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (52000, N'Pazin                                   ', 18)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (52100, N'Pula                                    ', 18)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (52210, N'Rovinj (Rovigno)                        ', 18)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (52215, N'Vodnjan (Dignano)                       ', 18)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (52220, N'Labin                                   ', 18)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (52420, N'Buzet                                   ', 18)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (52425, N'Ro�                                     ', 18)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (52440, N'Pore�                                   ', 18)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (52445, N'Baderna                                 ', 18)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (52450, N'Vrsar                                   ', 18)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (52460, N'Buje (Buie)                             ', 18)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (52465, N'Tar                                     ', 18)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (52470, N'Umag (Umago)                            ', 18)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (52475, N'Savudrija (Salvore)                     ', 18)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (53000, N'Gospi�                                  ', 9)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (53205, N'Medak                                   ', 9)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (53220, N'Oto�ac                                  ', 9)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (53225, N'�vica                                   ', 9)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (53230, N'Korenica                                ', 9)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (53235, N'Buni�                                   ', 9)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (53250, N'Donji Lapac                             ', 9)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (53260, N'Brinje                                  ', 9)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (53270, N'Senj                                    ', 9)
INSERT [dbo].[mjesto] ([pbr], [nazMjesto], [sifZupanija]) VALUES (53285, N'Lukovo                                  ', 9)
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (122, N'Tin                      ', N'Grabovac                 ', 49000, 100005, CAST(5.90 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (126, N'Zdravko                  ', N'Budi�in                  ', 53000, 100006, CAST(6.30 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (130, N'Antun Ivan               ', N'Jonji�                   ', 10000, 100007, CAST(6.70 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (134, N'�elimir                  ', N'Somrak                   ', 33000, 100025, CAST(7.10 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (138, N'David                    ', N'Petkovi�                 ', 35000, 100009, CAST(7.50 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (142, N'Alan                     ', N'Ostoj�i�                 ', 10000, 100010, CAST(7.90 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (146, N'Franjo                   ', N'Vidakovi�                ', 20000, 100011, CAST(8.30 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (150, N'Ana                      ', N'Kukec                    ', 20000, 100001, CAST(8.70 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (154, N'�arko                    ', N'Dubinko                  ', 10000, 100002, CAST(9.10 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (158, N'Davorka                  ', N'Volari�                  ', 10000, 100003, CAST(9.50 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (162, N'�elimir                  ', N'Prester                  ', 34550, 100004, CAST(9.90 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (166, N'Nino                     ', N'Lipec                    ', 10000, 100005, CAST(3.30 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (171, N'Dinko                    ', N'�ubrini�                 ', 10000, 100006, CAST(4.50 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (175, N'�eljko                   ', N'Kova�evi�                ', 10000, 100007, CAST(4.90 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (179, N'Adrijan                  ', N'Dugonji�                 ', 21000, 100008, CAST(5.30 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (183, N'Dino                     ', N'Parlov                   ', 21000, 100025, CAST(5.70 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (187, N'Gordana                  ', N'Ho�evar                  ', 10000, 100025, CAST(3.10 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (191, N'Davorka                  ', N'Vidovi�                  ', 31000, 100011, CAST(3.50 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (195, N'Lovre                    ', N'�eri                     ', 20000, 100001, CAST(3.90 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (199, N'Marko                    ', N'Pepelnjak                ', 10000, 100026, CAST(4.30 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (203, N'Ivana                    ', N'Sokol                    ', 10000, 100003, CAST(4.70 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (207, N'Mijo                     ', N'Marovi�                  ', 51000, 100004, CAST(5.10 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (211, N'Julija                   ', N'Studen                   ', 10000, 100026, CAST(5.50 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (215, N'Petar                    ', N'Kruljac                  ', 33000, 100006, CAST(5.90 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (220, N'Katarina                 ', N'Glava�                   ', 10000, 100007, CAST(7.10 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (224, N'Lovro                    ', N'Martinovi�               ', 10000, 100008, CAST(7.50 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (228, N'Renata                   ', N'Santo                    ', 22000, 100009, CAST(7.90 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (232, N'Dubravko                 ', N'Josipovi�                ', 10000, 100010, CAST(8.30 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (236, N'Robert                   ', N'Pavlovi�                 ', 20000, 100011, CAST(8.70 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (240, N'�elimir                  ', N'Bere�ek                  ', 21000, 100025, CAST(9.10 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (244, N'Zlatko                   ', N'Toma�ek                  ', 10000, 100002, CAST(9.50 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (248, N'Sandra                   ', N'Stanojevi�               ', 31410, 100003, CAST(9.90 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (252, N'Edita                    ', N'Pavi�                    ', 21265, 100025, CAST(3.30 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (256, N'Sanja                    ', N'Watz                     ', 10000, 100005, CAST(3.70 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (260, N'Bo�idar                  ', N'Do�en                    ', 21275, 100006, CAST(4.10 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (264, N'Marko                    ', N'Kova�evi�                ', 10000, 100007, CAST(4.50 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (269, N'Marija                   ', N'Novokmet                 ', 32000, 100008, CAST(5.70 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (273, N'Davor                    ', N'Re�an                    ', 10000, 100009, CAST(3.10 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (277, N'Silvije                  ', N'Szekeres                 ', 21000, 100010, CAST(3.50 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (281, N'Dubravko                 ', N'Kirin�i�                 ', 10000, 100011, CAST(3.90 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (285, N'Iva                      ', N'Fran�i�kovi�             ', 10000, 100001, CAST(4.30 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (289, N'Marina                   ', N'Carek                    ', 10000, 100002, CAST(4.70 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (293, N'Mirna                    ', N'Raki�                    ', 21000, 100025, CAST(5.10 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (297, N'Alen                     ', N'Pisac                    ', 10000, 100004, CAST(5.50 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (301, N'Stanislav                ', N'Krznari�                 ', 10000, 100005, CAST(5.90 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (305, N'Nikolina                 ', N'Horvat                   ', 31000, 100006, CAST(6.30 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (309, N'Lovre                    ', N'Ro�i�                    ', 35000, 100007, CAST(6.70 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (313, N'Marko                    ', N'Trajbar                  ', 43000, 100008, CAST(7.10 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (318, N'Nino                     ', N'Gvozdi�                  ', 10000, 100009, CAST(8.30 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (322, N'Ana                      ', N'Jureti�                  ', 32000, 100025, CAST(8.70 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (326, N'Sun�ica                  ', N'Ple�ko                   ', 34000, 100011, CAST(9.10 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (330, N'Vinko                    ', N'Kecman                   ', 10000, 100001, CAST(9.50 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (334, N'Sandra                   ', N'Mihaljevi�               ', 10000, 100002, CAST(9.90 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (338, N'Petar                    ', N'Petrovi�                 ', 20000, 100026, CAST(3.30 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (342, N'Tin                      ', N'Mandi�                   ', 10000, 100004, CAST(3.70 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (346, N'An�elko                  ', N'Puzak                    ', 48260, 100025, CAST(4.10 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (350, N'Vjeran                   ', N'Kova�i�                  ', 10000, 100006, CAST(4.50 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (354, N'Tamara                   ', N'Kri�ani�                 ', 10000, 100007, CAST(4.90 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (358, N'Aljo�a                   ', N'Marijani�                ', 31000, 100008, CAST(5.30 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (362, N'Tanja                    ', N'Crni�                    ', 34000, 100009, CAST(5.70 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (367, N'Tanja                    ', N'Petrovi�                 ', 10000, 100010, CAST(3.90 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (371, N'Bo�idar                  ', N'Mu�ar                    ', 10000, 100011, CAST(4.30 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (375, N'Tina                     ', N'�valjek                  ', 10000, 100001, CAST(4.70 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (379, N'Mia                      ', N'Stoji�                   ', 21000, 100002, CAST(5.10 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (383, N'Mihael                   ', N'Schildenfeld             ', 10000, 100003, CAST(5.50 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (387, N'Tina                     ', N'Maduni�                  ', 21000, 100025, CAST(5.90 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (391, N'Marko                    ', N'Hazdovac                 ', 10000, 100005, CAST(6.30 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (395, N'Nino                     ', N'Zajc                     ', 51000, 100006, CAST(6.70 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (399, N'Tino                     ', N'Zerec                    ', 31000, 100007, CAST(7.10 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (403, N'Aurelija                 ', N'Juri�                    ', 34000, 100008, CAST(7.50 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (407, N'Gregor                   ', N'Krmpoti�                 ', 32100, 100009, CAST(7.90 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (411, N'Kristian                 ', N'Damjan�i�                ', 48000, 100010, CAST(8.30 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (416, N'�eljka                   ', N'Bello                    ', 10000, 100026, CAST(9.50 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (420, N'Bernard                  ', N'Jurjevi�                 ', 33000, 100001, CAST(9.90 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (424, N'Bla�                     ', N'Bartolovi�               ', 10000, 100026, CAST(3.30 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (428, N'Mirna                    ', N'Ban                      ', 10000, 100003, CAST(3.70 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (432, N'Bojan                    ', N'Bra�i�                   ', 10000, 100004, CAST(4.10 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (436, N'Karla                    ', N'Glasnovi�                ', 31500, 100005, CAST(4.50 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (440, N'Miroslav                 ', N'Pongrac                  ', 51550, 100025, CAST(4.90 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (444, N'Ilija                    ', N'Marasovi�                ', 10000, 100007, CAST(5.30 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (448, N'Mladen                   ', N'Butkovi�                 ', 10000, 100008, CAST(5.70 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (452, N'Viktor                   ', N'Kuzmi�                   ', 31000, 100009, CAST(3.10 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (456, N'Slavica                  ', N'Haban                    ', 10000, 100010, CAST(3.50 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (460, N'Ivana                    ', N'Ko�anski                 ', 10000, 100011, CAST(3.90 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (465, N'Vinko                    ', N'Belo�evi�                ', 10000, 100001, CAST(5.10 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (469, N'Ivana                    ', N'Duman�i�                 ', 10000, 100002, CAST(5.50 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (473, N'Ive                      ', N'Pisarovi�                ', 10000, 100003, CAST(5.90 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (477, N'Gordan                   ', N'�tampar                  ', 21000, 100004, CAST(6.30 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (481, N'Iva                      ', N'Habu�                    ', 10000, 100005, CAST(6.70 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (485, N'Ivo                      ', N'Lovri�                   ', 10000, 100025, CAST(7.10 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (489, N'Vladimir                 ', N'Vinkovi�                 ', 10000, 100007, CAST(7.50 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (493, N'Vlado                    ', N'Burela                   ', 31000, 100025, CAST(7.90 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (497, N'Hrvoje                   ', N'Mandi�                   ', 42000, 100009, CAST(8.30 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (501, N'Davorin                  ', N'Rodinis                  ', 48000, 100010, CAST(8.70 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (505, N'Jerko                    ', N'Zovko                    ', 52000, 100011, CAST(9.10 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (509, N'Petar                    ', N'Posav�evi�               ', 10000, 100001, CAST(9.50 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (514, N'Damjan                   ', N'Dolar                    ', 10000, 100002, CAST(3.70 AS Decimal(3, 2)))
INSERT [dbo].[nastavnik] ([sifNastavnik], [imeNastavnik], [prezNastavnik], [pbrStan], [sifOrgjed], [koef]) VALUES (518, N'Josipa                   ', N'Prokopi�                 ', 21000, 100026, CAST(4.10 AS Decimal(3, 2)))
SET IDENTITY_INSERT [dbo].[nova_tablica] ON 

INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1120, N'Zdenko                   ', N'Kolac                    ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1121, N'Danijel                  ', N'Marovi�                  ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1123, N'Jozefina                 ', N'Anton�i�                 ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1124, N'Tihomir                  ', N'Crnkovi�                 ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1125, N'Vjeran                   ', N'Brezac                   ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1127, N'Dario                    ', N'Risek                    ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1128, N'Zlatko                   ', N'Broz                     ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1129, N'Julija                   ', N'Kos                      ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1131, N'Zlatko                   ', N'Nenadi�                  ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1132, N'Nikica                   ', N'Arunovi�                 ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1133, N'Darko                    ', N'Cindri�                  ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1135, N'Juraj                    ', N'Ro�man                   ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1136, N'Vlatko                   ', N'Horvati�                 ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1137, N'Jure                     ', N'Ribari�                  ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1139, N'Niko                     ', N'Maru�i�                  ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1140, N'Davor                    ', N'Vurnek                   ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1141, N'Zoran                    ', N'Habajec                  ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1143, N'Davor                    ', N'Voras                    ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1144, N'Zvonimir                 ', N'Ozimec                   ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1145, N'Jurica                   ', N'Ba�i�                    ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1147, N'Alenka                   ', N'Vukojevi�                ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1148, N'Antonijo                 ', N'Javorina                 ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1149, N'Nikola                   ', N'Ba�i�                    ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1151, N'Karlo                    ', N'Krsnik                   ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1152, N'Bo�idar                  ', N'Tomi�                    ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1153, N'Josip                    ', N'Duki�                    ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1155, N'Davorin                  ', N'Mirkovi�                 ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1156, N'Nikolina                 ', N'Medvedec                 ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1157, N'Nina                     ', N'Cnappi                   ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1159, N'Katarina                 ', N'Dobrina                  ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1160, N'Majo                     ', N'Musi�                    ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1161, N'Davor                    ', N'Jurinjak                 ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1163, N'Davorka                  ', N'Smoli�-Grgi�             ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1164, N'Kre�imir                 ', N'Vlahovi�                 ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1165, N'�eljka                   ', N'Mori�                    ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1167, N'Mirko                    ', N'Tekli�                   ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1168, N'Doris                    ', N'Rapinac                  ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1169, N'Dubravko                 ', N'Vani�ek                  ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1170, N'Denis                    ', N'Pauk                     ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1172, N'Ninoslav                 ', N'Novak                    ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1173, N'Gordan                   ', N'Bor�i�                   ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1174, N'Edita                    ', N'Domijan                  ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1176, N'Predrag                  ', N'�uljevi�                 ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1177, N'Kristian                 ', N'Klarin                   ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1178, N'Kristijan                ', N'Vrabec                   ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1180, N'Iva                      ', N'Mio�                     ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1181, N'Arsenio                  ', N'Mini�                    ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1182, N'Gorana                   ', N'Bo�i�                    ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1184, N'Tihomir                  ', N'Fabris                   ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1185, N'Ozren                    ', N'Smoli�                   ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1186, N'Zlatko                   ', N'Kolar                    ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1188, N'Kristina                 ', N'Mandi�                   ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1189, N'Juraj                    ', N'Ma�ek                    ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1190, N'Domagoj                  ', N'Kri�to                   ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1192, N'Helena                   ', N'Mandi�                   ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1193, N'Krunoslav                ', N'Brezak                   ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1194, N'Antun Ivan               ', N'Herak                    ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1196, N'Pavao                    ', N'Falk                     ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1197, N'Dominik                  ', N'Hacek                    ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1198, N'Helena                   ', N'Vidakovi�                ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1200, N'Davor                    ', N'Bun�ec                   ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1201, N'Doris                    ', N'Kon�ar                   ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1202, N'Perica                   ', N'Mikulec                  ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1204, N'Ksenija                  ', N'�ular                    ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1205, N'Dragan                   ', N'Vrane�i�                 ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1206, N'Jozefina                 ', N'Blauhorn                 ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1208, N'Franjo                   ', N'Stipanov                 ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1209, N'Petar                    ', N'�krinjari�               ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1210, N'Lea                      ', N'Dostal                   ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1212, N'Josip                    ', N'Zeli�                    ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1213, N'Petra                    ', N'�uljak                   ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1214, N'Drago                    ', N'Bartolin�i�              ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1216, N'Lidija                   ', N'Leonard                  ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1217, N'Lovre                    ', N'Huk                      ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1218, N'Majo                     ', N'Hemetek                  ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1219, N'Predrag                  ', N'Smir�i�                  ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1221, N'Slavko                   ', N'Prelec                   ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1222, N'Dragutin                 ', N'Ladi�i�                  ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1223, N'Kristina                 ', N'Rubini�                  ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1225, N'Mirko                    ', N'Dubravi�                 ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1226, N'Tin                      ', N'Mikulaj                  ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1227, N'Dra�en                   ', N'Bo�njak                  ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1229, N'Vjeran                   ', N'Brezovec                 ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1230, N'Predrag                  ', N'Buljat                   ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1231, N'Lucija                   ', N'Matija�evi�              ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1233, N'Renato                   ', N'Stepinac                 ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1234, N'Ksenija                  ', N'Pavi�i�                  ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1235, N'Lea                      ', N'Kamene�ki                ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1237, N'Luka                     ', N'Frankola                 ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1238, N'Tihomir                  ', N'Crnkovi�                 ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1239, N'Duje                     ', N'�imi�                    ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1241, N'Ljiljana                 ', N'Valenti�                 ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1242, N'Alan                     ', N'Samodol                  ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1243, N'Lidija                   ', N'�iljak                   ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1245, N'Dujo Davor               ', N'Folnegovi�               ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1246, N'Roko                     ', N'Novosel                  ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1247, N'Alan                     ', N'Pasanec                  ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1249, N'Maja                     ', N'Beli�                    ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1250, N'Antonijo                 ', N'Franjkovi�               ')
GO
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1251, N'Lucija                   ', N'Br�i�                    ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1253, N'Bo�idar                  ', N'Cetto                    ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1254, N'Edo                      ', N'Mari�                    ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1255, N'Antonijo                 ', N'Duman�i�                 ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1257, N'Adrian                   ', N'Luka�                    ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1258, N'Majo                     ', N'Varga                    ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1259, N'Ljiljana                 ', N'Buli�                    ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1261, N'Silvana                  ', N'Novosel                  ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1262, N'Maja                     ', N'�eremet                  ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1263, N'Davor                    ', N'Ple�ko                   ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1265, N'Marija                   ', N'Barbi�                   ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1266, N'Eduard                   ', N'Petrovi�                 ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1267, N'Adrijan                  ', N'Vukovi�                  ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1268, N'Adrijana                 ', N'Bur�i�                   ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1270, N'Nino                     ', N'Triska                   ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1271, N'Marijan                  ', N'Miro�evi�                ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1272, N'Emil                     ', N'Serti�                   ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1274, N'Silvestar                ', N'Sabljak                  ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1275, N'Dubravko                 ', N'Toth                     ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1276, N'Filip                    ', N'Juri�                    ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1278, N'Gordan                   ', N'Dular                    ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1279, N'Martina                  ', N'Krizmani�                ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1280, N'Marin                    ', N'Juri�                    ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1282, N'Alan                     ', N'Matuna                   ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1283, N'Vinko                    ', N'Padovan                  ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1284, N'Albert                   ', N'Huni�                    ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1286, N'Fran                     ', N'�ef                      ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1287, N'Adrijan                  ', N'Trnski                   ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1288, N'Mirjana                  ', N'Ivekovi�                 ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1290, N'Slavica                  ', N'Pavi�                    ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1291, N'Gordan                   ', N'Ka�ar                    ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1292, N'Juraj                    ', N'Sabljak                  ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1294, N'Iva                      ', N'Dev�i�                   ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1295, N'Frane                    ', N'Plaveti�                 ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1296, N'Slavko                   ', N'Petrekovi�               ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1298, N'Marinko                  ', N'Horvat                   ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1299, N'Davorka                  ', N'Ili�                     ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1300, N'Alenka                   ', N'Lozi�                    ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1302, N'Lovre                    ', N'Smiljanec                ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1303, N'Juraj                    ', N'Szirovicza               ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1304, N'Mario                    ', N'Babi�                    ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1306, N'Helena                   ', N'Octenjak                 ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1307, N'Franjo                   ', N'Zdilar                   ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1308, N'Stipe                    ', N'Pugelnik                 ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1310, N'Marko                    ', N'Matekovi�                ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1311, N'Goran                    ', N'Remenar                  ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1312, N'Nina                     ', N'Ku�an                    ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1314, N'Marko                    ', N'Suhina                   ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1315, N'Aljo�a                   ', N'Sobol                    ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1316, N'Gorana                   ', N'Frljak                   ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1317, N'Mijo                     ', N'Vuceli�                  ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1319, N'Petra                    ', N'�kolnik                  ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1320, N'Martin                   ', N'Kova�i�                  ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1321, N'Marko                    ', N'Meljanac                 ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1323, N'Ivan                     ', N'Jambrak                  ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1324, N'Petar                    ', N'Nemet                    ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1325, N'Martina                  ', N'Simon                    ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1327, N'Andrej                   ', N'Juri�                    ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1328, N'Renata                   ', N'Vujnovac                 ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1329, N'Mijo                     ', N'Poljak                   ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1331, N'Gordan                   ', N'Lackovi�                 ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1332, N'Svebor                   ', N'Ke��ec                   ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1333, N'Adrijan                  ', N'Fabri�ni                 ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1335, N'Andrija                  ', N'Topolovac                ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1336, N'Slavko                   ', N'Hrvojevi�                ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1337, N'Mate                     ', N'Crnjak                   ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1339, N'Andro                    ', N'Popovi�                  ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1340, N'Matej                    ', N'Duki�                    ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1341, N'Sanja                    ', N'Babi�                    ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1343, N'Davorka                  ', N'Kralj                    ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1344, N'Sven                     ', N'Rac                      ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1345, N'Helena                   ', N'Medved                   ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1347, N'Mateo                    ', N'Makovi�                  ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1348, N'Silvana                  ', N'Vrbani�                  ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1349, N'�ime                     ', N'Kova�i�                  ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1351, N'�elimir                  ', N'Babi�                    ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1352, N'Marko                    ', N'Leva�i�                  ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1353, N'Slavica                  ', N'�urak                    ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1355, N'Ante                     ', N'Budimir                  ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1356, N'Matija                   ', N'Bujas                    ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1357, N'Nino                     ', N'Bari�                    ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1359, N'Matija Tvrtko            ', N'Andri�ek                 ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1360, N'Sun�ica                  ', N'Bo�njak                  ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1361, N'Anto                     ', N'Globlek                  ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1363, N'Matko                    ', N'Grgi�                    ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1364, N'Antun                    ', N'Ferenc                   ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1365, N'Anton                    ', N'Be�i�                    ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1366, N'Vinko                    ', N'Kontak                   ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1368, N'Tea                      ', N'Me�imorec                ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1369, N'Mato                     ', N'Kobal                    ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1370, N'Tibor                    ', N'Poljanec                 ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1372, N'Adrijan                  ', N'Herceg                   ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1373, N'Antonijo                 ', N'Bili�                    ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1374, N'Tea                      ', N'Mihaljevi�               ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1376, N'Darko                    ', N'Mrdulja�                 ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1377, N'Davorka                  ', N'�avrak                   ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1378, N'Antonio                  ', N'Pamu�ar                  ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1380, N'Tihomir                  ', N'Medi�                    ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1381, N'Antun                    ', N'Balog                    ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1382, N'Vlatka                   ', N'Relota                   ')
GO
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1384, N'Helena                   ', N'Budimir                  ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1385, N'Tin                      ', N'Krajtner                 ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1386, N'Dragan                   ', N'Vidakovi�                ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1388, N'Antun Ivan               ', N'�imi�                    ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1389, N'Mihovil                  ', N'Slavi�ek                 ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1390, N'Zdenka                   ', N'Jureta                   ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1392, N'Filip                    ', N'Cigrovski                ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1393, N'Stjepan                  ', N'Tomi�                    ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1394, N'Augustina                ', N'�imek                    ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1396, N'Gordana                  ', N'Husak                    ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1397, N'Mijo                     ', N'Legovi�                  ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1398, N'Zdravka                  ', N'Budi�a                   ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1400, N'Miljenko                 ', N'Tu�en                    ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1401, N'Vinko                    ', N'Markovi�                 ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1402, N'Slavko                   ', N'Kav�i�                   ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1404, N'�eljka                   ', N'Puljek                   ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1405, N'Jerko                    ', N'Ogresta                  ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1406, N'Tomica                   ', N'Luli�                    ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1408, N'Mirjana                  ', N'Cesnik                   ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1409, N'Berislav                 ', N'Crnkovi�                 ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1410, N'�eljka                   ', N'Koren                    ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1412, N'Hana                     ', N'Birki�                   ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1413, N'Antun Ivan               ', N'Gali�                    ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1414, N'Tin                      ', N'�ipek                    ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1415, N'Tomislav                 ', N'Kova�i�                  ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1417, N'Toni                     ', N'Merlak                   ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1418, N'Davor                    ', N'Roketinec                ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1419, N'Mirko                    ', N'Bre�i�                   ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1421, N'Ljiljana                 ', N'Joki�                    ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1422, N'Helena                   ', N'Crnkovi�                 ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1423, N'Vjeran                   ', N'Naki�                    ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1425, N'Martina                  ', N'Petrinec                 ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1426, N'Vanja                    ', N'Bona�i�                  ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1427, N'Hrvoje                   ', N'Juri�i�                  ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1429, N'Karla                    ', N'Kafadar                  ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1430, N'�elimir                  ', N'Pintar                   ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1431, N'Franjo                   ', N'Bera�                    ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1433, N'Igor                     ', N'Bogati                   ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1434, N'Mijo                     ', N'Vrhoci                   ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1435, N'Alan                     ', N'Franc                    ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1437, N'Miro                     ', N'Pugar                    ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1438, N'Vedran                   ', N'Me�tri�                  ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1439, N'Josip                    ', N'�kvorc                   ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1441, N'Majo                     ', N'Meglaj                   ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1442, N'Boris                    ', N'Jertec                   ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1443, N'Nata�a                   ', N'Cerjan                   ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1445, N'Niko                     ', N'Grbi�                    ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1446, N'Antonijo                 ', N'Nikoli�                  ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1447, N'Vid                      ', N'Markulin�i�              ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1449, N'Nata�a                   ', N'Osrede�ki                ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1450, N'Borislav                 ', N'Gobin                    ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1451, N'Mirko                    ', N'Kadi�                    ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1453, N'Petra                    ', N'Ti�lar                   ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1454, N'Bo�idar                  ', N'Sesar                    ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1455, N'Iva                      ', N'Hafner                   ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1457, N'Borna                    ', N'Burtina                  ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1458, N'Davor                    ', N'Kroflin                  ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1459, N'Predrag                  ', N'Vlah                     ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1461, N'Nenad                    ', N'Toth                     ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1462, N'Vilim                    ', N'�iv�i�                   ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1463, N'Ivan                     ', N'Balenovi�                ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1464, N'Tihomir                  ', N'Fizir                    ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1466, N'Neven                    ', N'Rube�a                   ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1467, N'Tea                      ', N'Stjepanovi�              ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1468, N'Ivana                    ', N'Kuzma                    ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1470, N'Dubravko                 ', N'Bartoli�                 ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1471, N'Bo�idar                  ', N'Je�i�                    ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1472, N'Ivana                    ', N'Murani�                  ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1474, N'Vjekoslav                ', N'Lackovi�                 ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1475, N'Branimir                 ', N'Bolfek                   ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1476, N'Zlatko                   ', N'Per�i�                   ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1478, N'Vid                      ', N'Kuli�i�                  ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1479, N'Branko                   ', N'Car                      ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1480, N'Vjeran                   ', N'Stipani�ev               ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1482, N'Iva                      ', N'Klarin                   ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1483, N'Ivica                    ', N'�u�kovi�                 ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1484, N'Antun Ivan               ', N'Pu�ar                    ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1486, N'Iva                      ', N'Kopjar                   ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1487, N'Juraj                    ', N'Valjak                   ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1488, N'Davor                    ', N'Dilber                   ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1490, N'Bruno                    ', N'Hundak                   ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1491, N'Jakov                    ', N'Bumbar                   ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1492, N'Ivan                     ', N'Kordi�                   ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1494, N'Franjo                   ', N'Bla�evi�                 ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1495, N'Lovre                    ', N'�imek                    ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1496, N'Cvijeta                  ', N'Erceg                    ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1498, N'Janko                    ', N'Jakopovi�                ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1499, N'Vlaho                    ', N'Rogini�                  ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1500, N'Dalibor                  ', N'Grade�ak                 ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1502, N'Josip                    ', N'Nikl                     ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1503, N'Majo                     ', N'Posavec                  ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1504, N'Josip                    ', N'Poljak                   ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1506, N'Damir                    ', N'Bukovi�                  ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1507, N'Mijo                     ', N'Bitar                    ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1508, N'Vlasta                   ', N'Cikovi�                  ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1510, N'Vlatka                   ', N'�urkovi�                 ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1511, N'Mirko                    ', N'Rech                     ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1512, N'Josip                    ', N'Horvat                   ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1513, N'Josip                    ', N'Ivanovi�                 ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1515, N'Predrag                  ', N'Fugaj                    ')
GO
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1516, N'Vlatko                   ', N'Bedenikovi�              ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1517, N'Daniel                   ', N'Kamenar                  ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1519, N'Slavko                   ', N'Prsta�i�                 ')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1520, N'Pero', N'Peric')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1521, N'Marica', N'Maric')
INSERT [dbo].[nova_tablica] ([mbrStud], [imeStud], [prezStud]) VALUES (1523, N'test', N'testic')
SET IDENTITY_INSERT [dbo].[nova_tablica] OFF
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (6, N'Farmaceutsko-biokemijski fakultet                           ', 9996)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (7, N'Geodetski fakultet                                          ', 9996)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (9, N'Filozofski fakultet u Rijeci                                ', 9998)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (10, N'Ekonomski fakultet                                          ', 9997)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (11, N'Kemijsko-tehnolo�ki fakultet                                ', 9999)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (13, N'Edukacijsko-rehabilitacijski fakultet                       ', 9996)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (15, N'Fakultet politi�kih znanosti                                ', 9996)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (16, N'Fakultet organizacije i informatike u Vara�dinu             ', 9996)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (18, N'Pravni fakultet                                             ', 9999)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (23, N'Fakultet elektrotehnike, strojarstva i brodogradnje         ', 9999)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (33, N'Fakultet za turizam i vanjsku trgovinu                      ', 9999)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (34, N'Fakultet za fizi�ku kulturu                                 ', 9996)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (36, N'Fakultet elektrotehnike i ra�unarstva                       ', 9996)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (37, N'Prirodoslovno-matemati�ki fakultet Matemati�ki odjel        ', 9996)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (53, N'Veterinarski fakultet                                       ', 9996)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (54, N'Arhitektonski fakultet                                      ', 9996)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (55, N'Ekonomski fakultet                                          ', 9999)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (58, N'Prehrambeno-biotehnolo�ki fakultet                          ', 9996)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (62, N'Medicinski fakultet                                         ', 9998)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (63, N'Medicinski fakultet                                         ', 9999)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (65, N'Stomatolo�ki fakultet                                       ', 9996)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (66, N'Pravni fakultet                                             ', 9996)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (67, N'Ekonomski fakultet                                          ', 9996)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (68, N'�umarski fakultet                                           ', 9996)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (69, N'Tehni�ki fakultet                                           ', 9998)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (70, N'Filozofski fakultet                                         ', 9999)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (79, N'Poljoprivredni fakultet                                     ', 9997)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (81, N'Ekonomski fakultet                                          ', 9998)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (82, N'Gra�evinski fakultet                                        ', 9996)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (83, N'Gra�evinski fakultet                                        ', 9999)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (108, N'Medicinski fakultet                                         ', 9996)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (111, N'Pravni fakultet                                             ', 9997)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (113, N'Prehrambeno tehnolo�ki fakultet                             ', 9997)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (114, N'Gra�evinski fakultet                                        ', 9998)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (115, N'Pravni fakultet                                             ', 9998)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (116, N'Hotelijerski fakultet                                       ', 9998)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (117, N'Tekstilno-tehnolo�ki fakultet                               ', 9996)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (119, N'Prirodoslovno-matemati�ki fakultet Prirodoslovni odsjeci    ', 9996)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (120, N'Fakultet strojarstva i brodogradnje                         ', 9996)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (122, N'Pedago�ki fakultet                                          ', 9997)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (124, N'Metalur�ki fakultet                                         ', 9996)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (125, N'Fakultet kemijskog in�enjerstva i tehnologije               ', 9996)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (128, N'Grafi�ki fakultet                                           ', 9996)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (130, N'Filozofski fakultet                                         ', 9996)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (131, N'U�iteljska akademija                                        ', 9996)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (135, N'Fakultet prometnih znanosti                                 ', 9996)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (140, N'Filozofski fakultet u Puli                                  ', 9998)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (145, N'Fakultet ekonomije i turizma "Dr. Mijo Mirkovi�"            ', 9998)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (149, N'Gra�evinski fakultet                                        ', 9997)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (152, N'Strojarski fakultet                                         ', 9997)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (160, N'Geotehni�ki fakultet                                        ', 9996)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (165, N'Elektrotehni�ki fakultet                                    ', 9997)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (177, N'Fakultet prirodoslovno matemati�kih znanosti i odgojnih podr', 9999)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (178, N'Agronomski fakultet                                         ', 9996)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (195, N'Rudarsko-geolo�ko-naftni fakultet                           ', 9996)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (203, N'Katoli�ki bogoslovni fakultet                               ', 9996)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (215, N'Umjetni�ka akademija                                        ', 9999)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (224, N'Veleu�ili�te u Dubrovniku                                   ', NULL)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (236, N'Medicinski fakultet                                         ', 9997)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (239, N'Odjel za pomorstvo u Rijeci                                 ', 9998)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (245, N'Odjel za pomorstvo u Splitu                                 ', 9999)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (262, N'Visoka u�iteljska �kola                                     ', 9999)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (263, N'Visoka u�iteljska �kola                                     ', 9999)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (264, N'Visoka u�iteljska �kola                                     ', 9998)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (265, N'Visoka u�iteljska �kola                                     ', 9998)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (266, N'Visoka u�iteljska �kola                                     ', 9998)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (267, N'Visoka u�iteljska �kola                                     ', 9997)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (302, N'Studij poslovne informatike                                 ', 9996)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (381, N'Akademija likovnih umjetnosti                               ', 9996)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (1053, N'Akademija dramske umjetnosti                                ', 9996)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (1298, N'Katoli�ki bogoslovni fakultet                               ', 9999)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (1349, N'Muzi�ka akademija                                           ', 9996)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (2223, N'Hrvatski studiji                                            ', 9996)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (2241, N'Nauti�ki odjel                                              ', 224)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (2242, N'Strojarski odjel                                            ', 224)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (2243, N'Odjel elektrotehnike i ra�unarstva                          ', 224)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (2244, N'Turisti�ki odjel                                            ', 224)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (8888, N'SPECIMEN                                                    ', 9996)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (9996, N'Sveu�ili�te u Zagrebu                                       ', NULL)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (9997, N'Sveu�ili�te u Osijeku                                       ', NULL)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (9998, N'Sveu�ili�te u Rijeci                                        ', NULL)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (9999, N'Sveu�ili�te u Splitu                                        ', NULL)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (100001, N'Zavod za primijenjenu fiziku                                ', 36)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (100002, N'Zavod za primijenjenu matematiku                            ', 36)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (100003, N'Zavod za osnove elektrotehnike i elektri�ka mjerenja        ', 36)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (100004, N'Zavod za elektrostrojarstvo i automatizaciju                ', 36)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (100005, N'Zavod za visoki napon i energetiku                          ', 36)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (100006, N'Zavod za telekomunikacije                                   ', 36)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (100007, N'Zavod za elektroni�ke sustave i obradbu informacija         ', 36)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (100008, N'Zavod za automatiku i procesno ra�unarstvo                  ', 36)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (100009, N'Zavod za elektroakustiku                                    ', 36)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (100010, N'Zavod za elektroniku, mikroelektroniku, ra�unalne i intelige', 36)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (100011, N'Zavod za radiokomunikacije i visokofrekvencijsku elektroniku', 36)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (100012, N'Centar informacijske potpore                                ', 36)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (100013, N'Slu�ba odr�avanja                                           ', 100017)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (100015, N'Studentska slu�ba                                           ', 100017)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (100016, N'Op�a i kadrovska slu�ba                                     ', 100017)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (100017, N'Tajni�tvo                                                   ', 36)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (100020, N'Ra�unovodstvo                                               ', 100017)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (100021, N'Bibliotekarska slu�ba                                       ', 100017)
GO
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (100023, N'Grupa za fiziku                                             ', 100001)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (100024, N'Grupa fizikalnih osnova novih energetskih tehnologija       ', 100001)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (100025, N'Grupa za primijenjenu matematiku                            ', 100002)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (100026, N'Grupa ra�unarskih znanosti                                  ', 100002)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (100027, N'Grupa za osnove elektrotehnike                              ', 100003)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (100028, N'Grupa za mjerenja u elektrotehnici                          ', 100003)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (100029, N'Grupa za elektri�ne strojeve                                ', 100004)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (100030, N'Grupa za regulaciju elektri�nih strojeva                    ', 100004)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (100031, N'Grupa za tehnologiju                                        ', 100004)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (100032, N'Grupa za mehani�ke konstrukcije                             ', 100004)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (100033, N'Grupa za elektri�ne aparate                                 ', 100004)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (100034, N'Grupa za energetsku elektroniku                             ', 100004)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (100035, N'Grupa za elektrometriju                                     ', 36)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (100036, N'Grupa za elektri�nu vu�u                                    ', 100004)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (100037, N'Grupa za metode organizacije                                ', 36)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (100038, N'Grupa za elektri�na postrojenja                             ', 100005)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (100039, N'Grupa za nuklearne elektrane                                ', 100005)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (100040, N'Grupa za prijenos elektri�ne energije                       ', 100005)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (100041, N'Grupa za elektri�nu rasvjetu                                ', 100005)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (100042, N'Grupa za elektri�ne �eljeznice                              ', 100005)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (100043, N'Grupa za telekomunikacije i informatiku                     ', 100006)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (100044, N'Grupa za mre�e, sisteme i signale                           ', 100007)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (100045, N'Grupa za elektroni�ka mjerenja i biomedicinsku elektroniku  ', 100007)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (100046, N'Grupa za automatsko upravljanje sistemima                   ', 100008)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (100047, N'Grupa za ra�unarske sisteme i procese                       ', 100008)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (100048, N'Grupa za tonfrekvencijsku i prijemni�ku elektroniku         ', 100009)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (100049, N'Grupa za akustiku i elektroakustiku                         ', 100009)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (100050, N'Grupa za elektroni�ke sklopove                              ', 100010)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (100051, N'Grupa za ra�unarsku tehniku                                 ', 100010)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (100052, N'Grupa za radiokomunikacijske sustave                        ', 100011)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (100053, N'Grupa za visokofrekvencijsku elektroniku                    ', 100011)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (100054, N'Grupa za strani jezik                                       ', 100002)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (100062, N'Grupa za teoretsku elektrotehniku                           ', 100003)
INSERT [dbo].[orgjed] ([sifOrgjed], [nazOrgjed], [sifNadorgjed]) VALUES (100063, N'Grupa za energetsku elektrotehniku                          ', 100004)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (36, N'TEHNO   ', N'Elektrotehni�ka tehnologija                                 ', 100003, 2, 2)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (37, N'EEL     ', N'Energetska elektronika                                      ', 100005, 6, 2)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (39, N'RASAKO  ', N'Radiorelejne i satelitske komunikacije                      ', 100011, 6, 3)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (43, N'ELAK    ', N'Elektroakustika                                             ', 100009, 0, 4)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (47, N'MUE     ', N'Mjerenja u elektrotehnici                                   ', 100003, 0, 2)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (53, N'ELTER   ', N'Elektrotermija                                              ', 100001, 1, 1)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (56, N'GOMUAK  ', N'Govorna i muzi�ka akustika                                  ', 100009, 2, 3)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (57, N'INSKEE  ', N'Integrirani sklopovi energetske elektronike                 ', 100005, 6, NULL)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (58, N'KOELU   ', N'Komponente elektroni�kih ure�aja i mjerne metode            ', 100010, 3, NULL)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (59, N'KVELUR  ', N'Kvaliteta elektroakusti�kih ure�aja                         ', 100009, 0, 3)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (68, N'PORAK   ', N'Pokretne radiokomunikacije                                  ', 100011, 5, 4)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (70, N'PRAPO   ', N'Projektiranje radiofrekvencijskih poja�ala                  ', 100011, 2, 2)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (71, N'PROAK   ', N'Prostorna akustika                                          ', 100009, 0, 2)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (76, N'ULHID   ', N'Ultrazvuk i hidroakustika                                   ', 100009, 70, 3)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (98, N'EKELS   ', N'Ekonomika elektroni�kih sistema                             ', 100010, 45, NULL)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (99, N'EKONEN  ', N'Ekonomika u energetici                                      ', 100005, 21, 2)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (101, N'ELSTR1  ', N'Elektri�ki strojevi I                                       ', 100004, 1, 2)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (102, N'ELIZNA  ', N'Elektroni�ki izvori napajanja                               ', 100010, 5, 3)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (103, N'ELKOS   ', N'Elektroni�ki komutacijski sistemi                           ', 100010, 10, 4)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (104, N'EEL-IP  ', N'Energetska elektronika-izabrana poglavlja                   ', 100005, 110, 3)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (105, N'EEL     ', N'Energetska elektronika                                      ', 100005, 1, NULL)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (106, N'FLASER  ', N'Fizika lasera                                               ', 100001, 2, 1)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (107, N'FOSE    ', N'Fizikalne osnove spremanja energije                         ', 100001, 70, 2)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (143, N'OPES    ', N'Optimalni pogon elektroenergetskog sustava                  ', 100005, 1, 3)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (144, N'OETEM   ', N'Organizacija i eksploatacija telekomunikacijske mre�e       ', 100006, 2, NULL)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (146, N'ORAKOM  ', N'Osnove radiokomunikacija                                    ', 100011, 8, 2)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (147, N'OELAK   ', N'Osnove elektroakustike                                      ', 100009, 0, 3)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (162, N'PIESS   ', N'Projektiranje integriranih elektroni�kih sklopova           ', 100010, 0, 2)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (164, N'PIP     ', N'Projektiranje industrijskih postrojenja                     ', 100004, 0, NULL)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (166, N'ZPM06A2 ', N'Projektiranje programske podr�ke                            ', 100002, 1, 4)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (167, N'PROTEM  ', N'Projektiranje telekomunikacijskih mre�a                     ', 100006, 18, 1)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (169, N'RAKOM   ', N'Radiokomunikacije                                           ', 100011, 1, 3)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (174, N'RESE    ', N'Regulacija elektri�kih strojeva u elektranama               ', 100004, 1, 3)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (181, N'STAEES  ', N'Stabilnost elektroenergetskih sistema                       ', 100005, 2, 3)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (194, N'UNUF    ', N'Uvod u nuklearnu fiziku                                     ', 100001, 14, 4)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (199, N'OSKLOP  ', N'Osnovni elektroni�ki sklopovi                               ', 100010, 0, 2)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (207, N'TEMRE   ', N'Telekomunikacijske mre�e                                    ', 100006, 0, 2)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (209, N'ELENS   ', N'Elektroenergetski sistem                                    ', 100005, 10, NULL)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (229, N'OEEN    ', N'Osnove elektroenergetike                                    ', 100005, 25, 3)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (232, N'SISTR   ', N'Sinkroni strojevi                                           ', 100004, 1, NULL)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (234, N'PTEP    ', N'Prelaz topline u energ. postrojenjima                       ', 100004, 2, NULL)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (238, N'ELSKLOP ', N'Elektroni�ki sklopovi                                       ', 100010, 10, 3)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (241, N'EINKO   ', N'Elektroni�ka instrumentacija i konstrukcije                 ', 100010, 9, 4)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (249, N'ELMJE   ', N'Elektroni�ka mjerenja i komponente                          ', 100010, 0, 3)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (253, N'ESIB    ', N'Energetski sistemi i bilance                                ', 100005, 2, 2)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (254, N'FIZ3    ', N'Fizika III                                                  ', 100001, 0, 2)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (256, N'NUMAT   ', N'Numeri�ka matematika                                        ', 100002, 2, 4)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (258, N'OPEF    ', N'Odabrana poglavlja energetske fizike                        ', 100001, 1, 3)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (259, N'OPOMAT  ', N'Odabrana poglavlja matematike                               ', 100002, 25, 2)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (260, N'OES     ', N'Osnove elektri�kih strojeva                                 ', 100004, 0, NULL)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (262, N'STOMAT  ', N'Stohasti�ka matematika                                      ', 100002, 20, 1)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (264, N'ELRA�   ', N'Elektroni�ka ra�unala                                       ', 100010, 32, NULL)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (265, N'ELEL1   ', N'Elektroni�ki elementi                                       ', 100010, 21, 2)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (266, N'ZFI01O1 ', N'Fizika I                                                    ', 100001, 70, 4)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (267, N'ZFI02O2 ', N'Fizika II                                                   ', 100001, 2, 3)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (271, N'FOE     ', N'Fizikalne osnove elektrotehnike                             ', 100003, 0, 2)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (273, N'OE      ', N'Osnove elektrotehnike                                       ', 100003, 2, NULL)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (277, N'TEOREL  ', N'Teoretska elektrotehnika                                    ', 100003, 1, 1)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (278, N'EENMR3  ', N'Elektroenergetske mre�e III                                 ', 100005, 5, 2)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (282, N'EENMR1  ', N'Elektroenergetske mre�e I                                   ', 100005, 5, 2)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (284, N'ELSKLOP ', N'Elektroni�ki sklopovi                                       ', 100010, 10, 4)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (285, N'RADAR   ', N'Radari i radiokomunikacije                                  ', 100011, 2, 3)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (286, N'RALOTE  ', N'Radiolokacija i radiotelemetrija                            ', 100011, 13, 2)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (288, N'INE03O6 ', N'Elektroni�ka instrumentacija                                ', 100010, 15, 1)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (301, N'EPROC   ', N'Energetski procesi                                          ', 100005, 2, 2)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (303, N'MAT1    ', N'Matematika I                                                ', 100002, 6, 3)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (304, N'MAT2    ', N'Matematika II                                               ', 100002, 6, 2)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (305, N'MAT3    ', N'Matematika III                                              ', 100002, 17, 2)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (307, N'ISKLOP  ', N'Integrirani elektroni�ki sklopovi                           ', 100010, 0, 2)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (312, N'UNUF    ', N'Uvod u nuklearnu fiziku                                     ', 100001, 13, NULL)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (342, N'NEP-K   ', N'Nuklearna energetska postrojenja - konstrukcijske vje�be    ', 100004, 0, 2)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (343, N'ZPM01O1 ', N'Linearna algebra                                            ', 100002, 110, 3)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (344, N'ZPM02O1 ', N'Matemati�ka analiza I                                       ', 100002, 70, NULL)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (345, N'ZOM01O1 ', N'Osnove elektrotehnike I                                     ', 100003, 1, 2)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (346, N'ZPM03O1 ', N'Primjena ra�unala                                           ', 100002, 17, 3)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (347, N'ZPM04O2 ', N'Matemati�ka analiza II                                      ', 100002, 0, 4)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (348, N'ZOM02O2 ', N'Osnove elektrotehnike II                                    ', 100003, 3, NULL)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (349, N'ZPM2002 ', N'Programiranje                                               ', 100002, 15, 2)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (351, N'ZPM06O3 ', N'Matemati�ka analiza III                                     ', 100002, 1, 1)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (352, N'ZOM03O3 ', N'Mjerenja u elektrotehnici                                   ', 100003, 2, NULL)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (353, N'ZSE01O3 ', N'Energetska elektrotehnika                                   ', 100003, 0, 2)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (354, N'ZER3001 ', N'Elektroni�ki elementi                                       ', 100010, 0, 3)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (355, N'ZPM07O3 ', N'Algoritmi i strukture podataka                              ', 100002, 5, 4)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (356, N'ZPM4001 ', N'Stohasti�ka i numeri�ka matematika                          ', 100002, 13, 2)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (357, N'ZPM4002 ', N'Diskretna i stohasti�ka matematika                          ', 100002, 20, 2)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (358, N'ZOM03O4 ', N'Mjerenja u elektrotehnici-praktikum                         ', 100003, 0, 3)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (361, N'ZRS01O4 ', N'Osnove digitalnih ra�unala                                  ', 100008, 0, NULL)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (362, N'ZER4002 ', N'Elektroni�ki sklopovi                                       ', 100010, 40, 2)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (367, N'ZFI03O5 ', N'Fizika materijala                                           ', 100001, 45, 3)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (370, N'AUT6003 ', N'Elektroni�ka instrumentacija i mjerenja                     ', 100010, 17, 4)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (371, N'ZER15A2 ', N'Slo�eni elektroni�ki sklopovi                               ', 100010, 8, 2)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (372, N'ENE04O6 ', N'Osnove energetske elektronike                               ', 100005, 18, 1)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (373, N'ZRS11A2 ', N'Analiza osjetljivosti, sinteza i optimiranje sustava        ', 100008, 0, 3)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (374, N'ZRS17A2 ', N'Procesna mjerenja                                           ', 100008, 0, 2)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (376, N'ZRS12A2 ', N'Otvoreno ra�unarstvo                                        ', 100008, 0, 3)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (378, N'ZPM05A2 ', N'Matemati�ke osnove optimalnog upravljanja                   ', 100002, 25, 2)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (382, N'ENE02O5 ', N'Elektri�ni strojevi i transformatori                        ', 100004, 0, 4)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (384, N'ZOM04O5 ', N'Teorijska elektrotehnika                                    ', 100003, 1, 2)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (390, N'ESA07O6 ', N'Osnove �vrsto�e i konstruiranja                             ', 100004, 2, 2)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (391, N'ESA5001 ', N'Osnove elektri�nih strojeva i transformatora                ', 100004, 0, 2)
GO
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (392, N'ESA02O5 ', N'Energetska elektronika                                      ', 100004, 2, 2)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (393, N'ESA03O5 ', N'Elektrotehni�ki materijali i tehnologija                    ', 100004, 110, 4)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (394, N'ESA6002 ', N'Kolektorski i elektroni�ki komutirani motori                ', 100004, 1, NULL)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (397, N'INE01O5 ', N'Elektroni�ka mjerenja i komponente                          ', 100010, 2, 2)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (404, N'RKP03O5 ', N'Elektroakustika                                             ', 100009, 0, 3)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (407, N'RKP09O7 ', N'Optoelektroni�ki sklopovi                                   ', 100010, 70, 4)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (410, N'TKI03O5 ', N'Telekomunikacijske mre�e                                    ', 100006, 0, 2)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (414, N'ZPM11O5 ', N'Programske paradigme i jezici                               ', 100002, 2, 3)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (419, N'ZPM02A1 ', N'Operacijska istra�ivanja                                    ', 100002, 10, 1)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (420, N'ENE6101 ', N'Energetski izvori                                           ', 100005, 9, 2)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (423, N'IRB01A1 ', N'Fizika poluvodi�a                                           ', 100001, 11, 2)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (425, N'ZPM01A1 ', N'Stohasti�ki procesi                                         ', 100002, 70, 2)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (429, N'ZPM09O4 ', N'Numeri�ka matematika                                        ', 100002, 8, NULL)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (430, N'AUT5002 ', N'Elektroni�ka ra�unala                                       ', 100010, 3, 2)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (439, N'ZPM08O4 ', N'Stohasti�ka matematika                                      ', 100002, 18, 1)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (441, N'ZPM10O4 ', N'Diskretna matematika                                        ', 100002, 17, 4)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (450, N'ENE01O5 ', N'Energetski procesi                                          ', 100005, 11, NULL)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (452, N'ENE08O7 ', N'Elektroenergetske mre�e                                     ', 100005, 0, 2)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (453, N'ENE09O7 ', N'Numeri�ka analiza elektroenergetskog sustava                ', 100005, 2, 3)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (458, N'ENE14O8 ', N'Za�tita i automatika elektroenergetskog sustava             ', 100005, 5, NULL)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (459, N'ENE15O8 ', N'Energetika i okoli�                                         ', 100005, 9, 2)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (461, N'ESA04O6 ', N'Regulacijska tehnika                                        ', 100004, 2, 3)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (464, N'ESA10O7 ', N'Elektromotorni pogoni                                       ', 100004, 0, 4)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (465, N'ESA11O7 ', N'Upravljanje elektromotornim pogonima                        ', 100004, 0, 2)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (467, N'ESA13O8 ', N'Projektiranje industrijskih postrojenja                     ', 100004, 0, 2)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (468, N'ESA14O7 ', N'Razvod elektri�ne energije                                  ', 100004, 1, 3)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (470, N'ESA16O9 ', N'Mehatroni�ki sustavi                                        ', 100004, 2, NULL)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (474, N'AUT06O6 ', N'Elektroni�ka mjerenja i instrumentacija                     ', 100010, 12, 1)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (483, N'INE08O7 ', N'Mikroelektroni�ki sklopovi                                  ', 100010, 0, 3)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (489, N'RKP08O7 ', N'Osnove radiokomunikacijskih sustava                         ', 100011, 6, 2)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (490, N'RKP10O7 ', N'Elektroakusti�ki signali i sustavi                          ', 100009, 0, 4)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (500, N'TKI11O8 ', N'Pouzdanost telekomunikacijskih sustava                      ', 100006, 1, 2)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (505, N'ZER07A1 ', N'Osnove mikroelektroni�kih sklopova                          ', 100010, 2, 2)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (509, N'ZFI03A2 ', N'Fizika lasera                                               ', 100001, 0, 3)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (515, N'ZVF01A1 ', N'Radiolokacija i navigacija                                  ', 100011, 10, 2)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (517, N'ZEA01A1 ', N'Ultrazvuk i hidroakustika                                   ', 100009, 70, 3)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (525, N'ZPM03A1 ', N'Projektiranje informacijskih sustava                        ', 100002, 10, 3)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (528, N'ZRS16A2 ', N'Upravljanje, slijedni sustavi i senzori u robotici          ', 100008, 3, NULL)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (529, N'FSB13A2 ', N'Regulacija u energetskim postrojenjima                      ', 100004, 0, 2)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (532, N'ZES15A1 ', N'Sklopni i za�titni ure�aji u postrojenjima                  ', 100004, 1, 3)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (535, N'ZES12A2 ', N'Projektiranje i konstruiranje u elektrostrojarstvu          ', 100004, 2, 4)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (541, N'ZEN01A1 ', N'Pouzdanost elektroenergetskog sustava                       ', 100005, 5, 2)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (545, N'IHP10A2 ', N'Energetski izvori                                           ', 100005, 3, 2)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (548, N'ZEN04A1 ', N'Ekonomika u energetici                                      ', 100005, 0, 3)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (549, N'ZEN03A1 ', N'Numeri�ki postupci u elektroenergetici                      ', 100005, 5, 1)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (554, N'ESA02O5 ', N'Energetska elektronika                                      ', 100004, 18, 1)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (576, N'ZEN09B1 ', N'Dinamika elektroenergetskog sustava                         ', 100005, 8, 2)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (580, N'ZRS01A1 ', N'Adaptivno i robusno upravljanje                             ', 100008, 0, 3)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (583, N'ZPM04B1 ', N'Objektno orijentirano programiranje                         ', 100002, 21, 4)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (588, N'ZRS05B1 ', N'Inteligentno upravljanje sustavima                          ', 100008, 0, 4)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (589, N'ZRS09B1 ', N'Identifikacija procesa                                      ', 100008, 70, 2)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (590, N'ZRS06B1 ', N'Automatizacija brodskih procesa                             ', 100008, 1, 2)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (594, N'ZES09B1 ', N'Elektroni�ki pretvara�i za elektromotorne pogone            ', 100010, 23, 3)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (595, N'ESA15O8 ', N'Automatizirana ispitivanja elektrotehni�kih ure�aja         ', 100004, 0, NULL)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (596, N'ZRS02A1 ', N'Alarmni sustavi                                             ', 100008, 5, 2)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (604, N'ZES16A1 ', N'Sinkroni strojevi i uzbude                                  ', 100004, 0, 3)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (605, N'ZRS07B1 ', N'Odabrana poglavlja iz programskog in�enjerstva              ', 100008, 1, NULL)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (607, N'ZVF11B1 ', N'Projektiranje radiofrekvencijskih poja�ala                  ', 100011, 20, 3)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (609, N'ZVF04A1 ', N'Numeri�ki postupci u radiokomunikacijama                    ', 100011, 23, 1)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (610, N'ZRS10B1 ', N'Vo�enje projekata automatike                                ', 100008, 0, 3)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (611, N'ZRS03B1 ', N'Vo�enje i upravljanje plovila                               ', 100008, 1, 4)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (612, N'ZRS08B1 ', N'Realizacija upravlja�kih algoritama i ra�unalnih arhitektura', 100008, 0, 2)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (615, N'ZVF09B1 ', N'Tehnologija radiofrekvencijskih komponenata                 ', 100011, 0, NULL)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (621, N'TKI05B1 ', N'Razvoj telekomunikacijske programske podr�ke                ', 100006, 1, 2)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (627, N'TKI08B1 ', N'Organizacija telekomunikacijske mre�e                       ', 100006, 2, 3)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (628, N'TKI09B1 ', N'Informacijski sustav telekmunikacijske mre�e                ', 100006, 0, 4)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (634, N'ZVF05A1 ', N'Radiotelemetrija                                            ', 100011, 0, 2)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (636, N'ZEA03A1 ', N'Psihoakustika                                               ', 100009, 1, 3)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (637, N'ZEA05A1 ', N'Govorna i glazbena akustika                                 ', 100009, 2, NULL)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (641, N'ESA17O6 ', N'Elektri�ni strojevi                                         ', 100004, 70, 2)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (642, N'ESA01O5 ', N'Elektromehani�ka i elektromagnetska pretvorba               ', 100004, 0, 3)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (643, N'ESA19O8 ', N'Razvoj elektrotehni�kih proizvoda                           ', 100004, 5, 2)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (646, N'ZPM06A2 ', N'Projektiranje programske podr�ke                            ', 100002, 29, 2)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (650, N'ZPM05O2 ', N'Programiranje                                               ', 100002, 17, 2)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (652, N'ZRS16A2 ', N'Fleksibilni proizvodni sustavi                              ', 100008, 18, 1)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (653, N'ZRS08B1 ', N'Realizacija algoritama i ra�unalnih arhitektura             ', 100008, 1, 2)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (654, N'Z0M03O3 ', N'Mjerenja u elektrotehnici                                   ', 100003, 2, 2)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (656, N'ZPM06A2 ', N'Ergonomija ra�unalne i programske opreme                    ', 100002, 0, 3)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (657, N'ZRS09B1 ', N'Identifikacija procesa                                      ', 100008, 70, NULL)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (658, N'ZPM07A1 ', N'Osnove baza podataka                                        ', 100002, 15, 2)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (662, N'ENE15O8 ', N'Energetika i okoli�                                         ', 100005, 1, 3)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (669, N'ZOM03O3 ', N'Mjerenja u elektrotehnici                                   ', 100003, 2, 4)
INSERT [dbo].[pred] ([sifPred], [kratPred], [nazPred], [sifOrgjed], [upisanoStud], [brojSatiTjedno]) VALUES (670, N'ZZZZ    ', N'Proba                                                       ', 100003, 2, 2)
INSERT [dbo].[rezervacija] ([oznDvorana], [oznVrstaDan], [sat], [sifPred]) VALUES (N'B1   ', N'PO', 15, 393)
INSERT [dbo].[rezervacija] ([oznDvorana], [oznVrstaDan], [sat], [sifPred]) VALUES (N'B1   ', N'PO', 9, 393)
INSERT [dbo].[rezervacija] ([oznDvorana], [oznVrstaDan], [sat], [sifPred]) VALUES (N'B2   ', N'PO', 14, 393)
INSERT [dbo].[rezervacija] ([oznDvorana], [oznVrstaDan], [sat], [sifPred]) VALUES (N'B2   ', N'PO', 17, 393)
INSERT [dbo].[rezervacija] ([oznDvorana], [oznVrstaDan], [sat], [sifPred]) VALUES (N'B3   ', N'PO', 18, 393)
INSERT [dbo].[rezervacija] ([oznDvorana], [oznVrstaDan], [sat], [sifPred]) VALUES (N'B3   ', N'PO', 14, 393)
INSERT [dbo].[rezervacija] ([oznDvorana], [oznVrstaDan], [sat], [sifPred]) VALUES (N'B1   ', N'SR', 15, 393)
INSERT [dbo].[rezervacija] ([oznDvorana], [oznVrstaDan], [sat], [sifPred]) VALUES (N'B2   ', N'SR', 16, 393)
INSERT [dbo].[rezervacija] ([oznDvorana], [oznVrstaDan], [sat], [sifPred]) VALUES (N'B3   ', N'SR', 17, 393)
INSERT [dbo].[rezervacija] ([oznDvorana], [oznVrstaDan], [sat], [sifPred]) VALUES (N'A101 ', N'PO', 8, 104)
INSERT [dbo].[rezervacija] ([oznDvorana], [oznVrstaDan], [sat], [sifPred]) VALUES (N'A101 ', N'PO', 5, 104)
INSERT [dbo].[rezervacija] ([oznDvorana], [oznVrstaDan], [sat], [sifPred]) VALUES (N'A101 ', N'PO', 11, 104)
INSERT [dbo].[rezervacija] ([oznDvorana], [oznVrstaDan], [sat], [sifPred]) VALUES (N'A101 ', N'PO', 19, 104)
INSERT [dbo].[rezervacija] ([oznDvorana], [oznVrstaDan], [sat], [sifPred]) VALUES (N'A101 ', N'PO', 10, 104)
INSERT [dbo].[rezervacija] ([oznDvorana], [oznVrstaDan], [sat], [sifPred]) VALUES (N'A101 ', N'UT', 20, 104)
INSERT [dbo].[rezervacija] ([oznDvorana], [oznVrstaDan], [sat], [sifPred]) VALUES (N'A101 ', N'UT', 10, 104)
INSERT [dbo].[rezervacija] ([oznDvorana], [oznVrstaDan], [sat], [sifPred]) VALUES (N'A101 ', N'UT', 12, 104)
INSERT [dbo].[rezervacija] ([oznDvorana], [oznVrstaDan], [sat], [sifPred]) VALUES (N'A101 ', N'UT', 14, 104)
INSERT [dbo].[rezervacija] ([oznDvorana], [oznVrstaDan], [sat], [sifPred]) VALUES (N'A102 ', N'CE', 13, 343)
INSERT [dbo].[rezervacija] ([oznDvorana], [oznVrstaDan], [sat], [sifPred]) VALUES (N'A101 ', N'CE', 12, 343)
INSERT [dbo].[rezervacija] ([oznDvorana], [oznVrstaDan], [sat], [sifPred]) VALUES (N'A209 ', N'CE', 14, 641)
INSERT [dbo].[rezervacija] ([oznDvorana], [oznVrstaDan], [sat], [sifPred]) VALUES (N'A210 ', N'CE', 20, 641)
INSERT [dbo].[rezervacija] ([oznDvorana], [oznVrstaDan], [sat], [sifPred]) VALUES (N'A209 ', N'PE', 14, 641)
INSERT [dbo].[rezervacija] ([oznDvorana], [oznVrstaDan], [sat], [sifPred]) VALUES (N'A210 ', N'PE', 15, 641)
INSERT [dbo].[rezervacija] ([oznDvorana], [oznVrstaDan], [sat], [sifPred]) VALUES (N'A204 ', N'SR', 11, 107)
INSERT [dbo].[rezervacija] ([oznDvorana], [oznVrstaDan], [sat], [sifPred]) VALUES (N'A204 ', N'SR', 15, 107)
INSERT [dbo].[rezervacija] ([oznDvorana], [oznVrstaDan], [sat], [sifPred]) VALUES (N'A205 ', N'SR', 18, 107)
INSERT [dbo].[rezervacija] ([oznDvorana], [oznVrstaDan], [sat], [sifPred]) VALUES (N'A205 ', N'SR', 16, 107)
INSERT [dbo].[rezervacija] ([oznDvorana], [oznVrstaDan], [sat], [sifPred]) VALUES (N'B1   ', N'CE', 10, 425)
INSERT [dbo].[rezervacija] ([oznDvorana], [oznVrstaDan], [sat], [sifPred]) VALUES (N'A101 ', N'CE', 17, 425)
INSERT [dbo].[rezervacija] ([oznDvorana], [oznVrstaDan], [sat], [sifPred]) VALUES (N'B1   ', N'PO', 10, 305)
INSERT [dbo].[rezervacija] ([oznDvorana], [oznVrstaDan], [sat], [sifPred]) VALUES (N'B1   ', N'PO', 12, 304)
INSERT [dbo].[rezervacija] ([oznDvorana], [oznVrstaDan], [sat], [sifPred]) VALUES (N'B2   ', N'PO', 13, 288)
INSERT [dbo].[rezervacija] ([oznDvorana], [oznVrstaDan], [sat], [sifPred]) VALUES (N'B3   ', N'PO', 19, 286)
INSERT [dbo].[rezervacija] ([oznDvorana], [oznVrstaDan], [sat], [sifPred]) VALUES (N'B3   ', N'PO', 15, 285)
INSERT [dbo].[rezervacija] ([oznDvorana], [oznVrstaDan], [sat], [sifPred]) VALUES (N'B1   ', N'SR', 11, 284)
INSERT [dbo].[rezervacija] ([oznDvorana], [oznVrstaDan], [sat], [sifPred]) VALUES (N'B2   ', N'SR', 14, 282)
INSERT [dbo].[rezervacija] ([oznDvorana], [oznVrstaDan], [sat], [sifPred]) VALUES (N'B3   ', N'SR', 13, 278)
INSERT [dbo].[rezervacija] ([oznDvorana], [oznVrstaDan], [sat], [sifPred]) VALUES (N'A101 ', N'PO', 14, 267)
INSERT [dbo].[rezervacija] ([oznDvorana], [oznVrstaDan], [sat], [sifPred]) VALUES (N'A101 ', N'PO', 17, 266)
INSERT [dbo].[rezervacija] ([oznDvorana], [oznVrstaDan], [sat], [sifPred]) VALUES (N'A101 ', N'UT', 15, 265)
INSERT [dbo].[rezervacija] ([oznDvorana], [oznVrstaDan], [sat], [sifPred]) VALUES (N'A101 ', N'UT', 16, 262)
INSERT [dbo].[rezervacija] ([oznDvorana], [oznVrstaDan], [sat], [sifPred]) VALUES (N'A101 ', N'UT', 6, 259)
INSERT [dbo].[rezervacija] ([oznDvorana], [oznVrstaDan], [sat], [sifPred]) VALUES (N'A102 ', N'CE', 11, 258)
INSERT [dbo].[rezervacija] ([oznDvorana], [oznVrstaDan], [sat], [sifPred]) VALUES (N'A101 ', N'CE', 18, 256)
INSERT [dbo].[rezervacija] ([oznDvorana], [oznVrstaDan], [sat], [sifPred]) VALUES (N'A210 ', N'CE', 17, 253)
INSERT [dbo].[rezervacija] ([oznDvorana], [oznVrstaDan], [sat], [sifPred]) VALUES (N'A204 ', N'SR', 17, 36)
INSERT [dbo].[rezervacija] ([oznDvorana], [oznVrstaDan], [sat], [sifPred]) VALUES (N'A204 ', N'SR', 16, 39)
INSERT [dbo].[rezervacija] ([oznDvorana], [oznVrstaDan], [sat], [sifPred]) VALUES (N'B1   ', N'CE', 11, 53)
INSERT [dbo].[rezervacija] ([oznDvorana], [oznVrstaDan], [sat], [sifPred]) VALUES (N'A101 ', N'CE', 15, 56)
INSERT [dbo].[rezervacija] ([oznDvorana], [oznVrstaDan], [sat], [sifPred]) VALUES (N'B2   ', N'PO', 15, 68)
INSERT [dbo].[rezervacija] ([oznDvorana], [oznVrstaDan], [sat], [sifPred]) VALUES (N'B3   ', N'PO', 12, 70)
INSERT [dbo].[rezervacija] ([oznDvorana], [oznVrstaDan], [sat], [sifPred]) VALUES (N'B1   ', N'SR', 14, 76)
INSERT [dbo].[rezervacija] ([oznDvorana], [oznVrstaDan], [sat], [sifPred]) VALUES (N'B3   ', N'SR', 15, 101)
INSERT [dbo].[rezervacija] ([oznDvorana], [oznVrstaDan], [sat], [sifPred]) VALUES (N'A101 ', N'PO', 9, 102)
INSERT [dbo].[rezervacija] ([oznDvorana], [oznVrstaDan], [sat], [sifPred]) VALUES (N'A101 ', N'PO', 18, 103)
INSERT [dbo].[rezervacija] ([oznDvorana], [oznVrstaDan], [sat], [sifPred]) VALUES (N'A101 ', N'UT', 4, 143)
INSERT [dbo].[rezervacija] ([oznDvorana], [oznVrstaDan], [sat], [sifPred]) VALUES (N'A101 ', N'UT', 9, 384)
INSERT [dbo].[rezervacija] ([oznDvorana], [oznVrstaDan], [sat], [sifPred]) VALUES (N'A101 ', N'CE', 13, 390)
INSERT [dbo].[rezervacija] ([oznDvorana], [oznVrstaDan], [sat], [sifPred]) VALUES (N'B1   ', N'PO', 16, 370)
INSERT [dbo].[rezervacija] ([oznDvorana], [oznVrstaDan], [sat], [sifPred]) VALUES (N'B1   ', N'PO', 14, 371)
INSERT [dbo].[rezervacija] ([oznDvorana], [oznVrstaDan], [sat], [sifPred]) VALUES (N'B2   ', N'PO', 16, 372)
INSERT [dbo].[rezervacija] ([oznDvorana], [oznVrstaDan], [sat], [sifPred]) VALUES (N'B1   ', N'PO', 11, 576)
INSERT [dbo].[rezervacija] ([oznDvorana], [oznVrstaDan], [sat], [sifPred]) VALUES (N'B2   ', N'PO', 11, 589)
INSERT [dbo].[rezervacija] ([oznDvorana], [oznVrstaDan], [sat], [sifPred]) VALUES (N'B3   ', N'PO', 11, 590)
INSERT [dbo].[rezervacija] ([oznDvorana], [oznVrstaDan], [sat], [sifPred]) VALUES (N'B3   ', N'PO', 20, 594)
INSERT [dbo].[rezervacija] ([oznDvorana], [oznVrstaDan], [sat], [sifPred]) VALUES (N'B2   ', N'SR', 12, 596)
INSERT [dbo].[rezervacija] ([oznDvorana], [oznVrstaDan], [sat], [sifPred]) VALUES (N'A101 ', N'UT', 18, 607)
INSERT [dbo].[rezervacija] ([oznDvorana], [oznVrstaDan], [sat], [sifPred]) VALUES (N'A102 ', N'CE', 20, 611)
INSERT [dbo].[rezervacija] ([oznDvorana], [oznVrstaDan], [sat], [sifPred]) VALUES (N'A210 ', N'PE', 16, 621)
INSERT [dbo].[rezervacija] ([oznDvorana], [oznVrstaDan], [sat], [sifPred]) VALUES (N'A204 ', N'SR', 18, 627)
INSERT [dbo].[rezervacija] ([oznDvorana], [oznVrstaDan], [sat], [sifPred]) VALUES (N'A205 ', N'SR', 10, 643)
INSERT [dbo].[rezervacija] ([oznDvorana], [oznVrstaDan], [sat], [sifPred]) VALUES (N'B1   ', N'CE', 20, 636)
INSERT [dbo].[rezervacija] ([oznDvorana], [oznVrstaDan], [sat], [sifPred]) VALUES (N'B1   ', N'PO', 8, 652)
INSERT [dbo].[rezervacija] ([oznDvorana], [oznVrstaDan], [sat], [sifPred]) VALUES (N'B2   ', N'PO', 9, 653)
INSERT [dbo].[rezervacija] ([oznDvorana], [oznVrstaDan], [sat], [sifPred]) VALUES (N'B3   ', N'PO', 9, 654)
INSERT [dbo].[rezervacija] ([oznDvorana], [oznVrstaDan], [sat], [sifPred]) VALUES (N'B2   ', N'SR', 13, 658)
INSERT [dbo].[rezervacija] ([oznDvorana], [oznVrstaDan], [sat], [sifPred]) VALUES (N'B3   ', N'SR', 14, 662)
INSERT [dbo].[rezervacija] ([oznDvorana], [oznVrstaDan], [sat], [sifPred]) VALUES (N'A101 ', N'PO', 15, 669)
INSERT [dbo].[rezervacija] ([oznDvorana], [oznVrstaDan], [sat], [sifPred]) VALUES (N'A101 ', N'PO', 20, 301)
INSERT [dbo].[rezervacija] ([oznDvorana], [oznVrstaDan], [sat], [sifPred]) VALUES (N'A101 ', N'UT', 19, 37)
INSERT [dbo].[rezervacija] ([oznDvorana], [oznVrstaDan], [sat], [sifPred]) VALUES (N'A102 ', N'CE', 12, 392)
INSERT [dbo].[rezervacija] ([oznDvorana], [oznVrstaDan], [sat], [sifPred]) VALUES (N'A204 ', N'SR', 7, 515)
INSERT [dbo].[rezervacija] ([oznDvorana], [oznVrstaDan], [sat], [sifPred]) VALUES (N'A204 ', N'SR', 8, 99)
INSERT [dbo].[rezervacija] ([oznDvorana], [oznVrstaDan], [sat], [sifPred]) VALUES (N'B1   ', N'CE', 19, 181)
INSERT [dbo].[rezervacija] ([oznDvorana], [oznVrstaDan], [sat], [sifPred]) VALUES (N'B2   ', N'PO', 10, 489)
INSERT [dbo].[rezervacija] ([oznDvorana], [oznVrstaDan], [sat], [sifPred]) VALUES (N'B1   ', N'SR', 17, 166)
INSERT [dbo].[rezervacija] ([oznDvorana], [oznVrstaDan], [sat], [sifPred]) VALUES (N'B3   ', N'SR', 11, 650)
INSERT [dbo].[rezervacija] ([oznDvorana], [oznVrstaDan], [sat], [sifPred]) VALUES (N'A111 ', N'SR', 14, 589)
SET IDENTITY_INSERT [dbo].[stud] ON 

INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1120, N'Zdenko', N'Kolac', 31000, 40000, CAST(N'1985-06-06T00:00:00.000' AS DateTime), N'0606985330186')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1121, N'Danijel', N'Marovi�', 21000, 10000, CAST(N'1984-12-18T00:00:00.000' AS DateTime), N'1812984330118')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1123, N'Jozefina', N'Anton�i�', 10000, 10000, CAST(N'1984-01-21T00:00:00.000' AS DateTime), N'2101984330133')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1124, N'Tihomir', N'Crnkovi�', 34000, 10000, CAST(N'1985-05-01T00:00:00.000' AS DateTime), N'0105985303228')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1125, N'Vjeran', N'Brezac', 44000, 44000, CAST(N'1984-04-12T00:00:00.000' AS DateTime), N'1204984335026')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1127, N'Dario', N'Risek', 32000, 32000, CAST(N'1984-07-19T00:00:00.000' AS DateTime), N'1907984362909')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1128, N'Zlatko', N'Broz', 42000, 10000, CAST(N'1984-03-17T00:00:00.000' AS DateTime), N'1703984330099')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1129, N'Julija', N'Kos', 51000, 51000, CAST(N'1985-05-19T00:00:00.000' AS DateTime), N'1905985330161')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1131, N'Zlatko', N'Nenadi�', 35000, 35000, CAST(N'1984-11-17T00:00:00.000' AS DateTime), N'1711984395329')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1132, N'Nikica', N'Arunovi�', 48000, 48000, CAST(N'1984-09-01T00:00:00.000' AS DateTime), N'0109984330006')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1133, N'Darko', N'Cindri�', 40000, 10000, CAST(N'1984-10-18T00:00:00.000' AS DateTime), N'1810984330093')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1135, N'Juraj', N'Ro�man', 42000, 42000, CAST(N'1984-08-19T00:00:00.000' AS DateTime), N'1908984312508')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1136, N'Vlatko', N'Horvati�', 51000, 51000, CAST(N'1985-06-26T00:00:00.000' AS DateTime), N'2606985325027')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1137, N'Jure', N'Ribari�', 22000, 22000, CAST(N'1983-11-02T00:00:00.000' AS DateTime), N'0211983392304')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1139, N'Niko', N'Maru�i�', 48000, 48000, CAST(N'1984-08-22T00:00:00.000' AS DateTime), N'2208984173977')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1140, N'Davor', N'Vurnek', 20000, 20000, CAST(N'1984-10-29T00:00:00.000' AS DateTime), N'2910984300802')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1141, N'Zoran', N'Habajec', 21000, 21000, CAST(N'1984-07-25T00:00:00.000' AS DateTime), N'2507984301807')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1143, N'Davor', N'Voras', 20000, 10000, NULL, N'1234567891284')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1144, N'Zvonimir', N'Ozimec', 21000, 21000, CAST(N'1985-10-08T00:00:00.000' AS DateTime), N'0810985390015')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1145, N'Jurica', N'Ba�i�', 10000, 10000, CAST(N'1985-07-06T00:00:00.000' AS DateTime), N'0607985361605')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1147, N'Alenka', N'Vukojevi�', 21000, 21000, CAST(N'1985-06-14T00:00:00.000' AS DateTime), N'1406985311906')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1148, N'Antonijo', N'Javorina', 10000, 10000, CAST(N'1984-07-16T00:00:00.000' AS DateTime), N'1607984330068')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1149, N'Nikola', N'Ba�i�', 20000, 10000, CAST(N'1984-04-08T00:00:00.000' AS DateTime), N'0804984330122')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1151, N'Karlo', N'Krsnik', 10010, 10000, CAST(N'1984-08-18T00:00:00.000' AS DateTime), N'1808984320522')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1152, N'Bo�idar', N'Tomi�', 20250, 20250, CAST(N'1985-08-07T00:00:00.000' AS DateTime), N'0708985395074')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1153, N'Josip', N'Duki�', 21270, 10000, CAST(N'1985-06-23T00:00:00.000' AS DateTime), N'2306985330111')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1155, N'Davorin', N'Mirkovi�', 32100, 32100, CAST(N'1985-07-04T00:00:00.000' AS DateTime), N'0407985307804')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1156, N'Nikolina', N'Medvedec', 34340, 10370, CAST(N'1985-01-27T00:00:00.000' AS DateTime), N'2701985381508')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1157, N'Nina', N'Cnappi', 44320, 10000, CAST(N'1985-05-23T00:00:00.000' AS DateTime), N'2305985390005')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1159, N'Katarina', N'Dobrina', 52420, 10000, CAST(N'1985-02-18T00:00:00.000' AS DateTime), N'1802985330169')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1160, N'Majo', N'Musi�', 10450, 10000, CAST(N'1984-10-27T00:00:00.000' AS DateTime), N'2710984303508')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1161, N'Davor', N'Jurinjak', 23250, 10000, CAST(N'1985-05-23T00:00:00.000' AS DateTime), N'2305985330103')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1163, N'Davorka', N'Smoli�-Grgi�', 43280, 10000, CAST(N'1985-06-27T00:00:00.000' AS DateTime), N'2706985391817')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1164, N'Kre�imir', N'Vlahovi�', 49250, 10000, CAST(N'1985-03-07T00:00:00.000' AS DateTime), N'0703985395007')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1165, N'�eljka', N'Mori�', 20242, 10000, CAST(N'1985-06-03T00:00:00.000' AS DateTime), N'0306985392119')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1167, N'Mirko', N'Tekli�', 47201, 10000, CAST(N'1984-03-28T00:00:00.000' AS DateTime), N'2803984310615')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1168, N'Doris', N'Rapinac', 40000, 10000, CAST(N'1984-11-22T00:00:00.000' AS DateTime), N'2211984335101')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1169, N'Dubravko', N'Vani�ek', 42000, 10000, CAST(N'1984-11-27T00:00:00.000' AS DateTime), N'2711984320539')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1170, N'Denis', N'Pauk', 31000, 31000, CAST(N'1985-04-11T00:00:00.000' AS DateTime), N'1104985301819')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1172, N'Ninoslav', N'Novak', 21000, 10000, CAST(N'1984-04-10T00:00:00.000' AS DateTime), N'1004984383309')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1173, N'Gordan', N'Bor�i�', 10000, 20000, CAST(N'1980-02-29T00:00:00.000' AS DateTime), N'1902980334016')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1174, N'Edita', N'Domijan', 47300, 10000, CAST(N'1985-06-21T00:00:00.000' AS DateTime), N'2106985380029')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1176, N'Predrag', N'�uljevi�', 34000, 10000, CAST(N'1983-12-31T00:00:00.000' AS DateTime), N'3112983320569')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1177, N'Kristian', N'Klarin', 10000, 10000, CAST(N'1985-06-10T00:00:00.000' AS DateTime), N'1006985330028')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1178, N'Kristijan', N'Vrabec', 20000, 10000, CAST(N'1984-10-07T00:00:00.000' AS DateTime), N'0710984361315')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1180, N'Iva', N'Mio�', 21000, 21000, CAST(N'1985-01-31T00:00:00.000' AS DateTime), N'3101985340008')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1181, N'Arsenio', N'Mini�', 10000, 20000, CAST(N'1984-09-17T00:00:00.000' AS DateTime), N'1709984320508')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1182, N'Gorana', N'Bo�i�', 20000, 20000, CAST(N'1983-07-21T00:00:00.000' AS DateTime), N'2107983340011')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1184, N'Tihomir', N'Fabris', 10000, 20000, CAST(N'1984-09-08T00:00:00.000' AS DateTime), N'0809984360058')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1185, N'Ozren', N'Smoli�', 20000, 10000, CAST(N'1985-06-23T00:00:00.000' AS DateTime), N'2306985330083')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1186, N'Zlatko', N'Kolar', 21000, 10000, CAST(N'1984-09-18T00:00:00.000' AS DateTime), N'1809984391008')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1188, N'Kristina', N'Mandi�', 20000, 10000, CAST(N'1985-01-19T00:00:00.000' AS DateTime), N'1901985391825')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1189, N'Juraj', N'Ma�ek', 21000, 21000, CAST(N'1985-01-27T00:00:00.000' AS DateTime), N'2701985390206')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1190, N'Domagoj', N'Kri�to', 10000, 10000, CAST(N'1985-03-13T00:00:00.000' AS DateTime), N'1303985330094')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1192, N'Helena', N'Mandi�', 21000, 21000, CAST(N'1985-07-10T00:00:00.000' AS DateTime), N'1007985300028')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1193, N'Krunoslav', N'Brezak', 10000, 10000, CAST(N'1984-11-03T00:00:00.000' AS DateTime), N'0311984370805')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1194, N'Antun Ivan', N'Herak', 20000, 20000, CAST(N'1984-07-04T00:00:00.000' AS DateTime), N'0407984330073')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1196, N'Pavao', N'Falk', 20000, 10000, CAST(N'1984-07-12T00:00:00.000' AS DateTime), N'1207984330057')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1197, N'Dominik', N'Hacek', 10000, 10000, CAST(N'1985-04-12T00:00:00.000' AS DateTime), N'1204985306801')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1198, N'Helena', N'Vidakovi�', 21000, 21000, CAST(N'1984-08-31T00:00:00.000' AS DateTime), N'3108984330057')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1200, N'Davor', N'Bun�ec', 21000, 21000, CAST(N'1984-05-05T00:00:00.000' AS DateTime), N'0505984330124')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1201, N'Doris', N'Kon�ar', 10000, 10000, CAST(N'1985-06-01T00:00:00.000' AS DateTime), N'0106985392713')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1202, N'Perica', N'Mikulec', 21000, 21000, CAST(N'1984-04-10T00:00:00.000' AS DateTime), N'1004984340304')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1204, N'Ksenija', N'�ular', 51000, 51000, CAST(N'1985-08-10T00:00:00.000' AS DateTime), N'1008985311207')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1205, N'Dragan', N'Vrane�i�', 51000, 10000, CAST(N'1984-11-28T00:00:00.000' AS DateTime), N'2811984330185')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1206, N'Jozefina', N'Blauhorn', 51000, 51000, CAST(N'1985-06-10T00:00:00.000' AS DateTime), N'1006985383925')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1208, N'Franjo', N'Stipanov', 31000, 31000, CAST(N'1984-08-11T00:00:00.000' AS DateTime), N'1108984385042')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1209, N'Petar', N'�krinjari�', 31000, 31000, CAST(N'1984-12-14T00:00:00.000' AS DateTime), N'1412984380046')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1210, N'Lea', N'Dostal', 31000, 31000, CAST(N'1984-12-28T00:00:00.000' AS DateTime), N'2812984335123')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1212, N'Josip', N'Zeli�', 47000, 47000, CAST(N'1984-10-01T00:00:00.000' AS DateTime), N'0110984330012')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1213, N'Petra', N'�uljak', 47000, 47000, CAST(N'1984-12-23T00:00:00.000' AS DateTime), N'2312984380051')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1214, N'Drago', N'Bartolin�i�', 40000, 10000, CAST(N'1985-05-26T00:00:00.000' AS DateTime), N'2605985383309')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1216, N'Lidija', N'Leonard', 43000, 43000, CAST(N'1984-11-09T00:00:00.000' AS DateTime), N'0911984330036')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1217, N'Lovre', N'Huk', 52000, 52000, CAST(N'1984-12-11T00:00:00.000' AS DateTime), N'1112984370017')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1218, N'Majo', N'Hemetek', 31000, 31000, CAST(N'1985-06-23T00:00:00.000' AS DateTime), N'2306985340015')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1219, N'Predrag', N'Smir�i�', 21000, 21000, CAST(N'1985-03-17T00:00:00.000' AS DateTime), N'1703985335145')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1221, N'Slavko', N'Prelec', 10000, 10000, CAST(N'1985-06-27T00:00:00.000' AS DateTime), N'2706985362104')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1222, N'Dragutin', N'Ladi�i�', 34000, 34000, CAST(N'1984-12-15T00:00:00.000' AS DateTime), N'1512984391826')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1223, N'Kristina', N'Rubini�', 44000, 10000, CAST(N'1985-07-02T00:00:00.000' AS DateTime), N'0207985335087')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1225, N'Mirko', N'Dubravi�', 32000, 32000, CAST(N'1984-08-05T00:00:00.000' AS DateTime), N'0508984380043')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1226, N'Tin', N'Mikulaj', 42000, 42000, CAST(N'1985-04-11T00:00:00.000' AS DateTime), N'1104985392619')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1227, N'Dra�en', N'Bo�njak', 51000, 51000, CAST(N'1984-11-24T00:00:00.000' AS DateTime), N'2411984340712')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1229, N'Vjeran', N'Brezovec', 44000, 10000, CAST(N'1985-09-24T00:00:00.000' AS DateTime), N'2409985330058')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1230, N'Predrag', N'Buljat', 53000, 53000, CAST(N'1985-01-06T00:00:00.000' AS DateTime), N'0601985320007')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1231, N'Lucija', N'Matija�evi�', 32000, 32000, NULL, N'7862518321834')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1233, N'Renato', N'Stepinac', 51000, 51000, CAST(N'1985-06-03T00:00:00.000' AS DateTime), N'0306985300078')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1234, N'Ksenija', N'Pavi�i�', 21000, 10000, CAST(N'1981-09-15T00:00:00.000' AS DateTime), N'1509981330133')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1235, N'Lea', N'Kamene�ki', 10000, 10000, CAST(N'1985-01-29T00:00:00.000' AS DateTime), N'2901985390007')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1237, N'Luka', N'Frankola', 21000, 21000, CAST(N'1985-08-19T00:00:00.000' AS DateTime), N'1908985320002')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1238, N'Tihomir', N'Crnkovi�', 10000, 10000, CAST(N'1984-06-22T00:00:00.000' AS DateTime), N'2206984339303')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1239, N'Duje', N'�imi�', 20000, 10000, CAST(N'1984-09-07T00:00:00.000' AS DateTime), N'0709984330054')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1241, N'Ljiljana', N'Valenti�', 10000, 20000, CAST(N'1984-10-04T00:00:00.000' AS DateTime), N'0410984330044')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1242, N'Alan', N'Samodol', 20000, 20000, CAST(N'1984-10-12T00:00:00.000' AS DateTime), N'1210984330177')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1243, N'Lidija', N'�iljak', 21000, 21000, CAST(N'1985-01-04T00:00:00.000' AS DateTime), N'0401985330026')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1245, N'Dujo Davor', N'Folnegovi�', 10360, 10000, CAST(N'1984-11-05T00:00:00.000' AS DateTime), N'0511984391518')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1246, N'Roko', N'Novosel', 20340, 10000, CAST(N'1985-04-04T00:00:00.000' AS DateTime), N'0404985335091')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1247, N'Alan', N'Pasanec', 21450, 10000, CAST(N'1984-09-29T00:00:00.000' AS DateTime), N'2909984330071')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1249, N'Maja', N'Beli�', 32280, 10000, CAST(N'1985-06-12T00:00:00.000' AS DateTime), N'1206985330109')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1250, N'Antonijo', N'Franjkovi�', 35420, 10000, CAST(N'1984-11-23T00:00:00.000' AS DateTime), N'2311984360005')
GO
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1251, N'Lucija', N'Br�i�', 47240, 10000, CAST(N'1985-05-07T00:00:00.000' AS DateTime), N'0705985391019')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1253, N'Bo�idar', N'Cetto', 53230, 10000, CAST(N'1985-05-24T00:00:00.000' AS DateTime), N'2405985330205')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1254, N'Edo', N'Mari�', 21420, 21420, CAST(N'1985-02-27T00:00:00.000' AS DateTime), N'2702985390302')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1255, N'Antonijo', N'Duman�i�', 32100, 32100, CAST(N'1984-09-21T00:00:00.000' AS DateTime), N'2109984302141')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1257, N'Adrian', N'Luka�', 44320, 10000, CAST(N'1985-08-17T00:00:00.000' AS DateTime), N'1708985383929')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1258, N'Majo', N'Varga', 10430, 10000, CAST(N'1984-04-21T00:00:00.000' AS DateTime), N'2104984340015')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1259, N'Ljiljana', N'Buli�', 31301, 10000, CAST(N'1984-07-22T00:00:00.000' AS DateTime), N'2207984383304')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1261, N'Silvana', N'Novosel', 47302, 10000, CAST(N'1984-12-11T00:00:00.000' AS DateTime), N'1112984308219')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1262, N'Maja', N'�eremet', 40000, 10000, CAST(N'1984-12-17T00:00:00.000' AS DateTime), N'1712984311413')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1263, N'Davor', N'Ple�ko', 42000, 42000, CAST(N'1985-01-05T00:00:00.000' AS DateTime), N'0501985392729')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1265, N'Marija', N'Barbi�', 31000, 31000, CAST(N'1985-07-12T00:00:00.000' AS DateTime), N'1207985330096')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1266, N'Eduard', N'Petrovi�', 21000, 21000, CAST(N'1984-09-25T00:00:00.000' AS DateTime), N'2509984383927')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1267, N'Adrijan', N'Vukovi�', 44400, 10000, CAST(N'1983-07-12T00:00:00.000' AS DateTime), N'1207983330073')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1268, N'Adrijana', N'Bur�i�', 34000, 10000, CAST(N'1985-05-19T00:00:00.000' AS DateTime), N'1905985320026')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1270, N'Nino', N'Triska', 10000, 10000, CAST(N'1985-04-25T00:00:00.000' AS DateTime), N'2504985334318')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1271, N'Marijan', N'Miro�evi�', 20000, 10000, CAST(N'1985-08-27T00:00:00.000' AS DateTime), N'2708985334008')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1272, N'Emil', N'Serti�', 21000, 31540, CAST(N'1985-04-09T00:00:00.000' AS DateTime), N'0904985820084')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1274, N'Silvestar', N'Sabljak', 21000, 10000, CAST(N'1984-05-15T00:00:00.000' AS DateTime), N'1505984335045')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1275, N'Dubravko', N'Toth', 10000, 10000, CAST(N'1985-07-02T00:00:00.000' AS DateTime), N'0207985361927')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1276, N'Filip', N'Juri�', 20000, 10000, CAST(N'1985-05-04T00:00:00.000' AS DateTime), N'0405985303209')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1278, N'Gordan', N'Dular', 10000, 20000, CAST(N'1984-11-29T00:00:00.000' AS DateTime), N'2911984317209')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1279, N'Martina', N'Krizmani�', 20000, 10000, CAST(N'1985-01-10T00:00:00.000' AS DateTime), N'1001985383921')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1280, N'Marin', N'Juri�', 21000, 10000, CAST(N'1984-10-26T00:00:00.000' AS DateTime), N'2610984311907')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1282, N'Alan', N'Matuna', 20000, 10000, CAST(N'1985-02-01T00:00:00.000' AS DateTime), N'0102985334042')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1283, N'Vinko', N'Padovan', 21000, 10000, CAST(N'1985-04-05T00:00:00.000' AS DateTime), N'0504985335094')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1284, N'Albert', N'Huni�', 10000, 10000, CAST(N'1985-01-08T00:00:00.000' AS DateTime), N'0801985366002')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1286, N'Fran', N'�ef', 21000, 10000, CAST(N'1984-08-21T00:00:00.000' AS DateTime), N'2108984383317')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1287, N'Adrijan', N'Trnski', 10000, 20000, CAST(N'1984-03-11T00:00:00.000' AS DateTime), N'1103984361305')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1288, N'Mirjana', N'Ivekovi�', 20000, 20000, CAST(N'1985-03-01T00:00:00.000' AS DateTime), N'0103985320504')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1290, N'Slavica', N'Pavi�', 20000, 22000, CAST(N'1984-12-20T00:00:00.000' AS DateTime), N'2012984321406')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1291, N'Gordan', N'Ka�ar', 21000, 21000, CAST(N'1984-11-15T00:00:00.000' AS DateTime), N'1511984330125')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1292, N'Juraj', N'Sabljak', 10000, 20000, CAST(N'1985-02-26T00:00:00.000' AS DateTime), N'2602985330075')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1294, N'Iva', N'Dev�i�', 10000, 10000, CAST(N'1985-03-21T00:00:00.000' AS DateTime), N'2103985330067')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1295, N'Frane', N'Plaveti�', 21000, 10000, CAST(N'1985-01-06T00:00:00.000' AS DateTime), N'0601985330138')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1296, N'Slavko', N'Petrekovi�', 10000, 20000, CAST(N'1985-07-23T00:00:00.000' AS DateTime), N'2307985330036')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1298, N'Marinko', N'Horvat', 10000, 20000, CAST(N'1985-04-11T00:00:00.000' AS DateTime), N'1104985390303')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1299, N'Davorka', N'Ili�', 51000, 51000, CAST(N'1985-04-15T00:00:00.000' AS DateTime), N'1504985380055')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1300, N'Alenka', N'Lozi�', 51000, 51000, CAST(N'1985-07-22T00:00:00.000' AS DateTime), N'2207985330193')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1302, N'Lovre', N'Smiljanec', 31000, 10000, CAST(N'1985-04-17T00:00:00.000' AS DateTime), N'1704985381105')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1303, N'Juraj', N'Szirovicza', 31000, 31000, CAST(N'1985-05-23T00:00:00.000' AS DateTime), N'2305985330039')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1304, N'Mario', N'Babi�', 31000, 10000, CAST(N'1984-07-31T00:00:00.000' AS DateTime), N'3107984381518')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1306, N'Helena', N'Octenjak', 47000, 47000, CAST(N'1983-07-14T00:00:00.000' AS DateTime), N'1407983330042')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1307, N'Franjo', N'Zdilar', 47000, 10000, CAST(N'1984-09-16T00:00:00.000' AS DateTime), N'1609984330314')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1308, N'Stipe', N'Pugelnik', 22000, 22000, CAST(N'1984-12-02T00:00:00.000' AS DateTime), N'0212984391814')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1310, N'Marko', N'Matekovi�', 48000, 10000, CAST(N'1985-06-21T00:00:00.000' AS DateTime), N'2106985334006')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1311, N'Goran', N'Remenar', 40000, 40000, CAST(N'1984-05-20T00:00:00.000' AS DateTime), N'2005984390118')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1312, N'Nina', N'Ku�an', 33000, 10000, CAST(N'1985-06-25T00:00:00.000' AS DateTime), N'2506985330144')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1314, N'Marko', N'Suhina', 52000, 52000, CAST(N'1984-10-28T00:00:00.000' AS DateTime), N'2810984330097')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1315, N'Aljo�a', N'Sobol', 31000, 31000, CAST(N'1985-05-11T00:00:00.000' AS DateTime), N'1105985335128')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1316, N'Gorana', N'Frljak', 21000, 21000, CAST(N'1984-05-06T00:00:00.000' AS DateTime), N'0605984334017')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1317, N'Mijo', N'Vuceli�', 49000, 49000, CAST(N'1985-05-23T00:00:00.000' AS DateTime), N'2305985383905')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1319, N'Petra', N'�kolnik', 34000, 10000, CAST(N'1984-11-13T00:00:00.000' AS DateTime), N'1311984330155')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1320, N'Martin', N'Kova�i�', 44000, 10000, CAST(N'1984-09-20T00:00:00.000' AS DateTime), N'2009984311404')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1321, N'Marko', N'Meljanac', 53000, 53000, CAST(N'1985-02-09T00:00:00.000' AS DateTime), N'0902985390011')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1323, N'Ivan', N'Jambrak', 21000, 21000, CAST(N'1984-06-18T00:00:00.000' AS DateTime), N'1806984330251')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1324, N'Petar', N'Nemet', 49000, 49000, CAST(N'1984-11-17T00:00:00.000' AS DateTime), N'1711984335042')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1325, N'Martina', N'Simon', 10000, 10000, CAST(N'1984-02-03T00:00:00.000' AS DateTime), N'0302984383304')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1327, N'Andrej', N'Juri�', 44000, 44000, CAST(N'1983-11-27T00:00:00.000' AS DateTime), N'2711983370016')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1328, N'Renata', N'Vujnovac', 53000, 10000, CAST(N'1984-10-08T00:00:00.000' AS DateTime), N'0810984334302')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1329, N'Mijo', N'Poljak', 10000, 10000, CAST(N'1985-05-26T00:00:00.000' AS DateTime), N'2605985153755')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1331, N'Gordan', N'Lackovi�', 21000, 10000, CAST(N'1984-09-03T00:00:00.000' AS DateTime), N'0309984330249')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1332, N'Svebor', N'Ke��ec', 10000, 10000, CAST(N'1985-02-09T00:00:00.000' AS DateTime), N'0902985383308')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1333, N'Adrijan', N'Fabri�ni', 20000, 10000, CAST(N'1984-09-04T00:00:00.000' AS DateTime), N'0409984391807')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1335, N'Andrija', N'Topolovac', 10000, 10000, CAST(N'1985-04-18T00:00:00.000' AS DateTime), N'1804985391514')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1336, N'Slavko', N'Hrvojevi�', 20000, 20000, CAST(N'1985-06-29T00:00:00.000' AS DateTime), N'2906985350009')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1337, N'Mate', N'Crnjak', 21000, 21000, CAST(N'1985-01-19T00:00:00.000' AS DateTime), N'1901985360076')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1339, N'Andro', N'Popovi�', 21000, 21000, CAST(N'1984-12-24T00:00:00.000' AS DateTime), N'2412984330067')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1340, N'Matej', N'Duki�', 20230, 10000, CAST(N'1985-08-02T00:00:00.000' AS DateTime), N'0208985361006')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1341, N'Sanja', N'Babi�', 21240, 10000, CAST(N'1985-06-28T00:00:00.000' AS DateTime), N'2806985371019')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1343, N'Davorka', N'Kralj', 31530, 10000, CAST(N'1984-01-05T00:00:00.000' AS DateTime), N'0501984330031')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1344, N'Sven', N'Rac', 34330, 34330, CAST(N'1984-12-25T00:00:00.000' AS DateTime), N'2512984330145')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1345, N'Helena', N'Medved', 43290, 10000, CAST(N'1984-12-10T00:00:00.000' AS DateTime), N'1012984320027')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1347, N'Mateo', N'Makovi�', 52100, 52100, CAST(N'1985-02-23T00:00:00.000' AS DateTime), N'2302985363032')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1348, N'Silvana', N'Vrbani�', 10370, 10000, CAST(N'1985-03-19T00:00:00.000' AS DateTime), N'1903985110036')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1349, N'�ime', N'Kova�i�', 22010, 10000, CAST(N'1984-09-19T00:00:00.000' AS DateTime), N'1909984302127')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1351, N'�elimir', N'Babi�', 42250, 10000, CAST(N'1985-02-02T00:00:00.000' AS DateTime), N'0202985330149')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1352, N'Marko', N'Leva�i�', 44410, 10000, CAST(N'1985-07-15T00:00:00.000' AS DateTime), N'1507985388902')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1353, N'Slavica', N'�urak', 34330, 10000, CAST(N'1984-10-13T00:00:00.000' AS DateTime), N'1310984363004')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1355, N'Ante', N'Budimir', 51251, 10000, CAST(N'1985-03-01T00:00:00.000' AS DateTime), N'0103985320023')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1356, N'Matija', N'Bujas', 40000, 40000, CAST(N'1985-04-22T00:00:00.000' AS DateTime), N'2204985391517')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1357, N'Nino', N'Bari�', 31000, 31000, CAST(N'1985-03-25T00:00:00.000' AS DateTime), N'2503985381527')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1359, N'Matija Tvrtko', N'Andri�ek', 10000, 10000, CAST(N'1985-01-22T00:00:00.000' AS DateTime), N'2201985335002')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1360, N'Sun�ica', N'Bo�njak', 21000, 10000, CAST(N'1984-08-25T00:00:00.000' AS DateTime), N'2508984330069')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1361, N'Anto', N'Globlek', 44400, 44400, CAST(N'1984-06-14T00:00:00.000' AS DateTime), N'1406984330053')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1363, N'Matko', N'Grgi�', 32000, 32000, CAST(N'1985-06-08T00:00:00.000' AS DateTime), N'0806985383315')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1364, N'Antun', N'Ferenc', 20000, 10000, CAST(N'1985-01-20T00:00:00.000' AS DateTime), N'2001985302121')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1365, N'Anton', N'Be�i�', 21000, 21000, CAST(N'1985-05-11T00:00:00.000' AS DateTime), N'1105985330025')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1366, N'Vinko', N'Kontak', 10000, 10000, CAST(N'1985-04-09T00:00:00.000' AS DateTime), N'0904985330095')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1368, N'Tea', N'Me�imorec', 10000, 20000, CAST(N'1984-07-17T00:00:00.000' AS DateTime), N'1707984330129')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1369, N'Mato', N'Kobal', 20000, 10000, CAST(N'1984-07-30T00:00:00.000' AS DateTime), N'3007984383313')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1370, N'Tibor', N'Poljanec', 21000, 10000, CAST(N'1984-09-22T00:00:00.000' AS DateTime), N'2209984370027')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1372, N'Adrijan', N'Herceg', 20000, 20000, CAST(N'1985-04-30T00:00:00.000' AS DateTime), N'3004985330071')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1373, N'Antonijo', N'Bili�', 21000, 10000, CAST(N'1984-12-03T00:00:00.000' AS DateTime), N'0312984391218')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1374, N'Tea', N'Mihaljevi�', 10000, 10000, CAST(N'1984-06-28T00:00:00.000' AS DateTime), N'2806984370019')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1376, N'Darko', N'Mrdulja�', 21000, 10000, CAST(N'1985-07-16T00:00:00.000' AS DateTime), N'1607985330152')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1377, N'Davorka', N'�avrak', 10000, 10000, CAST(N'1984-07-31T00:00:00.000' AS DateTime), N'3107984390009')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1378, N'Antonio', N'Pamu�ar', 20000, 10000, CAST(N'1985-05-10T00:00:00.000' AS DateTime), N'1005985330166')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1380, N'Tihomir', N'Medi�', 10000, 10000, CAST(N'1984-10-15T00:00:00.000' AS DateTime), N'1510984330055')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1381, N'Antun', N'Balog', 20000, 20000, CAST(N'1984-08-30T00:00:00.000' AS DateTime), N'3008984335037')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1382, N'Vlatka', N'Relota', 21000, 21000, CAST(N'1985-06-11T00:00:00.000' AS DateTime), N'1106985330115')
GO
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1384, N'Helena', N'Budimir', 21000, 21000, CAST(N'1984-11-18T00:00:00.000' AS DateTime), N'1811984312506')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1385, N'Tin', N'Krajtner', 21000, 10000, CAST(N'1984-12-27T00:00:00.000' AS DateTime), N'2712984330082')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1386, N'Dragan', N'Vidakovi�', 10000, 10000, CAST(N'1984-12-02T00:00:00.000' AS DateTime), N'0212984340003')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1388, N'Antun Ivan', N'�imi�', 10000, 10000, CAST(N'1985-01-09T00:00:00.000' AS DateTime), N'0901985330269')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1389, N'Mihovil', N'Slavi�ek', 21000, 21000, CAST(N'1985-08-12T00:00:00.000' AS DateTime), N'1208985330046')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1390, N'Zdenka', N'Jureta', 10000, 20000, CAST(N'1985-05-10T00:00:00.000' AS DateTime), N'1005985391503')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1392, N'Filip', N'Cigrovski', 51000, 51000, CAST(N'1983-11-27T00:00:00.000' AS DateTime), N'2711983330077')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1393, N'Stjepan', N'Tomi�', 51000, 10000, CAST(N'1985-05-06T00:00:00.000' AS DateTime), N'0605985330013')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1394, N'Augustina', N'�imek', 51000, 10000, CAST(N'1985-01-15T00:00:00.000' AS DateTime), N'1501985320515')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1396, N'Gordana', N'Husak', 31000, 31000, CAST(N'1982-01-18T00:00:00.000' AS DateTime), N'1801982380065')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1397, N'Mijo', N'Legovi�', 31000, 10000, CAST(N'1984-12-28T00:00:00.000' AS DateTime), N'2812984361908')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1398, N'Zdravka', N'Budi�a', 31000, 10000, CAST(N'1985-01-04T00:00:00.000' AS DateTime), N'0401985383929')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1400, N'Miljenko', N'Tu�en', 47000, 10000, CAST(N'1984-07-22T00:00:00.000' AS DateTime), N'2207984391806')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1401, N'Vinko', N'Markovi�', 47000, 47000, CAST(N'1984-10-19T00:00:00.000' AS DateTime), N'1910984334304')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1402, N'Slavko', N'Kav�i�', 10000, 10000, CAST(N'1985-04-15T00:00:00.000' AS DateTime), N'1504985383908')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1404, N'�eljka', N'Puljek', 44000, 44000, CAST(N'1985-03-05T00:00:00.000' AS DateTime), N'0503985334317')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1405, N'Jerko', N'Ogresta', 53000, 53000, CAST(N'1985-01-09T00:00:00.000' AS DateTime), N'0901985302806')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1406, N'Tomica', N'Luli�', 32000, 10000, CAST(N'1984-11-20T00:00:00.000' AS DateTime), N'2011984330107')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1408, N'Mirjana', N'Cesnik', 51000, 10000, CAST(N'1984-06-01T00:00:00.000' AS DateTime), N'0106984330014')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1409, N'Berislav', N'Crnkovi�', 22000, 22000, CAST(N'1985-04-05T00:00:00.000' AS DateTime), N'0504985330263')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1410, N'�eljka', N'Koren', 35000, 35000, CAST(N'1985-03-12T00:00:00.000' AS DateTime), N'1203985334304')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1412, N'Hana', N'Birki�', 40000, 40000, CAST(N'1984-08-10T00:00:00.000' AS DateTime), N'1008984302118')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1413, N'Antun Ivan', N'Gali�', 33000, 10000, CAST(N'1985-04-20T00:00:00.000' AS DateTime), N'2004985301006')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1414, N'Tin', N'�ipek', 43000, 43000, CAST(N'1984-11-24T00:00:00.000' AS DateTime), N'2411984330174')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1415, N'Tomislav', N'Kova�i�', 52000, 52000, CAST(N'1984-06-15T00:00:00.000' AS DateTime), N'1506984370008')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1417, N'Toni', N'Merlak', 35000, 35000, CAST(N'1985-04-13T00:00:00.000' AS DateTime), N'1304985310024')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1418, N'Davor', N'Roketinec', 48000, 10000, CAST(N'1984-11-05T00:00:00.000' AS DateTime), N'0511984330035')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1419, N'Mirko', N'Bre�i�', 40000, 40000, CAST(N'1984-10-29T00:00:00.000' AS DateTime), N'2910984383906')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1421, N'Ljiljana', N'Joki�', 43000, 10000, CAST(N'1985-03-16T00:00:00.000' AS DateTime), N'1603985383315')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1422, N'Helena', N'Crnkovi�', 52000, 52000, CAST(N'1985-04-12T00:00:00.000' AS DateTime), N'1204985339016')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1423, N'Vjeran', N'Naki�', 20000, 10000, CAST(N'1984-07-28T00:00:00.000' AS DateTime), N'2807984311904')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1425, N'Martina', N'Petrinec', 10000, 20000, CAST(N'1984-10-24T00:00:00.000' AS DateTime), N'2410984334004')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1426, N'Vanja', N'Bona�i�', 20000, 10000, CAST(N'1985-02-14T00:00:00.000' AS DateTime), N'1402985391809')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1427, N'Hrvoje', N'Juri�i�', 21000, 21000, CAST(N'1985-03-06T00:00:00.000' AS DateTime), N'0603985330122')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1429, N'Karla', N'Kafadar', 20000, 20000, CAST(N'1984-08-13T00:00:00.000' AS DateTime), N'1308984370016')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1430, N'�elimir', N'Pintar', 21000, 10000, CAST(N'1984-10-24T00:00:00.000' AS DateTime), N'2410984320029')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1431, N'Franjo', N'Bera�', 10000, 10000, CAST(N'1985-04-29T00:00:00.000' AS DateTime), N'2904985370026')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1433, N'Igor', N'Bogati', 10380, 10000, CAST(N'1984-11-07T00:00:00.000' AS DateTime), N'0711984385009')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1434, N'Mijo', N'Vrhoci', 21210, 10000, CAST(N'1985-03-09T00:00:00.000' AS DateTime), N'0903985330211')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1435, N'Alan', N'Franc', 22020, 10000, CAST(N'1984-09-24T00:00:00.000' AS DateTime), N'2409984392103')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1437, N'Miro', N'Pugar', 34310, 10000, CAST(N'1984-07-02T00:00:00.000' AS DateTime), N'0207984335112')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1438, N'Vedran', N'Me�tri�', 42240, 42240, CAST(N'1985-04-07T00:00:00.000' AS DateTime), N'0704985368003')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1439, N'Josip', N'�kvorc', 47300, 10000, CAST(N'1985-01-18T00:00:00.000' AS DateTime), N'1801985392106')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1441, N'Majo', N'Meglaj', 47220, 10000, CAST(N'1984-06-09T00:00:00.000' AS DateTime), N'0906984383906')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1442, N'Boris', N'Jertec', 21450, 10000, CAST(N'1984-02-29T00:00:00.000' AS DateTime), N'2902984330072')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1443, N'Nata�a', N'Cerjan', 33520, 33405, CAST(N'1984-08-28T00:00:00.000' AS DateTime), N'2808984335042')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1445, N'Niko', N'Grbi�', 44400, 10000, CAST(N'1985-01-04T00:00:00.000' AS DateTime), N'0401985330196')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1446, N'Antonijo', N'Nikoli�', 20210, 10000, CAST(N'1984-09-06T00:00:00.000' AS DateTime), N'0609984330247')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1447, N'Vid', N'Markulin�i�', 31531, 10000, CAST(N'1984-10-14T00:00:00.000' AS DateTime), N'1410984330114')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1449, N'Nata�a', N'Osrede�ki', 51211, 10000, CAST(N'1985-05-23T00:00:00.000' AS DateTime), N'2305985303534')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1450, N'Borislav', N'Gobin', 42000, 42000, CAST(N'1985-08-04T00:00:00.000' AS DateTime), N'0408985330169')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1451, N'Mirko', N'Kadi�', 31000, 10000, CAST(N'1984-09-15T00:00:00.000' AS DateTime), N'1509984382604')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1453, N'Petra', N'Ti�lar', 31000, 31000, CAST(N'1984-06-30T00:00:00.000' AS DateTime), N'3006984335183')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1454, N'Bo�idar', N'Sesar', 10000, 10000, CAST(N'1983-04-29T00:00:00.000' AS DateTime), N'2904983383316')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1455, N'Iva', N'Hafner', 47300, 10000, CAST(N'1984-09-18T00:00:00.000' AS DateTime), N'1809984340007')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1457, N'Borna', N'Burtina', 34000, 34000, CAST(N'1985-06-04T00:00:00.000' AS DateTime), N'0406985380077')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1458, N'Davor', N'Kroflin', 21000, 21000, CAST(N'1984-09-18T00:00:00.000' AS DateTime), N'1809984383124')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1459, N'Predrag', N'Vlah', 10000, 10000, CAST(N'1984-11-29T00:00:00.000' AS DateTime), N'2911984330044')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1461, N'Nenad', N'Toth', 21000, 21000, CAST(N'1985-04-08T00:00:00.000' AS DateTime), N'0804985380005')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1462, N'Vilim', N'�iv�i�', 20000, 10000, CAST(N'1984-11-10T00:00:00.000' AS DateTime), N'1011984370839')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1463, N'Ivan', N'Balenovi�', 21000, 10000, CAST(N'1983-08-16T00:00:00.000' AS DateTime), N'1608983335065')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1464, N'Tihomir', N'Fizir', 10000, 10000, CAST(N'1985-05-06T00:00:00.000' AS DateTime), N'0605985330058')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1466, N'Neven', N'Rube�a', 21000, 10000, CAST(N'1985-05-23T00:00:00.000' AS DateTime), N'2305985335025')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1467, N'Tea', N'Stjepanovi�', 10000, 10000, CAST(N'1984-10-27T00:00:00.000' AS DateTime), N'2710984330142')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1468, N'Ivana', N'Kuzma', 20000, 20000, CAST(N'1985-07-09T00:00:00.000' AS DateTime), N'0907985335135')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1470, N'Dubravko', N'Bartoli�', 10000, 10000, CAST(N'1984-11-16T00:00:00.000' AS DateTime), N'1611984392608')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1471, N'Bo�idar', N'Je�i�', 20000, 10000, CAST(N'1984-11-26T00:00:00.000' AS DateTime), N'2611984321729')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1472, N'Ivana', N'Murani�', 21000, 21000, CAST(N'1985-08-07T00:00:00.000' AS DateTime), N'0708985381113')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1474, N'Vjekoslav', N'Lackovi�', 20000, 10000, CAST(N'1984-10-24T00:00:00.000' AS DateTime), N'2410984383901')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1475, N'Branimir', N'Bolfek', 21000, 10000, CAST(N'1984-09-23T00:00:00.000' AS DateTime), N'2309984330054')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1476, N'Zlatko', N'Per�i�', 10000, 10000, CAST(N'1985-02-18T00:00:00.000' AS DateTime), N'1802985301803')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1478, N'Vid', N'Kuli�i�', 10000, 10000, CAST(N'1985-04-03T00:00:00.000' AS DateTime), N'0304985380005')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1479, N'Branko', N'Car', 10000, 20000, CAST(N'1985-07-19T00:00:00.000' AS DateTime), N'1907985302136')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1480, N'Vjeran', N'Stipani�ev', 21000, 21000, CAST(N'1984-12-29T00:00:00.000' AS DateTime), N'2912984330052')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1482, N'Iva', N'Klarin', 21000, 21000, CAST(N'1984-11-10T00:00:00.000' AS DateTime), N'1011984383918')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1483, N'Ivica', N'�u�kovi�', 10000, 35400, CAST(N'1984-12-20T00:00:00.000' AS DateTime), N'2012984335149')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1484, N'Antun Ivan', N'Pu�ar', 21000, 21000, CAST(N'1985-03-13T00:00:00.000' AS DateTime), N'1303985390025')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1486, N'Iva', N'Kopjar', 21000, 21000, CAST(N'1985-09-06T00:00:00.000' AS DateTime), N'0609985380028')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1487, N'Juraj', N'Valjak', 51000, 10000, CAST(N'1984-04-23T00:00:00.000' AS DateTime), N'2304984391802')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1488, N'Davor', N'Dilber', 51000, 51000, CAST(N'1984-10-03T00:00:00.000' AS DateTime), N'0310984330019')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1490, N'Bruno', N'Hundak', 31000, 10000, CAST(N'1984-12-21T00:00:00.000' AS DateTime), N'2112984300052')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1491, N'Jakov', N'Bumbar', 31000, 31000, CAST(N'1985-01-15T00:00:00.000' AS DateTime), N'1501985330061')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1492, N'Ivan', N'Kordi�', 31000, 31000, CAST(N'1985-04-12T00:00:00.000' AS DateTime), N'1204985388117')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1494, N'Franjo', N'Bla�evi�', 31000, 10000, CAST(N'1985-01-21T00:00:00.000' AS DateTime), N'2101985301004')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1495, N'Lovre', N'�imek', 47000, 21000, CAST(N'1984-11-14T00:00:00.000' AS DateTime), N'1411984303204')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1496, N'Cvijeta', N'Erceg', 32000, 10000, CAST(N'1985-08-16T00:00:00.000' AS DateTime), N'1608985390075')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1498, N'Janko', N'Jakopovi�', 51000, 51000, CAST(N'1984-07-06T00:00:00.000' AS DateTime), N'0607984307828')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1499, N'Vlaho', N'Rogini�', 22000, 10000, CAST(N'1985-04-07T00:00:00.000' AS DateTime), N'0704985340301')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1500, N'Dalibor', N'Grade�ak', 35000, 35000, CAST(N'1985-05-27T00:00:00.000' AS DateTime), N'2705985311411')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1502, N'Josip', N'Nikl', 40000, 10000, CAST(N'1984-09-30T00:00:00.000' AS DateTime), N'3009984383005')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1503, N'Majo', N'Posavec', 33000, 33000, CAST(N'1984-09-03T00:00:00.000' AS DateTime), N'0309984330118')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1504, N'Josip', N'Poljak', 43000, 43000, CAST(N'1984-12-06T00:00:00.000' AS DateTime), N'0612984391807')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1506, N'Damir', N'Bukovi�', 31000, 31000, CAST(N'1984-12-08T00:00:00.000' AS DateTime), N'0812984383608')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1507, N'Mijo', N'Bitar', 21000, 21000, CAST(N'1984-12-15T00:00:00.000' AS DateTime), N'1512984330055')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1508, N'Vlasta', N'Cikovi�', 49000, 10000, CAST(N'1985-04-03T00:00:00.000' AS DateTime), N'0304985330026')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1510, N'Vlatka', N'�urkovi�', 34000, 34000, CAST(N'1984-12-19T00:00:00.000' AS DateTime), N'1912984360007')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1511, N'Mirko', N'Rech', 43000, 10000, CAST(N'1984-04-12T00:00:00.000' AS DateTime), N'1204984321701')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1512, N'Josip', N'Horvat', 52000, 10000, CAST(N'1985-08-05T00:00:00.000' AS DateTime), N'0508985383312')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1513, N'Josip', N'Ivanovi�', 31000, 31000, CAST(N'1984-07-30T00:00:00.000' AS DateTime), N'3007984370022')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1515, N'Predrag', N'Fugaj', 49000, 49000, CAST(N'1984-08-31T00:00:00.000' AS DateTime), N'3108984334004')
GO
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1516, N'Vlatko', N'Bedenikovi�', 10000, 10000, CAST(N'1985-01-27T00:00:00.000' AS DateTime), N'2701985341117')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1517, N'Daniel', N'Kamenar', 20000, 10000, CAST(N'1984-07-05T00:00:00.000' AS DateTime), N'0507984312503')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1519, N'Slavko', N'Prsta�i�', 10000, 20000, CAST(N'1984-01-15T00:00:00.000' AS DateTime), N'1501984330074')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1520, N'Pero', N'Peric', 10000, 10000, CAST(N'1980-01-01T00:00:00.000' AS DateTime), N'1501984339974')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1521, N'Marica', N'Maric', 10000, 10000, CAST(N'2000-07-13T00:00:00.000' AS DateTime), N'1234567891011')
INSERT [dbo].[stud] ([mbrStud], [imeStud], [prezStud], [pbrRod], [pbrStan], [datRodStud], [jmbgStud]) VALUES (1523, N'test', N'testic', 10000, 10000, CAST(N'2000-05-05T00:00:00.000' AS DateTime), N'1234567891011')
SET IDENTITY_INSERT [dbo].[stud] OFF
INSERT [dbo].[zupanija] ([sifZupanija], [nazZupanija]) VALUES (0, N'Nepoznata �upanija                      ')
INSERT [dbo].[zupanija] ([sifZupanija], [nazZupanija]) VALUES (1, N'Zagreba�ka                              ')
INSERT [dbo].[zupanija] ([sifZupanija], [nazZupanija]) VALUES (2, N'Krapinsko-zagorska                      ')
INSERT [dbo].[zupanija] ([sifZupanija], [nazZupanija]) VALUES (3, N'Sisa�ko-moslava�ka                      ')
INSERT [dbo].[zupanija] ([sifZupanija], [nazZupanija]) VALUES (4, N'Karlova�ka                              ')
INSERT [dbo].[zupanija] ([sifZupanija], [nazZupanija]) VALUES (5, N'Vara�dinska                             ')
INSERT [dbo].[zupanija] ([sifZupanija], [nazZupanija]) VALUES (6, N'Koprivni�ko-kri�eva�ka                  ')
INSERT [dbo].[zupanija] ([sifZupanija], [nazZupanija]) VALUES (7, N'Bjelovarsko-bilogorska                  ')
INSERT [dbo].[zupanija] ([sifZupanija], [nazZupanija]) VALUES (8, N'Primorsko-goranska                      ')
INSERT [dbo].[zupanija] ([sifZupanija], [nazZupanija]) VALUES (9, N'Li�ko-senjska                           ')
INSERT [dbo].[zupanija] ([sifZupanija], [nazZupanija]) VALUES (10, N'Viroviti�ko-podravska                   ')
INSERT [dbo].[zupanija] ([sifZupanija], [nazZupanija]) VALUES (11, N'Po�e�ko-slavonska                       ')
INSERT [dbo].[zupanija] ([sifZupanija], [nazZupanija]) VALUES (12, N'Brodsko-posavska                        ')
INSERT [dbo].[zupanija] ([sifZupanija], [nazZupanija]) VALUES (13, N'Zadarska                                ')
INSERT [dbo].[zupanija] ([sifZupanija], [nazZupanija]) VALUES (14, N'Osje�ko-baranjska                       ')
INSERT [dbo].[zupanija] ([sifZupanija], [nazZupanija]) VALUES (15, N'�ibensko-kninska                        ')
INSERT [dbo].[zupanija] ([sifZupanija], [nazZupanija]) VALUES (16, N'Vukovarsko-srijemska                    ')
INSERT [dbo].[zupanija] ([sifZupanija], [nazZupanija]) VALUES (17, N'Splitsko-dalmatinska                    ')
INSERT [dbo].[zupanija] ([sifZupanija], [nazZupanija]) VALUES (18, N'Istarska                                ')
INSERT [dbo].[zupanija] ([sifZupanija], [nazZupanija]) VALUES (19, N'Dubrova�ko-neretvanska                  ')
INSERT [dbo].[zupanija] ([sifZupanija], [nazZupanija]) VALUES (20, N'Me�imurska                              ')
INSERT [dbo].[zupanija] ([sifZupanija], [nazZupanija]) VALUES (21, N'Grad Zagreb                             ')
ALTER TABLE [dbo].[orgjed]  WITH CHECK ADD  CONSTRAINT [FK_orgjed_orgjed] FOREIGN KEY([sifNadorgjed])
REFERENCES [dbo].[orgjed] ([sifOrgjed])
GO
ALTER TABLE [dbo].[orgjed] CHECK CONSTRAINT [FK_orgjed_orgjed]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "v_mjesta_bez_nastavnika"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 196
               Right = 309
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_mjes_bez_nast_na_slovo_n'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_mjes_bez_nast_na_slovo_n'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[15] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "mjesto"
            Begin Extent = 
               Top = 39
               Left = 149
               Bottom = 153
               Right = 319
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "nastavnik"
            Begin Extent = 
               Top = 22
               Left = 469
               Bottom = 184
               Right = 703
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_mjesta_bez_nastavnika'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_mjesta_bez_nastavnika'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "i"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "n"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "s"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 136
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "m1"
            Begin Extent = 
               Top = 6
               Left = 662
               Bottom = 119
               Right = 832
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "z1"
            Begin Extent = 
               Top = 120
               Left = 662
               Bottom = 216
               Right = 832
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "m2"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 251
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "z2"
            Begin Extent = 
               Top = 138
               Left = 246
               Bottom = 234
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_nastavnik_mjesto_student'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_nastavnik_mjesto_student'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_nastavnik_mjesto_student'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "o1"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 119
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "o2"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 119
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_orgjed_ukupno_jedinica'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_orgjed_ukupno_jedinica'
GO
USE [master]
GO
ALTER DATABASE [Fakultet] SET  READ_WRITE 
GO
