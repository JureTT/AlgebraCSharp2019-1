USE [master]
GO
/****** Object:  Database [dbAlgebra]    Script Date: 18.4.2019. 16:52:46 ******/
CREATE DATABASE [dbAlgebra]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbAlgebra', FILENAME = N'D:\Code\dbAlgebra.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dbAlgebra_log', FILENAME = N'D:\Code\dbAlgebra_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [dbAlgebra] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbAlgebra].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbAlgebra] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbAlgebra] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbAlgebra] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbAlgebra] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbAlgebra] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbAlgebra] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dbAlgebra] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbAlgebra] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbAlgebra] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbAlgebra] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbAlgebra] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbAlgebra] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbAlgebra] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbAlgebra] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbAlgebra] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dbAlgebra] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbAlgebra] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbAlgebra] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbAlgebra] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbAlgebra] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbAlgebra] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbAlgebra] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbAlgebra] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [dbAlgebra] SET  MULTI_USER 
GO
ALTER DATABASE [dbAlgebra] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbAlgebra] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbAlgebra] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbAlgebra] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dbAlgebra] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [dbAlgebra] SET QUERY_STORE = OFF
GO
USE [dbAlgebra]
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
USE [dbAlgebra]
GO
/****** Object:  Table [dbo].[tblPolaznici]    Script Date: 18.4.2019. 16:52:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPolaznici](
	[IdPolaznik] [int] IDENTITY(1,1) NOT NULL,
	[Ime] [nvarchar](50) NULL,
	[Prezime] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdPolaznik] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTecajevi]    Script Date: 18.4.2019. 16:52:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTecajevi](
	[idTecaj] [int] IDENTITY(1,1) NOT NULL,
	[Naziv] [nvarchar](50) NOT NULL,
	[Opis] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[idTecaj] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [dbAlgebra] SET  READ_WRITE 
GO
