USE [master]
GO
/****** Object:  Database [kuharica]    Script Date: 18.4.2019. 16:54:07 ******/
CREATE DATABASE [kuharica]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'kuharica', FILENAME = N'D:\Code\AlgebraCSharp2019-1\baza\kuharica.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'kuharica_log', FILENAME = N'D:\Code\AlgebraCSharp2019-1\baza\kuharica_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [kuharica] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [kuharica].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [kuharica] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [kuharica] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [kuharica] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [kuharica] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [kuharica] SET ARITHABORT OFF 
GO
ALTER DATABASE [kuharica] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [kuharica] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [kuharica] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [kuharica] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [kuharica] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [kuharica] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [kuharica] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [kuharica] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [kuharica] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [kuharica] SET  DISABLE_BROKER 
GO
ALTER DATABASE [kuharica] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [kuharica] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [kuharica] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [kuharica] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [kuharica] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [kuharica] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [kuharica] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [kuharica] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [kuharica] SET  MULTI_USER 
GO
ALTER DATABASE [kuharica] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [kuharica] SET DB_CHAINING OFF 
GO
ALTER DATABASE [kuharica] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [kuharica] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [kuharica] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [kuharica] SET QUERY_STORE = OFF
GO
USE [kuharica]
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
USE [kuharica]
GO
/****** Object:  Table [dbo].[sastojci]    Script Date: 18.4.2019. 16:54:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sastojci](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[sastojak] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_sastojci] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[recepti]    Script Date: 18.4.2019. 16:54:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[recepti](
	[id_jela] [int] NOT NULL,
	[id_sastojka] [int] NOT NULL,
	[kolicina] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[jela]    Script Date: 18.4.2019. 16:54:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[jela](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[naziv] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_jela] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_kuharica]    Script Date: 18.4.2019. 16:54:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_kuharica]
AS
SELECT        dbo.jela.id, dbo.jela.naziv, dbo.recepti.id_jela, dbo.recepti.id_sastojka, dbo.recepti.kolicina, dbo.sastojci.id AS Expr1, dbo.sastojci.sastojak
FROM            dbo.jela LEFT OUTER JOIN
                         dbo.recepti ON dbo.jela.id = dbo.recepti.id_jela LEFT OUTER JOIN
                         dbo.sastojci ON dbo.sastojci.id = dbo.recepti.id_sastojka
GO
ALTER TABLE [dbo].[recepti]  WITH CHECK ADD  CONSTRAINT [FK_recept_jela] FOREIGN KEY([id_jela])
REFERENCES [dbo].[jela] ([id])
GO
ALTER TABLE [dbo].[recepti] CHECK CONSTRAINT [FK_recept_jela]
GO
ALTER TABLE [dbo].[recepti]  WITH CHECK ADD  CONSTRAINT [FK_recept_sastojci] FOREIGN KEY([id_sastojka])
REFERENCES [dbo].[sastojci] ([id])
GO
ALTER TABLE [dbo].[recepti] CHECK CONSTRAINT [FK_recept_sastojci]
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
         Begin Table = "jela"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 102
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "recepti"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 119
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "sastojci"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 102
               Right = 624
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_kuharica'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_kuharica'
GO
USE [master]
GO
ALTER DATABASE [kuharica] SET  READ_WRITE 
GO
