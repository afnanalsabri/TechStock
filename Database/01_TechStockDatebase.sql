USE [master]
GO
/****** Object:  Database [TechStock_Inventory]    Script Date: 10/16/2026 12:26:54 AM ******/
CREATE DATABASE [TechStock_Inventory]
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TechStock_Inventory].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TechStock_Inventory] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TechStock_Inventory] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TechStock_Inventory] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TechStock_Inventory] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TechStock_Inventory] SET ARITHABORT OFF 
GO
ALTER DATABASE [TechStock_Inventory] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TechStock_Inventory] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TechStock_Inventory] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TechStock_Inventory] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TechStock_Inventory] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TechStock_Inventory] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TechStock_Inventory] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TechStock_Inventory] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TechStock_Inventory] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TechStock_Inventory] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TechStock_Inventory] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TechStock_Inventory] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TechStock_Inventory] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TechStock_Inventory] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TechStock_Inventory] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TechStock_Inventory] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TechStock_Inventory] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TechStock_Inventory] SET RECOVERY FULL 
GO
ALTER DATABASE [TechStock_Inventory] SET  MULTI_USER 
GO
ALTER DATABASE [TechStock_Inventory] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TechStock_Inventory] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TechStock_Inventory] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TechStock_Inventory] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TechStock_Inventory] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TechStock_Inventory', N'ON'
GO
ALTER DATABASE [TechStock_Inventory] SET QUERY_STORE = OFF
GO
USE [TechStock_Inventory]
GO
/****** Object:  Table [dbo].[category_table]    Script Date: 10/16/2026 12:26:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category_table](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [nvarchar](150) NOT NULL,
	[description] [text] NULL,
 CONSTRAINT [PK_category_table] PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[department_table]    Script Date: 10/16/2026 12:26:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[department_table](
	[department_id] [int] IDENTITY(1,1) NOT NULL,
	[department_name] [nvarchar](150) NOT NULL,
	[description] [text] NULL,
	[is_active] [bit] NULL,
 CONSTRAINT [PK_department_table] PRIMARY KEY CLUSTERED 
(
	[department_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[login_history_table]    Script Date: 10/16/2026 12:26:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[login_history_table](
	[login_history_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[login_time] [datetime] NULL,
	[is_successful] [bit] NULL,
 CONSTRAINT [PK_login_history_table] PRIMARY KEY CLUSTERED 
(
	[login_history_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_table]    Script Date: 10/16/2026 12:26:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_table](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[product_name] [nvarchar](150) NOT NULL,
	[SKU] [nvarchar](250) NOT NULL,
	[description] [text] NULL,
	[category_id] [int] NULL,
	[unit_cost] [decimal](18, 0) NULL,
	[unit] [nvarchar](50) NULL,
	[current_stock] [decimal](18, 2) NULL,
	[minimum_stock] [decimal](18, 2) NULL,
	[is_active] [bit] NULL,
	[created_at] [datetime] NULL,
 CONSTRAINT [PK_product_table] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_product_table] UNIQUE NONCLUSTERED 
(
	[SKU] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roles_table]    Script Date: 10/16/2026 12:26:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles_table](
	[role_id] [int] IDENTITY(1,1) NOT NULL,
	[role_name] [nvarchar](50) NOT NULL,
	[describtion] [text] NULL,
 CONSTRAINT [PK_roles_table] PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[stock_transaction_details_table]    Script Date: 10/16/2026 12:26:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stock_transaction_details_table](
	[transaction_detail_id] [int] IDENTITY(1,1) NOT NULL,
	[transaction_id] [int] NULL,
	[product_id] [int] NULL,
	[quantity] [decimal](18, 2) NULL,
	[unit_cost] [decimal](18, 2) NULL,
 CONSTRAINT [PK_stock_transaction_details_table] PRIMARY KEY CLUSTERED 
(
	[transaction_detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[stock_transactions_table]    Script Date: 10/16/2026 12:26:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stock_transactions_table](
	[transaction_id] [int] IDENTITY(1,1) NOT NULL,
	[transaction_type] [nvarchar](150) NULL,
	[transaction_date] [datetime] NULL,
	[reference_number] [nvarchar](350) NULL,
	[supplier_id] [int] NULL,
	[department_id] [int] NULL,
	[created_by_user_id] [int] NULL,
	[note] [text] NULL,
 CONSTRAINT [PK_stock_transactions_table] PRIMARY KEY CLUSTERED 
(
	[transaction_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[supplier_table]    Script Date: 10/16/2026 12:26:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[supplier_table](
	[supplier_id] [int] IDENTITY(1,1) NOT NULL,
	[supplier_name] [nvarchar](150) NULL,
	[phone] [nvarchar](50) NULL,
	[email] [nvarchar](100) NULL,
	[is_active] [bit] NULL,
 CONSTRAINT [PK_supplier_table] PRIMARY KEY CLUSTERED 
(
	[supplier_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users_table]    Script Date: 10/16/2026 12:26:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users_table](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[user_name] [varchar](50) NOT NULL,
	[full_name] [varchar](150) NOT NULL,
	[pass_word] [varchar](550) NOT NULL,
	[role_id] [int] NULL,
	[is_active] [bit] NULL,
	[created_at] [datetime] NULL,
 CONSTRAINT [PK_users_table] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_users_table] UNIQUE NONCLUSTERED 
(
	[user_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[department_table] ADD  CONSTRAINT [DF_department_table_is_active]  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[product_table] ADD  CONSTRAINT [DF_product_table_is_active]  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[supplier_table] ADD  CONSTRAINT [DF_supplier_table_is_active]  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[users_table] ADD  CONSTRAINT [DF_users_table_is_active]  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[users_table] ADD  CONSTRAINT [DF_users_table_created_at]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[login_history_table]  WITH CHECK ADD  CONSTRAINT [FK_login_history_table_users_table] FOREIGN KEY([user_id])
REFERENCES [dbo].[users_table] ([user_id])
GO
ALTER TABLE [dbo].[login_history_table] CHECK CONSTRAINT [FK_login_history_table_users_table]
GO
ALTER TABLE [dbo].[product_table]  WITH CHECK ADD  CONSTRAINT [FK_product_table_category_table] FOREIGN KEY([category_id])
REFERENCES [dbo].[category_table] ([category_id])
GO
ALTER TABLE [dbo].[product_table] CHECK CONSTRAINT [FK_product_table_category_table]
GO
ALTER TABLE [dbo].[stock_transaction_details_table]  WITH CHECK ADD  CONSTRAINT [FK_stock_transaction_details_table_product_table] FOREIGN KEY([product_id])
REFERENCES [dbo].[product_table] ([product_id])
GO
ALTER TABLE [dbo].[stock_transaction_details_table] CHECK CONSTRAINT [FK_stock_transaction_details_table_product_table]
GO
ALTER TABLE [dbo].[stock_transaction_details_table]  WITH CHECK ADD  CONSTRAINT [FK_stock_transaction_details_table_stock_transactions_table] FOREIGN KEY([transaction_id])
REFERENCES [dbo].[stock_transactions_table] ([transaction_id])
GO
ALTER TABLE [dbo].[stock_transaction_details_table] CHECK CONSTRAINT [FK_stock_transaction_details_table_stock_transactions_table]
GO
ALTER TABLE [dbo].[stock_transactions_table]  WITH CHECK ADD  CONSTRAINT [FK_stock_transactions_table_department_table] FOREIGN KEY([department_id])
REFERENCES [dbo].[department_table] ([department_id])
GO
ALTER TABLE [dbo].[stock_transactions_table] CHECK CONSTRAINT [FK_stock_transactions_table_department_table]
GO
ALTER TABLE [dbo].[stock_transactions_table]  WITH CHECK ADD  CONSTRAINT [FK_stock_transactions_table_supplier_table] FOREIGN KEY([supplier_id])
REFERENCES [dbo].[supplier_table] ([supplier_id])
GO
ALTER TABLE [dbo].[stock_transactions_table] CHECK CONSTRAINT [FK_stock_transactions_table_supplier_table]
GO
ALTER TABLE [dbo].[stock_transactions_table]  WITH CHECK ADD  CONSTRAINT [FK_stock_transactions_table_users_table] FOREIGN KEY([created_by_user_id])
REFERENCES [dbo].[users_table] ([user_id])
GO
ALTER TABLE [dbo].[stock_transactions_table] CHECK CONSTRAINT [FK_stock_transactions_table_users_table]
GO
ALTER TABLE [dbo].[users_table]  WITH CHECK ADD  CONSTRAINT [FK_users_table_roles_table1] FOREIGN KEY([role_id])
REFERENCES [dbo].[roles_table] ([role_id])
GO
ALTER TABLE [dbo].[users_table] CHECK CONSTRAINT [FK_users_table_roles_table1]
GO
ALTER TABLE [dbo].[stock_transaction_details_table]  WITH CHECK ADD  CONSTRAINT [CK_StockTransactionDetails_Quantity] CHECK  (([quantity]>(0)))
GO
ALTER TABLE [dbo].[stock_transaction_details_table] CHECK CONSTRAINT [CK_StockTransactionDetails_Quantity]
GO
USE [master]
GO
ALTER DATABASE [TechStock_Inventory] SET  READ_WRITE 
GO
