USE [master]
GO
/****** Object:  Database [Automobile workshop]    Script Date: 03-Dec-20 10:56:02 PM ******/
CREATE DATABASE [Automobile workshop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Automobile workshop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Automobile workshop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Automobile workshop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Automobile workshop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Automobile workshop] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Automobile workshop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Automobile workshop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Automobile workshop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Automobile workshop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Automobile workshop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Automobile workshop] SET ARITHABORT OFF 
GO
ALTER DATABASE [Automobile workshop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Automobile workshop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Automobile workshop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Automobile workshop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Automobile workshop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Automobile workshop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Automobile workshop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Automobile workshop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Automobile workshop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Automobile workshop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Automobile workshop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Automobile workshop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Automobile workshop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Automobile workshop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Automobile workshop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Automobile workshop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Automobile workshop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Automobile workshop] SET RECOVERY FULL 
GO
ALTER DATABASE [Automobile workshop] SET  MULTI_USER 
GO
ALTER DATABASE [Automobile workshop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Automobile workshop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Automobile workshop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Automobile workshop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Automobile workshop] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Automobile workshop', N'ON'
GO
ALTER DATABASE [Automobile workshop] SET QUERY_STORE = OFF
GO
USE [Automobile workshop]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = OFF;
GO
USE [Automobile workshop]
GO
/****** Object:  Table [dbo].[city]    Script Date: 03-Dec-20 10:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[city](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[postal_code] [varchar](20) NULL,
	[city_name] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customer]    Script Date: 03-Dec-20 10:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [nvarchar](50) NULL,
	[last_name] [nvarchar](50) NULL,
	[company_name] [nvarchar](50) NULL,
	[address] [nvarchar](50) NULL,
	[mobile_number] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[details] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[employee]    Script Date: 03-Dec-20 10:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employee](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[postition_id] [int] NOT NULL,
	[city_id] [int] NOT NULL,
	[first_name] [varchar](128) NULL,
	[last_name] [varchar](128) NULL,
	[employment_start_date] [date] NULL,
	[employment_end_date] [date] NULL,
	[is_active] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[employee_account]    Script Date: 03-Dec-20 10:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employee_account](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[password] [nvarchar](10) NOT NULL,
	[employee_id] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GenerateReport]    Script Date: 03-Dec-20 10:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GenerateReport](
	[customer_id] [int] NOT NULL,
	[offer_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC,
	[offer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[make]    Script Date: 03-Dec-20 10:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[make](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[make_name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[model]    Script Date: 03-Dec-20 10:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[model](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[make_id] [int] NOT NULL,
	[vehicle_type_id] [int] NOT NULL,
	[model_name] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[offer]    Script Date: 03-Dec-20 10:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[offer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[service_catalog_id] [int] NOT NULL,
	[offer_description] [text] NULL,
	[service_discount] [decimal](18, 0) NULL,
	[offer_price] [decimal](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[offer_task]    Script Date: 03-Dec-20 10:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[offer_task](
	[offer_id] [int] NOT NULL,
	[task_catalog_id] [int] NOT NULL,
	[id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[offer_id] ASC,
	[task_catalog_id] ASC,
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[part]    Script Date: 03-Dec-20 10:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[part](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[model_id] [int] NOT NULL,
	[part_type_id] [int] NOT NULL,
	[part_name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[part_type]    Script Date: 03-Dec-20 10:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[part_type](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[part_type_name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[postition]    Script Date: 03-Dec-20 10:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[postition](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[position_name] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[repair_shop]    Script Date: 03-Dec-20 10:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[repair_shop](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[city_id] [int] NOT NULL,
	[shop_name] [varchar](1) NULL,
	[address] [varchar](255) NULL,
	[details] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[service_catalog]    Script Date: 03-Dec-20 10:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[service_catalog](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[service_name] [nvarchar](50) NULL,
	[description] [text] NULL,
	[service_discount] [decimal](18, 0) NULL,
	[is_active] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[task_catalog]    Script Date: 03-Dec-20 10:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[task_catalog](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[part_id] [int] NOT NULL,
	[service_catalog_id] [int] NOT NULL,
	[task_name] [nvarchar](50) NULL,
	[description] [text] NULL,
	[task_price] [decimal](18, 0) NULL,
	[is_active] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vehicle]    Script Date: 03-Dec-20 10:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vehicle](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[customer_id] [int] NOT NULL,
	[model_id] [int] NOT NULL,
	[vin] [nvarchar](50) NULL,
	[license_plate] [nvarchar](50) NULL,
	[manufactured_year] [int] NULL,
	[manufactured_month] [int] NULL,
	[details] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vehicle_type]    Script Date: 03-Dec-20 10:56:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vehicle_type](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[type_name] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[city] ON 

INSERT [dbo].[city] ([id], [postal_code], [city_name]) VALUES (1, N'71000', N'Hyderabad')
INSERT [dbo].[city] ([id], [postal_code], [city_name]) VALUES (2, N'44000', N'Islamabad')
INSERT [dbo].[city] ([id], [postal_code], [city_name]) VALUES (3, N'75500', N'Karachi')
INSERT [dbo].[city] ([id], [postal_code], [city_name]) VALUES (4, N'54000', N'Lahore')
INSERT [dbo].[city] ([id], [postal_code], [city_name]) VALUES (5, N'47040', N'Wah Cantt')
INSERT [dbo].[city] ([id], [postal_code], [city_name]) VALUES (6, N'47150', N'Murree')
INSERT [dbo].[city] ([id], [postal_code], [city_name]) VALUES (7, N'25000', N'Peshawar')
INSERT [dbo].[city] ([id], [postal_code], [city_name]) VALUES (8, N'46000', N'Rawalpindi')
INSERT [dbo].[city] ([id], [postal_code], [city_name]) VALUES (9, N'22010', N'Abbottabad')
INSERT [dbo].[city] ([id], [postal_code], [city_name]) VALUES (10, N'60000', N'Multan')
SET IDENTITY_INSERT [dbo].[city] OFF
GO
SET IDENTITY_INSERT [dbo].[customer] ON 

INSERT [dbo].[customer] ([id], [first_name], [last_name], [company_name], [address], [mobile_number], [email], [details]) VALUES (1, N'Saad', N'Iqbal', N'GreySquare', N'1033  Rebecca Street', N'03303271597', N'saad.iqbal11@hotmail.com', NULL)
INSERT [dbo].[customer] ([id], [first_name], [last_name], [company_name], [address], [mobile_number], [email], [details]) VALUES (2, N'Shahzaib', N'Amir', N'GoCreations', N'643  Summit Street', N'03330304321', N'shahzaib.amir11@hotmail.com', NULL)
INSERT [dbo].[customer] ([id], [first_name], [last_name], [company_name], [address], [mobile_number], [email], [details]) VALUES (3, N'Sudais', N'Baig', N'SAffinity', N'1954  Scenicview Drive', N'03241404543', N'sudais.baig11@hotmail.com', NULL)
INSERT [dbo].[customer] ([id], [first_name], [last_name], [company_name], [address], [mobile_number], [email], [details]) VALUES (4, N'John', N'Snow', N'KnowNothing', N'4968  Froe Street', N'03102345467', N'john.snow11@yahoo.com', NULL)
INSERT [dbo].[customer] ([id], [first_name], [last_name], [company_name], [address], [mobile_number], [email], [details]) VALUES (5, N'Abdul', N'Hameed', N'AH Go', N'337  Alfred Drive', N'03494759475', N'ah03453@go.com', NULL)
INSERT [dbo].[customer] ([id], [first_name], [last_name], [company_name], [address], [mobile_number], [email], [details]) VALUES (6, N'James', N'Cameron', N'JC Corp', N'1747  Layman Avenue', N'03287564865', N'james.cameron@gmail.com', NULL)
INSERT [dbo].[customer] ([id], [first_name], [last_name], [company_name], [address], [mobile_number], [email], [details]) VALUES (7, N'Ali', N'Anzal', N'Microsoft', N'4002  Davisson Street', N'03168594867', N'ali.anzal12@yahoo.com', NULL)
INSERT [dbo].[customer] ([id], [first_name], [last_name], [company_name], [address], [mobile_number], [email], [details]) VALUES (8, N'Usman', N'Kamran', N'Usman and Sons', N'1937  Bird Spring Lane', N'03464675775', N'usman.kamran23@yahoo.com', NULL)
INSERT [dbo].[customer] ([id], [first_name], [last_name], [company_name], [address], [mobile_number], [email], [details]) VALUES (9, N'Abid', N'Shakeel', N'SN Games', N'1952  Sherwood Circle', N'03454566757', N'as1995@hotmail.com', NULL)
INSERT [dbo].[customer] ([id], [first_name], [last_name], [company_name], [address], [mobile_number], [email], [details]) VALUES (10, N'Arsalan', N'Naseer', N'CBA', N'4997  Driftwood Road', N'03456445675', N'arsalan.naseer@gmail.com', NULL)
INSERT [dbo].[customer] ([id], [first_name], [last_name], [company_name], [address], [mobile_number], [email], [details]) VALUES (21, N'Ismail', N'Soomro', N'Model Agency', N'1043 Yotenheim Street Alabama', N'03459876402', N'ismail.som@gmail.com', NULL)
INSERT [dbo].[customer] ([id], [first_name], [last_name], [company_name], [address], [mobile_number], [email], [details]) VALUES (22, N'Umer', N'Mukhtiar', N'Umer Marketing', N'6764 Torronto Street CA', N'03133983465', N'um8764@yahoo.com', NULL)
INSERT [dbo].[customer] ([id], [first_name], [last_name], [company_name], [address], [mobile_number], [email], [details]) VALUES (23, N'Sudais', N'Amir', N'asfaf', N'12954 yt street', N'0394857784', N'sd@yahoo.com', NULL)
SET IDENTITY_INSERT [dbo].[customer] OFF
GO
SET IDENTITY_INSERT [dbo].[employee] ON 

INSERT [dbo].[employee] ([id], [postition_id], [city_id], [first_name], [last_name], [employment_start_date], [employment_end_date], [is_active]) VALUES (1, 4, 1, N'Izaan', N'Ahmed', CAST(N'2010-10-14' AS Date), NULL, 1)
INSERT [dbo].[employee] ([id], [postition_id], [city_id], [first_name], [last_name], [employment_start_date], [employment_end_date], [is_active]) VALUES (2, 1, 1, N'Ashar', N'Khalid', CAST(N'2012-08-12' AS Date), NULL, 1)
INSERT [dbo].[employee] ([id], [postition_id], [city_id], [first_name], [last_name], [employment_start_date], [employment_end_date], [is_active]) VALUES (3, 1, 2, N'Murtaza', N'Khalid', CAST(N'2012-04-06' AS Date), CAST(N'2018-06-14' AS Date), NULL)
INSERT [dbo].[employee] ([id], [postition_id], [city_id], [first_name], [last_name], [employment_start_date], [employment_end_date], [is_active]) VALUES (4, 2, 1, N'Khalid', N'Hameed', CAST(N'2009-05-16' AS Date), NULL, 1)
INSERT [dbo].[employee] ([id], [postition_id], [city_id], [first_name], [last_name], [employment_start_date], [employment_end_date], [is_active]) VALUES (5, 2, 4, N'Ahmer', N'Shaikh', CAST(N'2017-10-10' AS Date), NULL, 0)
INSERT [dbo].[employee] ([id], [postition_id], [city_id], [first_name], [last_name], [employment_start_date], [employment_end_date], [is_active]) VALUES (6, 3, 1, N'Husnain', N'Saeed', CAST(N'2009-03-05' AS Date), NULL, 1)
INSERT [dbo].[employee] ([id], [postition_id], [city_id], [first_name], [last_name], [employment_start_date], [employment_end_date], [is_active]) VALUES (7, 4, 7, N'Ibrahim', N'Memon', CAST(N'2020-02-28' AS Date), NULL, 1)
INSERT [dbo].[employee] ([id], [postition_id], [city_id], [first_name], [last_name], [employment_start_date], [employment_end_date], [is_active]) VALUES (8, 2, 2, N'Hussain', N'Channa', CAST(N'2010-12-01' AS Date), CAST(N'2015-04-12' AS Date), NULL)
INSERT [dbo].[employee] ([id], [postition_id], [city_id], [first_name], [last_name], [employment_start_date], [employment_end_date], [is_active]) VALUES (9, 1, 1, N'Imtiaz', N'Ali', CAST(N'2015-10-03' AS Date), NULL, 0)
INSERT [dbo].[employee] ([id], [postition_id], [city_id], [first_name], [last_name], [employment_start_date], [employment_end_date], [is_active]) VALUES (10, 1, 2, N'Zeeshan', N'Nabeel', CAST(N'2019-07-12' AS Date), NULL, 0)
INSERT [dbo].[employee] ([id], [postition_id], [city_id], [first_name], [last_name], [employment_start_date], [employment_end_date], [is_active]) VALUES (16, 2, 3, N'Abdul', N'Rauf', CAST(N'2018-06-03' AS Date), CAST(N'2020-10-06' AS Date), 0)
SET IDENTITY_INSERT [dbo].[employee] OFF
GO
SET IDENTITY_INSERT [dbo].[employee_account] ON 

INSERT [dbo].[employee_account] ([id], [password], [employee_id]) VALUES (2, N'pakistan12', 1)
INSERT [dbo].[employee_account] ([id], [password], [employee_id]) VALUES (3, N'abc123', 2)
INSERT [dbo].[employee_account] ([id], [password], [employee_id]) VALUES (4, N'querty123', 3)
INSERT [dbo].[employee_account] ([id], [password], [employee_id]) VALUES (5, N'mnbvcz123', 4)
INSERT [dbo].[employee_account] ([id], [password], [employee_id]) VALUES (6, N'absuy123', 5)
INSERT [dbo].[employee_account] ([id], [password], [employee_id]) VALUES (7, N'youtube456', 6)
INSERT [dbo].[employee_account] ([id], [password], [employee_id]) VALUES (8, N'eagames12', 7)
INSERT [dbo].[employee_account] ([id], [password], [employee_id]) VALUES (9, N'idealid123', 8)
INSERT [dbo].[employee_account] ([id], [password], [employee_id]) VALUES (11, N'cardio12', 9)
INSERT [dbo].[employee_account] ([id], [password], [employee_id]) VALUES (17, N'E7R:OBPa', 16)
SET IDENTITY_INSERT [dbo].[employee_account] OFF
GO
INSERT [dbo].[GenerateReport] ([customer_id], [offer_id]) VALUES (1, 1)
INSERT [dbo].[GenerateReport] ([customer_id], [offer_id]) VALUES (6, 1)
INSERT [dbo].[GenerateReport] ([customer_id], [offer_id]) VALUES (1, 2)
INSERT [dbo].[GenerateReport] ([customer_id], [offer_id]) VALUES (7, 2)
INSERT [dbo].[GenerateReport] ([customer_id], [offer_id]) VALUES (5, 3)
INSERT [dbo].[GenerateReport] ([customer_id], [offer_id]) VALUES (1, 4)
INSERT [dbo].[GenerateReport] ([customer_id], [offer_id]) VALUES (2, 4)
INSERT [dbo].[GenerateReport] ([customer_id], [offer_id]) VALUES (3, 5)
INSERT [dbo].[GenerateReport] ([customer_id], [offer_id]) VALUES (5, 5)
INSERT [dbo].[GenerateReport] ([customer_id], [offer_id]) VALUES (4, 6)
INSERT [dbo].[GenerateReport] ([customer_id], [offer_id]) VALUES (23, 6)
INSERT [dbo].[GenerateReport] ([customer_id], [offer_id]) VALUES (2, 7)
INSERT [dbo].[GenerateReport] ([customer_id], [offer_id]) VALUES (4, 7)
GO
SET IDENTITY_INSERT [dbo].[make] ON 

INSERT [dbo].[make] ([id], [make_name]) VALUES (14, N'Toyota')
INSERT [dbo].[make] ([id], [make_name]) VALUES (15, N'Honda')
INSERT [dbo].[make] ([id], [make_name]) VALUES (16, N'Kia')
INSERT [dbo].[make] ([id], [make_name]) VALUES (17, N'BMW')
INSERT [dbo].[make] ([id], [make_name]) VALUES (18, N'Suzuki')
INSERT [dbo].[make] ([id], [make_name]) VALUES (19, N'Hyundai')
INSERT [dbo].[make] ([id], [make_name]) VALUES (20, N'Tesla')
INSERT [dbo].[make] ([id], [make_name]) VALUES (21, N'United')
INSERT [dbo].[make] ([id], [make_name]) VALUES (22, N'Prince')
SET IDENTITY_INSERT [dbo].[make] OFF
GO
SET IDENTITY_INSERT [dbo].[model] ON 

INSERT [dbo].[model] ([id], [make_id], [vehicle_type_id], [model_name]) VALUES (2, 14, 4, N'Vitz')
INSERT [dbo].[model] ([id], [make_id], [vehicle_type_id], [model_name]) VALUES (3, 14, 4, N'Passo')
INSERT [dbo].[model] ([id], [make_id], [vehicle_type_id], [model_name]) VALUES (4, 14, 2, N'Corolla')
INSERT [dbo].[model] ([id], [make_id], [vehicle_type_id], [model_name]) VALUES (5, 15, 2, N'Civic')
INSERT [dbo].[model] ([id], [make_id], [vehicle_type_id], [model_name]) VALUES (6, 16, 4, N'Picanto')
INSERT [dbo].[model] ([id], [make_id], [vehicle_type_id], [model_name]) VALUES (7, 14, 8, N'Prius')
INSERT [dbo].[model] ([id], [make_id], [vehicle_type_id], [model_name]) VALUES (8, 18, 3, N'Vitara')
INSERT [dbo].[model] ([id], [make_id], [vehicle_type_id], [model_name]) VALUES (9, 15, 8, N'Fit')
INSERT [dbo].[model] ([id], [make_id], [vehicle_type_id], [model_name]) VALUES (10, 14, 6, N'Hilux')
SET IDENTITY_INSERT [dbo].[model] OFF
GO
SET IDENTITY_INSERT [dbo].[offer] ON 

INSERT [dbo].[offer] ([id], [service_catalog_id], [offer_description], [service_discount], [offer_price]) VALUES (1, 3, N'This is the offer for those customers who want to fix their brake and body', CAST(5 AS Decimal(18, 0)), CAST(10000 AS Decimal(18, 0)))
INSERT [dbo].[offer] ([id], [service_catalog_id], [offer_description], [service_discount], [offer_price]) VALUES (2, 2, N'This is the offer for those customers who want to clean their vehicles', CAST(0 AS Decimal(18, 0)), CAST(600 AS Decimal(18, 0)))
INSERT [dbo].[offer] ([id], [service_catalog_id], [offer_description], [service_discount], [offer_price]) VALUES (3, 5, N'This is the offer for those customers who want to give a new paint to their car', CAST(25 AS Decimal(18, 0)), CAST(18000 AS Decimal(18, 0)))
INSERT [dbo].[offer] ([id], [service_catalog_id], [offer_description], [service_discount], [offer_price]) VALUES (4, 4, N'This is the offer for those customers who want to get their transmission fixed', CAST(10 AS Decimal(18, 0)), CAST(3500 AS Decimal(18, 0)))
INSERT [dbo].[offer] ([id], [service_catalog_id], [offer_description], [service_discount], [offer_price]) VALUES (5, 6, N'This is the offer for those customers who want to get their dents fixed', CAST(9 AS Decimal(18, 0)), CAST(5000 AS Decimal(18, 0)))
INSERT [dbo].[offer] ([id], [service_catalog_id], [offer_description], [service_discount], [offer_price]) VALUES (6, 1, N'This is the offer for those customers who want a tuning', CAST(5 AS Decimal(18, 0)), CAST(1000 AS Decimal(18, 0)))
INSERT [dbo].[offer] ([id], [service_catalog_id], [offer_description], [service_discount], [offer_price]) VALUES (7, 7, N'This is the offer for those customers who want to replace their engine blocks', CAST(0 AS Decimal(18, 0)), CAST(54000 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[offer] OFF
GO
INSERT [dbo].[offer_task] ([offer_id], [task_catalog_id], [id]) VALUES (1, 2, 1)
INSERT [dbo].[offer_task] ([offer_id], [task_catalog_id], [id]) VALUES (2, 2, 2)
INSERT [dbo].[offer_task] ([offer_id], [task_catalog_id], [id]) VALUES (3, 3, 3)
INSERT [dbo].[offer_task] ([offer_id], [task_catalog_id], [id]) VALUES (4, 4, 4)
INSERT [dbo].[offer_task] ([offer_id], [task_catalog_id], [id]) VALUES (5, 5, 5)
INSERT [dbo].[offer_task] ([offer_id], [task_catalog_id], [id]) VALUES (6, 6, 6)
INSERT [dbo].[offer_task] ([offer_id], [task_catalog_id], [id]) VALUES (7, 7, 7)
GO
SET IDENTITY_INSERT [dbo].[part] ON 

INSERT [dbo].[part] ([id], [model_id], [part_type_id], [part_name]) VALUES (1, 2, 3, N'Alternator011')
INSERT [dbo].[part] ([id], [model_id], [part_type_id], [part_name]) VALUES (2, 4, 3, N'CAlternator')
INSERT [dbo].[part] ([id], [model_id], [part_type_id], [part_name]) VALUES (3, 5, 6, N'PowerSuspension')
INSERT [dbo].[part] ([id], [model_id], [part_type_id], [part_name]) VALUES (4, 10, 10, N'RacingTyres')
INSERT [dbo].[part] ([id], [model_id], [part_type_id], [part_name]) VALUES (5, 8, 9, N'Fits Rear axle  ')
INSERT [dbo].[part] ([id], [model_id], [part_type_id], [part_name]) VALUES (6, 3, 7, N'Flawless Transmission')
INSERT [dbo].[part] ([id], [model_id], [part_type_id], [part_name]) VALUES (7, 6, 5, N'F1Brakes')
SET IDENTITY_INSERT [dbo].[part] OFF
GO
SET IDENTITY_INSERT [dbo].[part_type] ON 

INSERT [dbo].[part_type] ([id], [part_type_name]) VALUES (1, N'Battery')
INSERT [dbo].[part_type] ([id], [part_type_name]) VALUES (2, N'Radiator')
INSERT [dbo].[part_type] ([id], [part_type_name]) VALUES (3, N'Alternator')
INSERT [dbo].[part_type] ([id], [part_type_name]) VALUES (4, N'Front Axle')
INSERT [dbo].[part_type] ([id], [part_type_name]) VALUES (5, N'Brakes')
INSERT [dbo].[part_type] ([id], [part_type_name]) VALUES (6, N'Suspension')
INSERT [dbo].[part_type] ([id], [part_type_name]) VALUES (7, N'Transmission')
INSERT [dbo].[part_type] ([id], [part_type_name]) VALUES (8, N'Rear axle')
INSERT [dbo].[part_type] ([id], [part_type_name]) VALUES (9, N'Fuel tank')
INSERT [dbo].[part_type] ([id], [part_type_name]) VALUES (10, N'Tyres')
SET IDENTITY_INSERT [dbo].[part_type] OFF
GO
SET IDENTITY_INSERT [dbo].[postition] ON 

INSERT [dbo].[postition] ([id], [position_name]) VALUES (1, N'Junior')
INSERT [dbo].[postition] ([id], [position_name]) VALUES (2, N'Senior')
INSERT [dbo].[postition] ([id], [position_name]) VALUES (3, N'Manager')
INSERT [dbo].[postition] ([id], [position_name]) VALUES (4, N'Intern')
SET IDENTITY_INSERT [dbo].[postition] OFF
GO
SET IDENTITY_INSERT [dbo].[service_catalog] ON 

INSERT [dbo].[service_catalog] ([id], [service_name], [description], [service_discount], [is_active]) VALUES (1, N'Full tuning', N'Full tuning of the car with everything checked. Anything troubling you will be fixed', CAST(10 AS Decimal(18, 0)), 1)
INSERT [dbo].[service_catalog] ([id], [service_name], [description], [service_discount], [is_active]) VALUES (2, N'Clean Everything', N'Full body and engine wash. Your Car will be as clean as new.', CAST(10 AS Decimal(18, 0)), 1)
INSERT [dbo].[service_catalog] ([id], [service_name], [description], [service_discount], [is_active]) VALUES (3, N'Brakes and Body', N'Get your brakes and body checked. ', CAST(5 AS Decimal(18, 0)), 1)
INSERT [dbo].[service_catalog] ([id], [service_name], [description], [service_discount], [is_active]) VALUES (4, N'Transmission and Suspensions', N'Get your transmission and suspension fully checked and serviced.', CAST(15 AS Decimal(18, 0)), 1)
INSERT [dbo].[service_catalog] ([id], [service_name], [description], [service_discount], [is_active]) VALUES (5, N'Full Body Paint', N'Give your car a new look. We paint your car', CAST(5 AS Decimal(18, 0)), 0)
INSERT [dbo].[service_catalog] ([id], [service_name], [description], [service_discount], [is_active]) VALUES (6, N'Dents and Chassis fixes', N'Get all you dents removed and your chassis checked', CAST(10 AS Decimal(18, 0)), 1)
INSERT [dbo].[service_catalog] ([id], [service_name], [description], [service_discount], [is_active]) VALUES (7, N'Engine and Suspension replacement', N'Get your engine block replaces and your suspensions fixed', CAST(0 AS Decimal(18, 0)), 0)
SET IDENTITY_INSERT [dbo].[service_catalog] OFF
GO
SET IDENTITY_INSERT [dbo].[task_catalog] ON 

INSERT [dbo].[task_catalog] ([id], [part_id], [service_catalog_id], [task_name], [description], [task_price], [is_active]) VALUES (1, 1, 1, N'Tuning', NULL, CAST(1000 AS Decimal(18, 0)), 1)
INSERT [dbo].[task_catalog] ([id], [part_id], [service_catalog_id], [task_name], [description], [task_price], [is_active]) VALUES (2, 3, 2, N'Oil change', NULL, CAST(1500 AS Decimal(18, 0)), 1)
INSERT [dbo].[task_catalog] ([id], [part_id], [service_catalog_id], [task_name], [description], [task_price], [is_active]) VALUES (3, 7, 6, N'Brake Replacement', NULL, CAST(18000 AS Decimal(18, 0)), 1)
INSERT [dbo].[task_catalog] ([id], [part_id], [service_catalog_id], [task_name], [description], [task_price], [is_active]) VALUES (4, 1, 7, N'Engine Replacement', NULL, CAST(50000 AS Decimal(18, 0)), 1)
INSERT [dbo].[task_catalog] ([id], [part_id], [service_catalog_id], [task_name], [description], [task_price], [is_active]) VALUES (5, 6, 6, N'Transmission', NULL, CAST(6790 AS Decimal(18, 0)), 0)
INSERT [dbo].[task_catalog] ([id], [part_id], [service_catalog_id], [task_name], [description], [task_price], [is_active]) VALUES (6, 5, 5, N'Axle Fixing', NULL, CAST(5000 AS Decimal(18, 0)), 1)
INSERT [dbo].[task_catalog] ([id], [part_id], [service_catalog_id], [task_name], [description], [task_price], [is_active]) VALUES (7, 4, 3, N'Tyre Replacement', NULL, CAST(6000 AS Decimal(18, 0)), 0)
SET IDENTITY_INSERT [dbo].[task_catalog] OFF
GO
SET IDENTITY_INSERT [dbo].[vehicle] ON 

INSERT [dbo].[vehicle] ([id], [customer_id], [model_id], [vin], [license_plate], [manufactured_year], [manufactured_month], [details]) VALUES (1, 1, 2, N'JM3LW28J430367256', N'ABC123', 2013, 10, NULL)
INSERT [dbo].[vehicle] ([id], [customer_id], [model_id], [vin], [license_plate], [manufactured_year], [manufactured_month], [details]) VALUES (2, 2, 3, N'JTEBU11FX70019943', N'AXZ421', 2015, 8, NULL)
INSERT [dbo].[vehicle] ([id], [customer_id], [model_id], [vin], [license_plate], [manufactured_year], [manufactured_month], [details]) VALUES (3, 8, 4, N'1GNEC13T03R251794', N'BCC176', 2018, 9, NULL)
INSERT [dbo].[vehicle] ([id], [customer_id], [model_id], [vin], [license_plate], [manufactured_year], [manufactured_month], [details]) VALUES (4, 10, 8, N'3FADP4BJ8FM193326', N'BEA984', 2017, 7, NULL)
INSERT [dbo].[vehicle] ([id], [customer_id], [model_id], [vin], [license_plate], [manufactured_year], [manufactured_month], [details]) VALUES (5, 6, 9, N'WP1AE2A26ELA10439', N'CBA432', 2016, 4, NULL)
INSERT [dbo].[vehicle] ([id], [customer_id], [model_id], [vin], [license_plate], [manufactured_year], [manufactured_month], [details]) VALUES (6, 3, 4, N'2C4RC1BG9ER294137', N'UBH434', 2009, 9, NULL)
INSERT [dbo].[vehicle] ([id], [customer_id], [model_id], [vin], [license_plate], [manufactured_year], [manufactured_month], [details]) VALUES (7, 4, 5, N'5NPEB4AC7EH838388', N'IBC145', 2018, 3, NULL)
INSERT [dbo].[vehicle] ([id], [customer_id], [model_id], [vin], [license_plate], [manufactured_year], [manufactured_month], [details]) VALUES (8, 9, 6, N'JTKDE167390239481', N'YBC527', 2012, 6, NULL)
INSERT [dbo].[vehicle] ([id], [customer_id], [model_id], [vin], [license_plate], [manufactured_year], [manufactured_month], [details]) VALUES (9, 5, 3, N'2GCEC19V621204293', N'NBC328', 2013, 5, NULL)
INSERT [dbo].[vehicle] ([id], [customer_id], [model_id], [vin], [license_plate], [manufactured_year], [manufactured_month], [details]) VALUES (10, 7, 7, N'3VW7S7ATXDM861762', N'YUB346', 2020, 2, NULL)
INSERT [dbo].[vehicle] ([id], [customer_id], [model_id], [vin], [license_plate], [manufactured_year], [manufactured_month], [details]) VALUES (12, 21, 6, N'YUNXT765473', N'ARV654', 2018, 7, N'')
SET IDENTITY_INSERT [dbo].[vehicle] OFF
GO
SET IDENTITY_INSERT [dbo].[vehicle_type] ON 

INSERT [dbo].[vehicle_type] ([id], [type_name]) VALUES (2, N'Sedan')
INSERT [dbo].[vehicle_type] ([id], [type_name]) VALUES (3, N'SUV')
INSERT [dbo].[vehicle_type] ([id], [type_name]) VALUES (4, N'Hatchback')
INSERT [dbo].[vehicle_type] ([id], [type_name]) VALUES (5, N'Convertable')
INSERT [dbo].[vehicle_type] ([id], [type_name]) VALUES (6, N'Pickup')
INSERT [dbo].[vehicle_type] ([id], [type_name]) VALUES (7, N'Coupe')
INSERT [dbo].[vehicle_type] ([id], [type_name]) VALUES (8, N'Hybrid')
INSERT [dbo].[vehicle_type] ([id], [type_name]) VALUES (9, N'Electric')
INSERT [dbo].[vehicle_type] ([id], [type_name]) VALUES (10, N'APV')
SET IDENTITY_INSERT [dbo].[vehicle_type] OFF
GO
/****** Object:  Index [employee_FKIndex1]    Script Date: 03-Dec-20 10:56:03 PM ******/
CREATE NONCLUSTERED INDEX [employee_FKIndex1] ON [dbo].[employee]
(
	[city_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [employee_FKIndex2]    Script Date: 03-Dec-20 10:56:03 PM ******/
CREATE NONCLUSTERED INDEX [employee_FKIndex2] ON [dbo].[employee]
(
	[postition_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [customer_has_offer_FKIndex1]    Script Date: 03-Dec-20 10:56:03 PM ******/
CREATE NONCLUSTERED INDEX [customer_has_offer_FKIndex1] ON [dbo].[GenerateReport]
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [customer_has_offer_FKIndex2]    Script Date: 03-Dec-20 10:56:03 PM ******/
CREATE NONCLUSTERED INDEX [customer_has_offer_FKIndex2] ON [dbo].[GenerateReport]
(
	[offer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [model_FKIndex1]    Script Date: 03-Dec-20 10:56:03 PM ******/
CREATE NONCLUSTERED INDEX [model_FKIndex1] ON [dbo].[model]
(
	[vehicle_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [model_FKIndex2]    Script Date: 03-Dec-20 10:56:03 PM ******/
CREATE NONCLUSTERED INDEX [model_FKIndex2] ON [dbo].[model]
(
	[make_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [offer_FKIndex1]    Script Date: 03-Dec-20 10:56:03 PM ******/
CREATE NONCLUSTERED INDEX [offer_FKIndex1] ON [dbo].[offer]
(
	[service_catalog_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [offer_has_task_catalog_FKIndex1]    Script Date: 03-Dec-20 10:56:03 PM ******/
CREATE NONCLUSTERED INDEX [offer_has_task_catalog_FKIndex1] ON [dbo].[offer_task]
(
	[offer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [offer_has_task_catalog_FKIndex2]    Script Date: 03-Dec-20 10:56:03 PM ******/
CREATE NONCLUSTERED INDEX [offer_has_task_catalog_FKIndex2] ON [dbo].[offer_task]
(
	[task_catalog_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [part_FKIndex1]    Script Date: 03-Dec-20 10:56:03 PM ******/
CREATE NONCLUSTERED INDEX [part_FKIndex1] ON [dbo].[part]
(
	[part_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [part_FKIndex2]    Script Date: 03-Dec-20 10:56:03 PM ******/
CREATE NONCLUSTERED INDEX [part_FKIndex2] ON [dbo].[part]
(
	[model_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [repair_shop_FKIndex1]    Script Date: 03-Dec-20 10:56:03 PM ******/
CREATE NONCLUSTERED INDEX [repair_shop_FKIndex1] ON [dbo].[repair_shop]
(
	[city_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [task_catalog_FKIndex1]    Script Date: 03-Dec-20 10:56:03 PM ******/
CREATE NONCLUSTERED INDEX [task_catalog_FKIndex1] ON [dbo].[task_catalog]
(
	[service_catalog_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [task_catalog_FKIndex2]    Script Date: 03-Dec-20 10:56:03 PM ******/
CREATE NONCLUSTERED INDEX [task_catalog_FKIndex2] ON [dbo].[task_catalog]
(
	[part_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [vehicle_FKIndex1]    Script Date: 03-Dec-20 10:56:03 PM ******/
CREATE NONCLUSTERED INDEX [vehicle_FKIndex1] ON [dbo].[vehicle]
(
	[model_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [vehicle_FKIndex2]    Script Date: 03-Dec-20 10:56:03 PM ******/
CREATE NONCLUSTERED INDEX [vehicle_FKIndex2] ON [dbo].[vehicle]
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[employee]  WITH CHECK ADD FOREIGN KEY([city_id])
REFERENCES [dbo].[city] ([id])
GO
ALTER TABLE [dbo].[employee]  WITH CHECK ADD FOREIGN KEY([postition_id])
REFERENCES [dbo].[postition] ([id])
GO
ALTER TABLE [dbo].[employee_account]  WITH CHECK ADD FOREIGN KEY([employee_id])
REFERENCES [dbo].[employee] ([id])
GO
ALTER TABLE [dbo].[GenerateReport]  WITH CHECK ADD FOREIGN KEY([customer_id])
REFERENCES [dbo].[customer] ([id])
GO
ALTER TABLE [dbo].[GenerateReport]  WITH CHECK ADD FOREIGN KEY([offer_id])
REFERENCES [dbo].[offer] ([id])
GO
ALTER TABLE [dbo].[model]  WITH CHECK ADD FOREIGN KEY([make_id])
REFERENCES [dbo].[make] ([id])
GO
ALTER TABLE [dbo].[model]  WITH CHECK ADD FOREIGN KEY([vehicle_type_id])
REFERENCES [dbo].[vehicle_type] ([id])
GO
ALTER TABLE [dbo].[offer]  WITH CHECK ADD FOREIGN KEY([service_catalog_id])
REFERENCES [dbo].[service_catalog] ([id])
GO
ALTER TABLE [dbo].[offer_task]  WITH CHECK ADD FOREIGN KEY([offer_id])
REFERENCES [dbo].[offer] ([id])
GO
ALTER TABLE [dbo].[offer_task]  WITH CHECK ADD FOREIGN KEY([task_catalog_id])
REFERENCES [dbo].[task_catalog] ([id])
GO
ALTER TABLE [dbo].[part]  WITH CHECK ADD FOREIGN KEY([model_id])
REFERENCES [dbo].[model] ([id])
GO
ALTER TABLE [dbo].[part]  WITH CHECK ADD FOREIGN KEY([part_type_id])
REFERENCES [dbo].[part_type] ([id])
GO
ALTER TABLE [dbo].[repair_shop]  WITH CHECK ADD FOREIGN KEY([city_id])
REFERENCES [dbo].[city] ([id])
GO
ALTER TABLE [dbo].[task_catalog]  WITH CHECK ADD FOREIGN KEY([part_id])
REFERENCES [dbo].[part] ([id])
GO
ALTER TABLE [dbo].[task_catalog]  WITH CHECK ADD FOREIGN KEY([service_catalog_id])
REFERENCES [dbo].[service_catalog] ([id])
GO
ALTER TABLE [dbo].[vehicle]  WITH CHECK ADD FOREIGN KEY([customer_id])
REFERENCES [dbo].[customer] ([id])
GO
ALTER TABLE [dbo].[vehicle]  WITH CHECK ADD FOREIGN KEY([model_id])
REFERENCES [dbo].[model] ([id])
GO
/****** Object:  StoredProcedure [dbo].[generate_password_employee]    Script Date: 03-Dec-20 10:56:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[generate_password_employee]
AS
DECLARE @character CHAR = ''
DECLARE @character_number INT = 0
DECLARE @password VARCHAR(100) = ''
DECLARE @length_pass INT = 8
WHILE @length_pass > 0
BEGIN
SET @character_number = ROUND(RAND()*100,0)
SET @character = CHAR(@character_number)
 
IF @character_number > 49 AND @character_number < 120
BEGIN
SET @password += @character
SET @length_pass = @length_pass - 1
END
END
SELECT @password
Insert into employee_account ([password], employee_id) values (@password, (select max(id) from employee))
GO
/****** Object:  StoredProcedure [dbo].[Receipt]    Script Date: 03-Dec-20 10:56:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Receipt] @customer_id int 
AS 
select distinct first_name + ' ' + last_name as customer_name, mobile_number, license_plate, [service_name], offer_price
from (((
		(customer inner join vehicle on customer.id = vehicle.customer_id) 
		inner join GenerateReport on GenerateReport.customer_id = customer.id)
		inner join offer on offer.id = GenerateReport.customer_id)
		inner join service_catalog on service_catalog.id = offer.service_catalog_id)

where customer.id = @customer_id
GO
USE [master]
GO
ALTER DATABASE [Automobile workshop] SET  READ_WRITE 
GO
