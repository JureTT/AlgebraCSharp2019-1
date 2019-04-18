USE [master]
GO
/****** Object:  Database [Fakultet]    Script Date: 18.4.2019. 16:53:30 ******/
CREATE DATABASE [Fakultet]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Fakultet', FILENAME = N'D:\Code\AlgebraCSharp2019-1\baza\Fakultet.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Fakultet_log', FILENAME = N'D:\Code\AlgebraCSharp2019-1\baza\Fakultet_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
/****** Object:  Table [dbo].[mjesto]    Script Date: 18.4.2019. 16:53:31 ******/
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
/****** Object:  View [dbo].[v_nastavnici_mjesto]    Script Date: 18.4.2019. 16:53:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[v_nastavnici_mjesto] as select [pbr]
      ,[nazMjesto]
      ,[sifZupanija]
  FROM [dbo].[mjesto]
GO
/****** Object:  Table [dbo].[orgjed]    Script Date: 18.4.2019. 16:53:31 ******/
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
/****** Object:  View [dbo].[v_orgjed_ukupno_jedinica(self_join)]    Script Date: 18.4.2019. 16:53:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_orgjed_ukupno_jedinica(self_join)]
AS
SELECT        TOP (100) PERCENT o1.sifOrgjed, o1.nazOrgjed, COUNT(o2.nazOrgjed) AS 'broj zavoda'
FROM            dbo.orgjed AS o1 LEFT OUTER JOIN
                         dbo.orgjed AS o2 ON o1.sifOrgjed = o2.sifNadorgjed
GROUP BY o1.sifOrgjed, o1.nazOrgjed
HAVING        (COUNT(o2.nazOrgjed) <> 0)
ORDER BY 'BROJ ZAVODA' DESC
GO
/****** Object:  View [dbo].[v_mjesta_nastavnika_ sa_slovom_B]    Script Date: 18.4.2019. 16:53:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_mjesta_nastavnika_ sa_slovom_B]
AS
SELECT        nazMjesto
FROM            dbo.v_nastavnici_mjesto
WHERE        (nazMjesto LIKE N'B%')
GO
/****** Object:  Table [dbo].[zupanija]    Script Date: 18.4.2019. 16:53:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zupanija](
	[sifZupanija] [smallint] NOT NULL,
	[nazZupanija] [nvarchar](40) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[nastavnik]    Script Date: 18.4.2019. 16:53:31 ******/
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
/****** Object:  Table [dbo].[ispit]    Script Date: 18.4.2019. 16:53:31 ******/
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
/****** Object:  Table [dbo].[stud]    Script Date: 18.4.2019. 16:53:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stud](
	[mbrStud] [int] IDENTITY(1520,1) NOT NULL,
	[imeStud] [nvarchar](25) NOT NULL,
	[prezStud] [nvarchar](25) NOT NULL,
	[pbrRod] [int] NULL,
	[pbrStan] [int] NOT NULL,
	[datRodStud] [datetime] NULL,
	[jmbgStud] [nvarchar](13) NULL,
 CONSTRAINT [PK_stud] PRIMARY KEY CLUSTERED 
(
	[mbrStud] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_komplicirani_view_Davorka_Emil]    Script Date: 18.4.2019. 16:53:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_komplicirani_view_Davorka_Emil]
AS
SELECT        n.sifNastavnik, n.imeNastavnik, n.prezNastavnik, n.pbrStan, n.sifOrgjed, n.koef, i.mbrStud, i.sifPred, i.sifNastavnik AS Expr1, i.datIspit, i.ocjena, s.mbrStud AS Expr2, s.imeStud, s.prezStud, s.pbrRod, s.pbrStan AS Expr3, 
                         s.datRodStud, s.jmbgStud, m1.pbr, m1.nazMjesto, m1.sifZupanija, z1.sifZupanija AS Expr4, z1.nazZupanija, m2.pbr AS Expr5, m2.nazMjesto AS Expr6, m2.sifZupanija AS Expr7, z2.sifZupanija AS Expr8, 
                         z2.nazZupanija AS Expr9
FROM            dbo.nastavnik AS n LEFT OUTER JOIN
                         dbo.ispit AS i ON n.sifNastavnik = i.sifNastavnik INNER JOIN
                         dbo.stud AS s ON i.mbrStud = s.mbrStud LEFT OUTER JOIN
                         dbo.mjesto AS m1 ON m1.pbr = n.pbrStan LEFT OUTER JOIN
                         dbo.zupanija AS z1 ON z1.sifZupanija = m1.sifZupanija LEFT OUTER JOIN
                         dbo.mjesto AS m2 ON m2.pbr = s.pbrStan AND m1.sifZupanija = m2.sifZupanija LEFT OUTER JOIN
                         dbo.zupanija AS z2 ON z2.sifZupanija = m2.sifZupanija
WHERE        (m1.pbr <> m2.pbr)
GO
/****** Object:  View [dbo].[v_nesto_nastavnicima]    Script Date: 18.4.2019. 16:53:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_nesto_nastavnicima]
AS
SELECT        dbo.nastavnik.imeNastavnik, dbo.nastavnik.prezNastavnik, dbo.mjesto.nazMjesto
FROM            dbo.mjesto RIGHT OUTER JOIN
                         dbo.nastavnik ON dbo.mjesto.pbr = dbo.nastavnik.pbrStan
WHERE        (dbo.nastavnik.imeNastavnik IS NULL)
GO
/****** Object:  Table [dbo].[dvorana]    Script Date: 18.4.2019. 16:53:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dvorana](
	[oznDvorana] [nvarchar](5) NOT NULL,
	[kapacitet] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[nova_tablica]    Script Date: 18.4.2019. 16:53:31 ******/
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
/****** Object:  Table [dbo].[pred]    Script Date: 18.4.2019. 16:53:31 ******/
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
/****** Object:  Table [dbo].[rezervacija]    Script Date: 18.4.2019. 16:53:31 ******/
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
               Top = 144
               Left = 672
               Bottom = 240
               Right = 842
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
         End' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_komplicirani_view_Davorka_Emil'
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_komplicirani_view_Davorka_Emil'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_komplicirani_view_Davorka_Emil'
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
         Begin Table = "v_nastavnici_mjesto"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 119
               Right = 208
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_mjesta_nastavnika_ sa_slovom_B'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_mjesta_nastavnika_ sa_slovom_B'
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
         Begin Table = "mjesto"
            Begin Extent = 
               Top = 48
               Left = 379
               Bottom = 161
               Right = 549
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "nastavnik"
            Begin Extent = 
               Top = 42
               Left = 124
               Bottom = 172
               Right = 294
            End
            DisplayFlags = 280
            TopColumn = 2
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_nesto_nastavnicima'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_nesto_nastavnicima'
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_orgjed_ukupno_jedinica(self_join)'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_orgjed_ukupno_jedinica(self_join)'
GO
USE [master]
GO
ALTER DATABASE [Fakultet] SET  READ_WRITE 
GO
