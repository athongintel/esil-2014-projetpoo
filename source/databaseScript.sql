USE [master]
GO
/****** Object:  Database [GesLoc]    Script Date: 12/26/2014 22:01:48 ******/
CREATE DATABASE [GesLoc] ON  PRIMARY 
( NAME = N'GesLoc', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\GesLoc.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'GesLoc_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\GesLoc_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [GesLoc] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GesLoc].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GesLoc] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [GesLoc] SET ANSI_NULLS OFF
GO
ALTER DATABASE [GesLoc] SET ANSI_PADDING OFF
GO
ALTER DATABASE [GesLoc] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [GesLoc] SET ARITHABORT OFF
GO
ALTER DATABASE [GesLoc] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [GesLoc] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [GesLoc] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [GesLoc] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [GesLoc] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [GesLoc] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [GesLoc] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [GesLoc] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [GesLoc] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [GesLoc] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [GesLoc] SET  DISABLE_BROKER
GO
ALTER DATABASE [GesLoc] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [GesLoc] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [GesLoc] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [GesLoc] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [GesLoc] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [GesLoc] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [GesLoc] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [GesLoc] SET  READ_WRITE
GO
ALTER DATABASE [GesLoc] SET RECOVERY SIMPLE
GO
ALTER DATABASE [GesLoc] SET  MULTI_USER
GO
ALTER DATABASE [GesLoc] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [GesLoc] SET DB_CHAINING OFF
GO
USE [GesLoc]
GO
/****** Object:  Table [dbo].[Appartement]    Script Date: 12/26/2014 22:01:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appartement](
	[IDAppartement] [int] IDENTITY(1,1) NOT NULL,
	[Superficie] [float] NOT NULL,
	[NbPieces] [int] NOT NULL,
	[Parking] [int] NOT NULL,
	[NbEtage] [int] NOT NULL,
	[Type] [nvarchar](10) NOT NULL,
	[Lieu] [nvarchar](50) NOT NULL,
	[InfoSupp] [nvarchar](max) NULL,
 CONSTRAINT [PK_Appartement] PRIMARY KEY CLUSTERED 
(
	[IDAppartement] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Utilisateur]    Script Date: 12/26/2014 22:01:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Utilisateur](
	[IDUser] [int] IDENTITY(1,1) NOT NULL,
	[nom] [nvarchar](50) NOT NULL,
	[login] [nvarchar](50) NOT NULL,
	[motdepasse] [nvarchar](256) NOT NULL,
	[seed] [int] NOT NULL,
	[type] [varchar](10) NOT NULL,
 CONSTRAINT [PK_tbUtilisateur] PRIMARY KEY CLUSTERED 
(
	[IDUser] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Bailleur]    Script Date: 12/26/2014 22:01:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bailleur](
	[IDBailleur] [int] NOT NULL,
	[Telephone] [nvarchar](20) NULL,
	[Adresse] [nvarchar](200) NULL,
	[InfoSupp] [nvarchar](max) NULL,
 CONSTRAINT [PK_Bailleur] PRIMARY KEY CLUSTERED 
(
	[IDBailleur] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Locataire]    Script Date: 12/26/2014 22:01:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Locataire](
	[IDLocataire] [int] NOT NULL,
	[Telephone] [nvarchar](20) NULL,
	[Addresse] [nvarchar](200) NULL,
	[Civilite] [nvarchar](10) NOT NULL,
	[DateNaiss] [date] NULL,
	[Profession] [nvarchar](50) NULL,
	[EtatCivil] [nchar](10) NULL,
	[Fumeur] [int] NULL,
	[InfoSupp] [nvarchar](max) NULL,
 CONSTRAINT [PK_Locataire] PRIMARY KEY CLUSTERED 
(
	[IDLocataire] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Annonce]    Script Date: 12/26/2014 22:01:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Annonce](
	[IDAnnonce] [int] IDENTITY(1,1) NOT NULL,
	[IDBailleur] [int] NOT NULL,
	[IDAppartement] [int] NOT NULL,
	[DatePub] [date] NOT NULL,
	[Prix] [float] NOT NULL,
	[Motif] [nvarchar](200) NOT NULL,
	[NbMaxCol] [int] NOT NULL,
	[Visibilite] [int] NOT NULL,
 CONSTRAINT [PK_Annonce] PRIMARY KEY CLUSTERED 
(
	[IDAnnonce] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Demande]    Script Date: 12/26/2014 22:01:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Demande](
	[IDLocataire] [int] NOT NULL,
	[IDAnnonce] [int] NOT NULL,
	[DateDemande] [date] NOT NULL,
	[Status] [int] NOT NULL,
	[Commentaire] [nvarchar](200) NULL,
 CONSTRAINT [PK_Demande] PRIMARY KEY CLUSTERED 
(
	[IDLocataire] ASC,
	[IDAnnonce] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_Bailleur_tbUtilisateur]    Script Date: 12/26/2014 22:01:49 ******/
ALTER TABLE [dbo].[Bailleur]  WITH CHECK ADD  CONSTRAINT [FK_Bailleur_tbUtilisateur] FOREIGN KEY([IDBailleur])
REFERENCES [dbo].[Utilisateur] ([IDUser])
GO
ALTER TABLE [dbo].[Bailleur] CHECK CONSTRAINT [FK_Bailleur_tbUtilisateur]
GO
/****** Object:  ForeignKey [FK_Locataire_tbUtilisateur]    Script Date: 12/26/2014 22:01:49 ******/
ALTER TABLE [dbo].[Locataire]  WITH CHECK ADD  CONSTRAINT [FK_Locataire_tbUtilisateur] FOREIGN KEY([IDLocataire])
REFERENCES [dbo].[Utilisateur] ([IDUser])
GO
ALTER TABLE [dbo].[Locataire] CHECK CONSTRAINT [FK_Locataire_tbUtilisateur]
GO
/****** Object:  ForeignKey [FK_Annonce_Appartement]    Script Date: 12/26/2014 22:01:49 ******/
ALTER TABLE [dbo].[Annonce]  WITH CHECK ADD  CONSTRAINT [FK_Annonce_Appartement] FOREIGN KEY([IDAppartement])
REFERENCES [dbo].[Appartement] ([IDAppartement])
GO
ALTER TABLE [dbo].[Annonce] CHECK CONSTRAINT [FK_Annonce_Appartement]
GO
/****** Object:  ForeignKey [FK_Annonce_Bailleur]    Script Date: 12/26/2014 22:01:49 ******/
ALTER TABLE [dbo].[Annonce]  WITH CHECK ADD  CONSTRAINT [FK_Annonce_Bailleur] FOREIGN KEY([IDBailleur])
REFERENCES [dbo].[Bailleur] ([IDBailleur])
GO
ALTER TABLE [dbo].[Annonce] CHECK CONSTRAINT [FK_Annonce_Bailleur]
GO
/****** Object:  ForeignKey [FK_Demande_Annonce]    Script Date: 12/26/2014 22:01:49 ******/
ALTER TABLE [dbo].[Demande]  WITH CHECK ADD  CONSTRAINT [FK_Demande_Annonce] FOREIGN KEY([IDAnnonce])
REFERENCES [dbo].[Annonce] ([IDAnnonce])
GO
ALTER TABLE [dbo].[Demande] CHECK CONSTRAINT [FK_Demande_Annonce]
GO
/****** Object:  ForeignKey [FK_Demande_Locataire]    Script Date: 12/26/2014 22:01:49 ******/
ALTER TABLE [dbo].[Demande]  WITH CHECK ADD  CONSTRAINT [FK_Demande_Locataire] FOREIGN KEY([IDLocataire])
REFERENCES [dbo].[Locataire] ([IDLocataire])
GO
ALTER TABLE [dbo].[Demande] CHECK CONSTRAINT [FK_Demande_Locataire]
GO
