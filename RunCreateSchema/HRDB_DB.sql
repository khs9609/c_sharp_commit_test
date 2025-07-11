USE [master]
GO
/****** Object:  Database [HRDB]    Script Date: 2025-05-13 오후 5:05:18 ******/
CREATE DATABASE [HRDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HRDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\HRDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HRDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\HRDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [HRDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HRDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HRDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HRDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HRDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HRDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HRDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [HRDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HRDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HRDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HRDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HRDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HRDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HRDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HRDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HRDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HRDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HRDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HRDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HRDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HRDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HRDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HRDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HRDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HRDB] SET RECOVERY FULL 
GO
ALTER DATABASE [HRDB] SET  MULTI_USER 
GO
ALTER DATABASE [HRDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HRDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HRDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HRDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HRDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HRDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'HRDB', N'ON'
GO
ALTER DATABASE [HRDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [HRDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [HRDB]
GO
/****** Object:  User [Portaladmin]    Script Date: 2025-05-13 오후 5:05:18 ******/
CREATE USER [Portaladmin] FOR LOGIN [Portaladmin] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [Portaladmin]
GO
/****** Object:  Table [dbo].[tb_User]    Script Date: 2025-05-13 오후 5:05:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_User](
	[UserID] [nvarchar](50) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Emailaddress] [nvarchar](255) NULL,
	[UserTel] [nvarchar](50) NULL,
	[UserPW] [nvarchar](100) NOT NULL,
	[UserUniqueID] [uniqueidentifier] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tb_User] ADD  CONSTRAINT [DF_tb_User_UserUniqueID]  DEFAULT (newid()) FOR [UserUniqueID]
GO
/****** Object:  StoredProcedure [dbo].[sp_AccountCheck]    Script Date: 2025-05-13 오후 5:05:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_AccountCheck]
	@UserID nvarchar(100),
	@UserPW nvarchar(100)
AS
BEGIN

	declare @Result nvarchar(50) = ''
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	IF EXISTS (select * from tb_User where UserID = @UserID and UserPW = @UserPW)
		BEGIN
			select 1;
		END
	ELSE
		BEGIN
			select 0;
		END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetUserInfo]    Script Date: 2025-05-13 오후 5:05:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetUserInfo]
	-- Add the parameters for the stored procedure here
	@UserID nvarchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from tb_User where UserID=@UserID
END
GO
USE [master]
GO
ALTER DATABASE [HRDB] SET  READ_WRITE 
GO
