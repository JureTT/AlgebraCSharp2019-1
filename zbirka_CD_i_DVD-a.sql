USE [master]
GO
/****** Object:  Database [zbrika_CD_i_DVD-a]    Script Date: 18.4.2019. 17:04:56 ******/
CREATE DATABASE [zbrika_CD_i_DVD-a]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'zbrika_CD_i_DVD-a', FILENAME = N'D:\Code\AlgebraCSharp2019-1\baza\zbrika_CD_i_DVD-a.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'zbrika_CD_i_DVD-a_log', FILENAME = N'D:\Code\AlgebraCSharp2019-1\baza\zbrika_CD_i_DVD-a_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [zbrika_CD_i_DVD-a] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [zbrika_CD_i_DVD-a].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [zbrika_CD_i_DVD-a] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [zbrika_CD_i_DVD-a] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [zbrika_CD_i_DVD-a] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [zbrika_CD_i_DVD-a] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [zbrika_CD_i_DVD-a] SET ARITHABORT OFF 
GO
ALTER DATABASE [zbrika_CD_i_DVD-a] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [zbrika_CD_i_DVD-a] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [zbrika_CD_i_DVD-a] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [zbrika_CD_i_DVD-a] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [zbrika_CD_i_DVD-a] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [zbrika_CD_i_DVD-a] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [zbrika_CD_i_DVD-a] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [zbrika_CD_i_DVD-a] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [zbrika_CD_i_DVD-a] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [zbrika_CD_i_DVD-a] SET  DISABLE_BROKER 
GO
ALTER DATABASE [zbrika_CD_i_DVD-a] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [zbrika_CD_i_DVD-a] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [zbrika_CD_i_DVD-a] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [zbrika_CD_i_DVD-a] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [zbrika_CD_i_DVD-a] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [zbrika_CD_i_DVD-a] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [zbrika_CD_i_DVD-a] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [zbrika_CD_i_DVD-a] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [zbrika_CD_i_DVD-a] SET  MULTI_USER 
GO
ALTER DATABASE [zbrika_CD_i_DVD-a] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [zbrika_CD_i_DVD-a] SET DB_CHAINING OFF 
GO
ALTER DATABASE [zbrika_CD_i_DVD-a] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [zbrika_CD_i_DVD-a] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [zbrika_CD_i_DVD-a] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [zbrika_CD_i_DVD-a] SET QUERY_STORE = OFF
GO
USE [zbrika_CD_i_DVD-a]
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
USE [zbrika_CD_i_DVD-a]
GO
/****** Object:  Table [dbo].[posudbe]    Script Date: 18.4.2019. 17:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[posudbe](
	[id_prijatelja] [int] NOT NULL,
	[id_medija] [int] NOT NULL,
	[datum_posudbe] [date] NOT NULL,
	[datum_vracanja] [date] NULL,
 CONSTRAINT [PK_posudbe] PRIMARY KEY CLUSTERED 
(
	[id_prijatelja] ASC,
	[id_medija] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[prijatelji]    Script Date: 18.4.2019. 17:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[prijatelji](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ime] [nvarchar](50) NOT NULL,
	[prezime] [nvarchar](50) NULL,
 CONSTRAINT [PK__prijatel__3213E83F3A214084] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mediji]    Script Date: 18.4.2019. 17:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mediji](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[naziv] [nvarchar](50) NOT NULL,
	[zapis] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK__mediji__3213E83FCDFB959B] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_dani_kasnjenja]    Script Date: 18.4.2019. 17:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_dani_kasnjenja]
AS
SELECT        p.ime, p.prezime AS 'Ime i prezime', DATEDIFF(DAY, ps.datum_posudbe, GETDATE()) AS 'Dana'
FROM            dbo.prijatelji AS p INNER JOIN
                         dbo.posudbe AS ps ON p.id = ps.id_prijatelja INNER JOIN
                         dbo.mediji AS m ON ps.id_medija = m.id
WHERE        (ps.datum_vracanja IS NULL)
GO
ALTER TABLE [dbo].[posudbe]  WITH CHECK ADD  CONSTRAINT [FK__posudbe__id_medi__276EDEB3] FOREIGN KEY([id_medija])
REFERENCES [dbo].[mediji] ([id])
GO
ALTER TABLE [dbo].[posudbe] CHECK CONSTRAINT [FK__posudbe__id_medi__276EDEB3]
GO
ALTER TABLE [dbo].[posudbe]  WITH CHECK ADD  CONSTRAINT [FK__posudbe__id_prij__267ABA7A] FOREIGN KEY([id_prijatelja])
REFERENCES [dbo].[prijatelji] ([id])
GO
ALTER TABLE [dbo].[posudbe] CHECK CONSTRAINT [FK__posudbe__id_prij__267ABA7A]
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
         Begin Table = "p"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 119
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "m"
            Begin Extent = 
               Top = 6
               Left = 459
               Bottom = 119
               Right = 629
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ps"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 421
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_dani_kasnjenja'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_dani_kasnjenja'
GO
USE [master]
GO
ALTER DATABASE [zbrika_CD_i_DVD-a] SET  READ_WRITE 
GO
