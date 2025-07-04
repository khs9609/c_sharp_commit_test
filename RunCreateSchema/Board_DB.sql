USE [master]
GO
/****** Object:  Database [Board]    Script Date: 2025-05-13 오후 5:03:01 ******/
CREATE DATABASE [Board]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Board', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Board.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Board_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Board_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Board] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Board].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Board] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Board] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Board] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Board] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Board] SET ARITHABORT OFF 
GO
ALTER DATABASE [Board] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Board] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Board] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Board] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Board] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Board] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Board] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Board] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Board] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Board] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Board] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Board] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Board] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Board] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Board] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Board] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Board] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Board] SET RECOVERY FULL 
GO
ALTER DATABASE [Board] SET  MULTI_USER 
GO
ALTER DATABASE [Board] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Board] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Board] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Board] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Board] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Board] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Board', N'ON'
GO
ALTER DATABASE [Board] SET QUERY_STORE = ON
GO
ALTER DATABASE [Board] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Board]
GO
/****** Object:  User [Portaladmin]    Script Date: 2025-05-13 오후 5:03:01 ******/
CREATE USER [Portaladmin] FOR LOGIN [Portaladmin] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [Portaladmin]
GO
/****** Object:  Table [dbo].[tb_Board]    Script Date: 2025-05-13 오후 5:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Board](
	[BoardID] [nvarchar](50) NULL,
	[ItemID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](250) NOT NULL,
	[Contents] [nvarchar](max) NULL,
	[CreateUserID] [nvarchar](50) NOT NULL,
	[CreateUserName] [nvarchar](50) NOT NULL,
	[CreateDT] [datetime] NOT NULL,
	[ViewCount] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[tb_Board] ADD  CONSTRAINT [DF_tb_Board_ViewCount]  DEFAULT ((0)) FOR [ViewCount]
GO
/****** Object:  StoredProcedure [dbo].[sp_Board_DeleteItem]    Script Date: 2025-05-13 오후 5:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Board_DeleteItem]
	@ItemID nvarchar(255),
	@UserID		nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	
	IF EXISTS (SELECT count(1) FROM tb_Board where ItemID = @ItemID AND CreateUserID = @UserID)
	BEGIN
		DELETE FROM tb_Board where ItemID = @ItemID
	END
	ELSE BEGIN
		select null
	END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Board_GetBoardItem]    Script Date: 2025-05-13 오후 5:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[sp_Board_GetBoardItem]
	-- Add the parameters for the stored procedure here
	@ItemID nvarchar(255)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select * from tb_Board where ItemID = @ItemID
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Board_InsertItem]    Script Date: 2025-05-13 오후 5:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Board_InsertItem]
	@Title		nvarchar(200),
	@Contents	nvarchar(Max),
	@UserID		nvarchar(50),
	@UserName	nvarchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into tb_Board(Title, Contents, CreateUserID, CreateUserName, CreateDT)
	VALUES
	(
		@Title,
		@Contents,
		@UserID,
		@UserName,
		GETDATE()
	)

	SELECT @@ROWCOUNT
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Board_List]    Script Date: 2025-05-13 오후 5:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Board_List]
	-- Add the parameters for the stored procedure here
	@param1 nvarchar(255)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM tb_Board
END
GO
USE [master]
GO
ALTER DATABASE [Board] SET  READ_WRITE 
GO
