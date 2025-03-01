USE [master]
GO
/****** Object:  Database [Matie]    Script Date: 16.04.2024 14:41:16 ******/
CREATE DATABASE [Matie]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Matie', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Matie.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Matie_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Matie_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Matie] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Matie].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Matie] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Matie] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Matie] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Matie] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Matie] SET ARITHABORT OFF 
GO
ALTER DATABASE [Matie] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Matie] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Matie] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Matie] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Matie] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Matie] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Matie] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Matie] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Matie] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Matie] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Matie] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Matie] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Matie] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Matie] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Matie] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Matie] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Matie] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Matie] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Matie] SET  MULTI_USER 
GO
ALTER DATABASE [Matie] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Matie] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Matie] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Matie] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Matie] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Matie] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Matie] SET QUERY_STORE = ON
GO
ALTER DATABASE [Matie] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Matie]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 16.04.2024 14:41:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[User_Id] [int] NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Master]    Script Date: 16.04.2024 14:41:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Master](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[User_Id] [int] NULL,
	[Qualification] [nvarchar](50) NULL,
	[Order_Id] [int] NULL,
 CONSTRAINT [PK_Master] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 16.04.2024 14:41:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Service_Id] [int] NULL,
	[Client_Id] [int] NULL,
	[Comment] [nvarchar](max) NULL,
	[Date] [date] NULL,
	[Master_Id] [int] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 16.04.2024 14:41:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 16.04.2024 14:41:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UpRankMasterOrder]    Script Date: 16.04.2024 14:41:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UpRankMasterOrder](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Master_Id] [int] NULL,
	[Date] [date] NULL,
 CONSTRAINT [PK_UpRankMasterOrder] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 16.04.2024 14:41:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Date] [date] NULL,
	[Login] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Role_Id] [int] NULL,
	[Balance] [int] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Client] ON 

INSERT [dbo].[Client] ([Id], [User_Id]) VALUES (4, 11)
INSERT [dbo].[Client] ([Id], [User_Id]) VALUES (5, 19)
INSERT [dbo].[Client] ([Id], [User_Id]) VALUES (6, 20)
SET IDENTITY_INSERT [dbo].[Client] OFF
GO
SET IDENTITY_INSERT [dbo].[Master] ON 

INSERT [dbo].[Master] ([Id], [User_Id], [Qualification], [Order_Id]) VALUES (16, 14, N'Titan', 4)
INSERT [dbo].[Master] ([Id], [User_Id], [Qualification], [Order_Id]) VALUES (17, 15, N'Divine', 5)
INSERT [dbo].[Master] ([Id], [User_Id], [Qualification], [Order_Id]) VALUES (18, 16, N'Legeng', 6)
INSERT [dbo].[Master] ([Id], [User_Id], [Qualification], [Order_Id]) VALUES (19, 17, N'Anchor', NULL)
INSERT [dbo].[Master] ([Id], [User_Id], [Qualification], [Order_Id]) VALUES (20, 18, N'Guardian', NULL)
SET IDENTITY_INSERT [dbo].[Master] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([Id], [Service_Id], [Client_Id], [Comment], [Date], [Master_Id]) VALUES (4, 1, 4, NULL, CAST(N'2024-12-16' AS Date), 16)
INSERT [dbo].[Order] ([Id], [Service_Id], [Client_Id], [Comment], [Date], [Master_Id]) VALUES (5, 2, 5, NULL, CAST(N'2024-12-17' AS Date), 17)
INSERT [dbo].[Order] ([Id], [Service_Id], [Client_Id], [Comment], [Date], [Master_Id]) VALUES (6, 3, 6, NULL, CAST(N'2024-12-18' AS Date), 18)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [Name]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (2, N'Moderator')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (3, N'Worker')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (4, N'Client')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Service] ON 

INSERT [dbo].[Service] ([Id], [Name]) VALUES (1, N'Manicure')
INSERT [dbo].[Service] ([Id], [Name]) VALUES (2, N'Manicure')
INSERT [dbo].[Service] ([Id], [Name]) VALUES (3, N'Manicure')
INSERT [dbo].[Service] ([Id], [Name]) VALUES (4, N'Manicure')
INSERT [dbo].[Service] ([Id], [Name]) VALUES (5, N'Manicure')
INSERT [dbo].[Service] ([Id], [Name]) VALUES (6, N'Manicure')
INSERT [dbo].[Service] ([Id], [Name]) VALUES (7, N'Manicure')
INSERT [dbo].[Service] ([Id], [Name]) VALUES (8, N'Manicure')
INSERT [dbo].[Service] ([Id], [Name]) VALUES (9, N'Manicure')
INSERT [dbo].[Service] ([Id], [Name]) VALUES (10, N'Manicure')
SET IDENTITY_INSERT [dbo].[Service] OFF
GO
SET IDENTITY_INSERT [dbo].[UpRankMasterOrder] ON 

