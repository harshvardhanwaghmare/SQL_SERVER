USE [master]
GO
/****** Object:  Database [VEHICLE]    Script Date: 17-10-2019 10:18:18 ******/
CREATE DATABASE [VEHICLE]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'VEHICLE', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\VEHICLE.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'VEHICLE_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\VEHICLE_log.ldf' , SIZE = 784KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [VEHICLE] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [VEHICLE].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [VEHICLE] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [VEHICLE] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [VEHICLE] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [VEHICLE] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [VEHICLE] SET ARITHABORT OFF 
GO
ALTER DATABASE [VEHICLE] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [VEHICLE] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [VEHICLE] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [VEHICLE] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [VEHICLE] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [VEHICLE] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [VEHICLE] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [VEHICLE] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [VEHICLE] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [VEHICLE] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [VEHICLE] SET  ENABLE_BROKER 
GO
ALTER DATABASE [VEHICLE] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [VEHICLE] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [VEHICLE] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [VEHICLE] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [VEHICLE] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [VEHICLE] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [VEHICLE] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [VEHICLE] SET RECOVERY FULL 
GO
ALTER DATABASE [VEHICLE] SET  MULTI_USER 
GO
ALTER DATABASE [VEHICLE] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [VEHICLE] SET DB_CHAINING OFF 
GO
ALTER DATABASE [VEHICLE] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [VEHICLE] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [VEHICLE]
GO
/****** Object:  Schema [PRODUCTION]    Script Date: 17-10-2019 10:18:18 ******/
CREATE SCHEMA [PRODUCTION]
GO
/****** Object:  Schema [SALES]    Script Date: 17-10-2019 10:18:18 ******/
CREATE SCHEMA [SALES]
GO
/****** Object:  Table [PRODUCTION].[BRAND]    Script Date: 17-10-2019 10:18:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [PRODUCTION].[BRAND](
	[BRAND_ID] [int] NOT NULL,
	[BRAND_NAME] [varchar](40) NULL,
PRIMARY KEY CLUSTERED 
(
	[BRAND_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [PRODUCTION].[CATEGORIES]    Script Date: 17-10-2019 10:18:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [PRODUCTION].[CATEGORIES](
	[CATEGORY_ID] [int] NOT NULL,
	[CATEGORY_NAME] [varchar](40) NULL,
PRIMARY KEY CLUSTERED 
(
	[CATEGORY_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [PRODUCTION].[PRODUCT]    Script Date: 17-10-2019 10:18:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [PRODUCTION].[PRODUCT](
	[PRODUCT_ID] [int] NOT NULL,
	[PRODUCT_NAME] [varchar](40) NULL,
	[BRAND_ID] [int] NULL,
	[CATEGORY_ID] [int] NULL,
	[MODEL_YEAR] [int] NULL,
	[LIST_PRICE] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PRODUCT_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [PRODUCTION].[STOCKS]    Script Date: 17-10-2019 10:18:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PRODUCTION].[STOCKS](
	[STORE_ID] [int] NULL,
	[PRODUCT_ID] [int] NULL,
	[QUANTITY] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [SALES].[CUSTOMER]    Script Date: 17-10-2019 10:18:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [SALES].[CUSTOMER](
	[CUSTOMER_ID] [int] NOT NULL,
	[FIRST_NAME] [varchar](40) NULL,
	[LAST_NAME] [varchar](40) NULL,
	[PHONE] [varchar](10) NULL,
	[EMAIL] [varchar](40) NULL,
	[STREET] [varchar](40) NULL,
	[CITY] [varchar](40) NULL,
	[STATE] [varchar](40) NULL,
	[ZIP_CODE] [varchar](40) NULL,
PRIMARY KEY CLUSTERED 
(
	[CUSTOMER_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[EMAIL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [SALES].[ORDER_ITEMS]    Script Date: 17-10-2019 10:18:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SALES].[ORDER_ITEMS](
	[ORDER_ID] [int] NULL,
	[ITEM_ID] [int] NOT NULL,
	[PRODUCT_ID] [int] NULL,
	[QUANTITY] [int] NULL,
	[LIST_PRICE] [int] NULL,
	[DISCOUNT] [int] NULL,
	[ITEMS_AMOUNT]  AS ([QUANTITY]*[LIST_PRICE]-[DISCOUNT]),
PRIMARY KEY CLUSTERED 
(
	[ITEM_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [SALES].[ORDERS]    Script Date: 17-10-2019 10:18:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [SALES].[ORDERS](
	[ORDER_ID] [int] NOT NULL,
	[CUSTOMER_ID] [int] NULL,
	[ORDER_STATUS] [varchar](40) NULL,
	[ORDER_DATE] [varchar](40) NULL,
	[REQUIRED_DATE] [date] NULL,
	[SHIPPED_DATE] [date] NULL,
	[STORE_ID] [int] NULL,
	[STAFF_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ORDER_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [SALES].[STAFFS]    Script Date: 17-10-2019 10:18:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [SALES].[STAFFS](
	[STAFF_ID] [int] NOT NULL,
	[FIRST_NAME] [varchar](40) NULL,
	[LAST_NAME] [varchar](40) NULL,
	[EMAIL] [varchar](40) NULL,
	[PHONE] [varchar](40) NULL,
	[ACTIVE] [varchar](40) NULL,
	[STORE_ID] [int] NULL,
	[MANAGER_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[STAFF_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[EMAIL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[PHONE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [SALES].[STORE]    Script Date: 17-10-2019 10:18:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [SALES].[STORE](
	[STORE_ID] [int] NOT NULL,
	[STORE_NAME] [varchar](40) NULL,
	[PHONE] [varchar](40) NULL,
	[STREET] [varchar](40) NULL,
	[CITY] [varchar](40) NULL,
	[STATE] [varchar](40) NULL,
	[ZIP_CODE] [varchar](40) NULL,
PRIMARY KEY CLUSTERED 
(
	[STORE_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [PRODUCTION].[PRODUCT]  WITH CHECK ADD  CONSTRAINT [FK_BR_ID] FOREIGN KEY([BRAND_ID])
REFERENCES [PRODUCTION].[BRAND] ([BRAND_ID])
GO
ALTER TABLE [PRODUCTION].[PRODUCT] CHECK CONSTRAINT [FK_BR_ID]
GO
ALTER TABLE [PRODUCTION].[PRODUCT]  WITH CHECK ADD  CONSTRAINT [FK_CT_ID] FOREIGN KEY([CATEGORY_ID])
REFERENCES [PRODUCTION].[CATEGORIES] ([CATEGORY_ID])
GO
ALTER TABLE [PRODUCTION].[PRODUCT] CHECK CONSTRAINT [FK_CT_ID]
GO
ALTER TABLE [PRODUCTION].[STOCKS]  WITH CHECK ADD  CONSTRAINT [FK_PR_ID] FOREIGN KEY([PRODUCT_ID])
REFERENCES [PRODUCTION].[PRODUCT] ([PRODUCT_ID])
GO
ALTER TABLE [PRODUCTION].[STOCKS] CHECK CONSTRAINT [FK_PR_ID]
GO
ALTER TABLE [PRODUCTION].[STOCKS]  WITH CHECK ADD  CONSTRAINT [FK_ST_ID] FOREIGN KEY([STORE_ID])
REFERENCES [SALES].[STORE] ([STORE_ID])
GO
ALTER TABLE [PRODUCTION].[STOCKS] CHECK CONSTRAINT [FK_ST_ID]
GO
ALTER TABLE [SALES].[ORDER_ITEMS]  WITH CHECK ADD  CONSTRAINT [FK_OR_ID] FOREIGN KEY([ORDER_ID])
REFERENCES [SALES].[ORDERS] ([ORDER_ID])
GO
ALTER TABLE [SALES].[ORDER_ITEMS] CHECK CONSTRAINT [FK_OR_ID]
GO
ALTER TABLE [SALES].[ORDER_ITEMS]  WITH CHECK ADD  CONSTRAINT [FK_PR_ID] FOREIGN KEY([PRODUCT_ID])
REFERENCES [PRODUCTION].[PRODUCT] ([PRODUCT_ID])
GO
ALTER TABLE [SALES].[ORDER_ITEMS] CHECK CONSTRAINT [FK_PR_ID]
GO
ALTER TABLE [SALES].[ORDERS]  WITH CHECK ADD  CONSTRAINT [FK_CT_ID] FOREIGN KEY([CUSTOMER_ID])
REFERENCES [SALES].[CUSTOMER] ([CUSTOMER_ID])
GO
ALTER TABLE [SALES].[ORDERS] CHECK CONSTRAINT [FK_CT_ID]
GO
ALTER TABLE [SALES].[ORDERS]  WITH CHECK ADD  CONSTRAINT [FK_SF_ID] FOREIGN KEY([STAFF_ID])
REFERENCES [SALES].[STAFFS] ([STAFF_ID])
GO
ALTER TABLE [SALES].[ORDERS] CHECK CONSTRAINT [FK_SF_ID]
GO
ALTER TABLE [SALES].[ORDERS]  WITH CHECK ADD  CONSTRAINT [FK_ST_ID1] FOREIGN KEY([STORE_ID])
REFERENCES [SALES].[STORE] ([STORE_ID])
GO
ALTER TABLE [SALES].[ORDERS] CHECK CONSTRAINT [FK_ST_ID1]
GO
ALTER TABLE [SALES].[STAFFS]  WITH CHECK ADD  CONSTRAINT [FK_ST_ID] FOREIGN KEY([STORE_ID])
REFERENCES [SALES].[STORE] ([STORE_ID])
GO
ALTER TABLE [SALES].[STAFFS] CHECK CONSTRAINT [FK_ST_ID]
GO
ALTER TABLE [SALES].[ORDER_ITEMS]  WITH CHECK ADD CHECK  (([LIST_PRICE]>(0)))
GO
ALTER TABLE [SALES].[ORDER_ITEMS]  WITH CHECK ADD CHECK  (([QUANTITY]>(0)))
GO
USE [master]
GO
ALTER DATABASE [VEHICLE] SET  READ_WRITE 
GO
