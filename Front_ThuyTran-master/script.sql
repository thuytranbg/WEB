USE [master]
GO
/****** Object:  Database [bg]    Script Date: 3/26/2019 5:21:49 PM ******/
CREATE DATABASE [bg]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'bg', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\bg.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'bg_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\bg_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [bg] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [bg].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [bg] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [bg] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [bg] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [bg] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [bg] SET ARITHABORT OFF 
GO
ALTER DATABASE [bg] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [bg] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [bg] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [bg] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [bg] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [bg] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [bg] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [bg] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [bg] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [bg] SET  DISABLE_BROKER 
GO
ALTER DATABASE [bg] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [bg] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [bg] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [bg] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [bg] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [bg] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [bg] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [bg] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [bg] SET  MULTI_USER 
GO
ALTER DATABASE [bg] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [bg] SET DB_CHAINING OFF 
GO
ALTER DATABASE [bg] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [bg] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [bg] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [bg] SET QUERY_STORE = OFF
GO
USE [bg]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
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
USE [bg]
GO
/****** Object:  Table [dbo].[ARTICLE]    Script Date: 3/26/2019 5:21:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ARTICLE](
	[ArticleID] [int] IDENTITY(1,1) NOT NULL,
	[shortnewsID] [int] NOT NULL,
	[content] [nvarchar](max) NULL,
	[articleImgID] [int] NULL,
	[createUserId] [bigint] NULL,
	[createTime] [datetime] NULL,
	[lastupdate] [datetime] NULL,
 CONSTRAINT [PK_ARTICLE] PRIMARY KEY CLUSTERED 
(
	[ArticleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ARTICLE_IMAGE]    Script Date: 3/26/2019 5:21:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ARTICLE_IMAGE](
	[articleImgId] [int] IDENTITY(1,1) NOT NULL,
	[articleID] [int] NOT NULL,
	[imageurl] [varchar](20) NOT NULL,
	[createTime] [datetime] NULL,
	[createUserId] [bigint] NULL,
 CONSTRAINT [PK_ARTICLE_IMAGE] PRIMARY KEY CLUSTERED 
(
	[articleImgId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CATEGORY]    Script Date: 3/26/2019 5:21:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CATEGORY](
	[categoryID] [tinyint] IDENTITY(1,1) NOT NULL,
	[categoryName] [nvarchar](50) NOT NULL,
	[createTime] [datetime] NULL,
	[createUserID] [bigint] NULL,
 CONSTRAINT [PK_CATEGORY] PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[COMMENT]    Script Date: 3/26/2019 5:21:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COMMENT](
	[commentID] [bigint] IDENTITY(1,1) NOT NULL,
	[cmtcontent] [nvarchar](100) NOT NULL,
	[shortnewsID] [int] NULL,
	[createUserId] [bigint] NULL,
	[createTime] [datetime] NULL,
	[updateTime] [datetime] NULL,
 CONSTRAINT [PK_COMMENT] PRIMARY KEY CLUSTERED 
(
	[commentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KEYWORD]    Script Date: 3/26/2019 5:21:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KEYWORD](
	[keyID] [bigint] NOT NULL,
	[keyDesc] [nvarchar](30) NULL,
	[shortnewsID] [int] NULL,
	[createUserId] [bigint] NULL,
	[createTime] [datetime] NULL,
 CONSTRAINT [PK_KEYWORD] PRIMARY KEY CLUSTERED 
(
	[keyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SHORTNEWS]    Script Date: 3/26/2019 5:21:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SHORTNEWS](
	[shortnewsID] [int] IDENTITY(1,1) NOT NULL,
	[shortnewsTitle] [nvarchar](50) NOT NULL,
	[shortnewsHead] [nvarchar](200) NULL,
	[shortnewsImg] [varchar](20) NULL,
	[authorID] [bigint] NULL,
	[approvalID] [bigint] NULL,
	[createTime] [datetime] NULL,
	[publishedTime] [datetime] NULL,
	[keywordID] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[shortnewsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USER]    Script Date: 3/26/2019 5:21:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USER](
	[username] [nvarchar](30) NOT NULL,
	[password] [nvarchar](50) NULL,
	[idUser] [bigint] IDENTITY(1,1) NOT NULL,
	[fullname] [nvarchar](60) NULL,
	[dob] [date] NULL,
	[address] [nvarchar](150) NULL,
	[gender] [bit] NULL,
	[createTime] [datetime] NULL,
 CONSTRAINT [PK_USER] PRIMARY KEY CLUSTERED 
(
	[idUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [bg] SET  READ_WRITE 
GO