INSERT [dbo].[UpRankMasterOrder] ([Id], [Master_Id], [Date]) VALUES (2, 16, CAST(N'2024-04-19' AS Date))
SET IDENTITY_INSERT [dbo].[UpRankMasterOrder] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [Name], [Date], [Login], [Password], [Role_Id], [Balance]) VALUES (11, N'Misha', CAST(N'2004-12-16' AS Date), N'ethrth', N'zxc123', 4, 500)
INSERT [dbo].[User] ([Id], [Name], [Date], [Login], [Password], [Role_Id], [Balance]) VALUES (12, N'Nisha', CAST(N'2004-12-17' AS Date), N'wevqv', N'qwf123', 1, 500)
INSERT [dbo].[User] ([Id], [Name], [Date], [Login], [Password], [Role_Id], [Balance]) VALUES (13, N'Mike', CAST(N'2004-12-18' AS Date), N'wqgwg', N'qgr134', 2, 500)
INSERT [dbo].[User] ([Id], [Name], [Date], [Login], [Password], [Role_Id], [Balance]) VALUES (14, N'Ally', CAST(N'2004-12-19' AS Date), N'qwgqwrgq', N'iii444', 3, 500)
INSERT [dbo].[User] ([Id], [Name], [Date], [Login], [Password], [Role_Id], [Balance]) VALUES (15, N'Bob', CAST(N'2004-12-20' AS Date), N'gqwrg', N'qqq111', 3, 500)
INSERT [dbo].[User] ([Id], [Name], [Date], [Login], [Password], [Role_Id], [Balance]) VALUES (16, N'Dean', CAST(N'2004-12-21' AS Date), N'fsbadf', N'222www', 3, 500)
INSERT [dbo].[User] ([Id], [Name], [Date], [Login], [Password], [Role_Id], [Balance]) VALUES (17, N'Sam', CAST(N'2004-12-22' AS Date), N'imryu', N'eee333', 3, 500)
INSERT [dbo].[User] ([Id], [Name], [Date], [Login], [Password], [Role_Id], [Balance]) VALUES (18, N'Darryl', CAST(N'2004-12-23' AS Date), N'iyerh', N'rrr444', 3, 500)
INSERT [dbo].[User] ([Id], [Name], [Date], [Login], [Password], [Role_Id], [Balance]) VALUES (19, N'Colsen', CAST(N'2004-12-24' AS Date), N'erthrth', N'ttt555', 4, 500)
INSERT [dbo].[User] ([Id], [Name], [Date], [Login], [Password], [Role_Id], [Balance]) VALUES (20, N'Ashley', CAST(N'2004-12-25' AS Date), N'erhrth', N'yyy666', 4, 500)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_User] FOREIGN KEY([User_Id])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Client] CHECK CONSTRAINT [FK_Client_User]
GO
ALTER TABLE [dbo].[Master]  WITH CHECK ADD  CONSTRAINT [FK_Master_Order] FOREIGN KEY([Order_Id])
REFERENCES [dbo].[Order] ([Id])
GO
ALTER TABLE [dbo].[Master] CHECK CONSTRAINT [FK_Master_Order]
GO
ALTER TABLE [dbo].[Master]  WITH CHECK ADD  CONSTRAINT [FK_Master_User] FOREIGN KEY([User_Id])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Master] CHECK CONSTRAINT [FK_Master_User]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Client] FOREIGN KEY([Client_Id])
REFERENCES [dbo].[Client] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Client]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Master] FOREIGN KEY([Master_Id])
REFERENCES [dbo].[Master] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Master]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Service1] FOREIGN KEY([Service_Id])
REFERENCES [dbo].[Service] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Service1]
GO
ALTER TABLE [dbo].[UpRankMasterOrder]  WITH CHECK ADD  CONSTRAINT [FK_UpRankMasterOrder_Master] FOREIGN KEY([Master_Id])
REFERENCES [dbo].[Master] ([Id])
GO
ALTER TABLE [dbo].[UpRankMasterOrder] CHECK CONSTRAINT [FK_UpRankMasterOrder_Master]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([Role_Id])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
USE [master]
GO
ALTER DATABASE [Matie] SET  READ_WRITE 
GO
