USE [master]

go

CREATE DATABASE [Management] containment = none ON PRIMARY ( NAME =
N'Management', filename =
N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLSERVER\MSSQL\DATA\Management.mdf'
, size = 8192kb, maxsize = unlimited, filegrowth = 65536kb ) log ON ( NAME =
N'Management_log', filename =
N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLSERVER\MSSQL\DATA\Management_log.ldf'
, size = 8192kb, maxsize = 2048gb, filegrowth = 65536kb ) WITH catalog_collation
= database_default, ledger = OFF

go

ALTER DATABASE [Management]

SET compatibility_level = 160

go

IF ( 1 = Fulltextserviceproperty('IsFullTextInstalled') )
  BEGIN
      EXEC [Management].[dbo].[Sp_fulltext_database]
        @action = 'enable'
  END

go

ALTER DATABASE [Management]

SET ansi_null_default OFF

go

ALTER DATABASE [Management]

SET ansi_nulls OFF

go

ALTER DATABASE [Management]

SET ansi_padding OFF

go

ALTER DATABASE [Management]

SET ansi_warnings OFF

go

ALTER DATABASE [Management]

SET arithabort OFF

go

ALTER DATABASE [Management]

SET auto_close OFF

go

ALTER DATABASE [Management]

SET auto_shrink OFF

go

ALTER DATABASE [Management]

SET auto_update_statistics ON

go

ALTER DATABASE [Management]

SET cursor_close_on_commit OFF

go

ALTER DATABASE [Management]

SET cursor_default global

go

ALTER DATABASE [Management]

SET concat_null_yields_null OFF

go

ALTER DATABASE [Management]

SET numeric_roundabort OFF

go

ALTER DATABASE [Management]

SET quoted_identifier OFF

go

ALTER DATABASE [Management]

SET recursive_triggers OFF

go

ALTER DATABASE [Management]

SET disable_broker

go

ALTER DATABASE [Management]

SET auto_update_statistics_async OFF

go

ALTER DATABASE [Management]

SET date_correlation_optimization OFF

go

ALTER DATABASE [Management]

SET trustworthy OFF

go

ALTER DATABASE [Management]

SET allow_snapshot_isolation OFF

go

ALTER DATABASE [Management]

SET parameterization simple

go

ALTER DATABASE [Management]

SET read_committed_snapshot OFF

go

ALTER DATABASE [Management]

SET honor_broker_priority OFF

go

ALTER DATABASE [Management]

SET recovery FULL

go

ALTER DATABASE [Management]

SET multi_user

go

ALTER DATABASE [Management]

SET page_verify checksum

go

ALTER DATABASE [Management]

SET db_chaining OFF

go

ALTER DATABASE [Management]

SET filestream( non_transacted_access = OFF )

go

ALTER DATABASE [Management]

SET target_recovery_time = 60 seconds

go

ALTER DATABASE [Management]

SET delayed_durability = disabled

go

ALTER DATABASE [Management]

SET accelerated_database_recovery = OFF

go

EXEC sys.Sp_db_vardecimal_storage_format
  N'Management',
  N'ON'

go

ALTER DATABASE [Management]

SET query_store = ON

go

ALTER DATABASE [Management]

SET query_store (operation_mode = read_write, cleanup_policy = (
stale_query_threshold_days = 30), data_flush_interval_seconds = 900,
interval_length_minutes = 60, max_storage_size_mb = 1000, query_capture_mode =
auto, size_based_cleanup_mode = auto, max_plans_per_query = 200,
wait_stats_capture_mode = ON)

go

USE [Management]

go

SET ansi_nulls ON

go

SET quoted_identifier ON

go

CREATE TABLE [dbo].[address]
  (
     [id]      [INT] IDENTITY(1, 1) NOT NULL,
     [street]  [VARCHAR](255) NULL,
     [id_city] [INT] NOT NULL,
     CONSTRAINT [PK__Address__3213E83FEF19DD55] PRIMARY KEY CLUSTERED ( [id] ASC
     )WITH (pad_index = OFF, statistics_norecompute = OFF, ignore_dup_key = OFF,
     allow_row_locks = on, allow_page_locks = on, optimize_for_sequential_key =
     OFF) ON [PRIMARY]
  )
ON [PRIMARY]

go

SET ansi_nulls ON

go

SET quoted_identifier ON

go

CREATE TABLE [dbo].[category]
  (
     [id]   [INT] IDENTITY(1, 1) NOT NULL,
     [name] [VARCHAR](255) NULL,
     CONSTRAINT [PK__Category__3213E83F075AA918] PRIMARY KEY CLUSTERED ( [id]
     ASC )WITH (pad_index = OFF, statistics_norecompute = OFF, ignore_dup_key =
     OFF, allow_row_locks = on, allow_page_locks = on,
     optimize_for_sequential_key = OFF) ON [PRIMARY]
  )
ON [PRIMARY]

go

SET ansi_nulls ON

go

SET quoted_identifier ON

go

CREATE TABLE [dbo].[city]
  (
     [id]        [INT] IDENTITY(1, 1) NOT NULL,
     [name]      [VARCHAR](255) NULL,
     [id_region] [INT] NOT NULL,
     CONSTRAINT [PK__City__3213E83F38B8835B] PRIMARY KEY CLUSTERED ( [id] ASC )
     WITH (pad_index = OFF, statistics_norecompute = OFF, ignore_dup_key = OFF,
     allow_row_locks = on, allow_page_locks = on, optimize_for_sequential_key =
     OFF) ON [PRIMARY]
  )
ON [PRIMARY]

go

/****** Object:  Table [dbo].[Country]    Script Date: 20.01.2024 14:18:36 ******/
SET ansi_nulls ON

go

SET quoted_identifier ON

go

CREATE TABLE [dbo].[country]
  (
     [id]   [INT] IDENTITY(1, 1) NOT NULL,
     [name] [VARCHAR](255) NULL,
     CONSTRAINT [PK__Country__3213E83F51DA1D54] PRIMARY KEY CLUSTERED ( [id] ASC
     )WITH (pad_index = OFF, statistics_norecompute = OFF, ignore_dup_key = OFF,
     allow_row_locks = on, allow_page_locks = on, optimize_for_sequential_key =
     OFF) ON [PRIMARY]
  )
ON [PRIMARY]

go


SET ansi_nulls ON

go

SET quoted_identifier ON

go

CREATE TABLE [dbo].[delivery]
  (
     [id]               [INT] IDENTITY(1, 1) NOT NULL,
     [id_product]       [INT] NOT NULL,
     [id_supplier]      [INT] NOT NULL,
     [price]            [DECIMAL](10, 2) NULL,
     [quantity]         [INT] NULL,
     [date_of_delivery] [DATE] NULL,
     CONSTRAINT [PK__Delivery__3213E83F0B5383A4] PRIMARY KEY CLUSTERED ( [id]
     ASC )WITH (pad_index = OFF, statistics_norecompute = OFF, ignore_dup_key =
     OFF, allow_row_locks = on, allow_page_locks = on,
     optimize_for_sequential_key = OFF) ON [PRIMARY]
  )
ON [PRIMARY]

go


SET ansi_nulls ON

go

SET quoted_identifier ON

go

CREATE TABLE [dbo].[markup]
  (
     [id]         [INT] IDENTITY(1, 1) NOT NULL,
     [name]       [VARCHAR](255) NULL,
     [percentage] [DECIMAL](5, 2) NULL,
     CONSTRAINT [PK__Markup__3213E83F845AE9BB] PRIMARY KEY CLUSTERED ( [id] ASC
     )WITH (pad_index = OFF, statistics_norecompute = OFF, ignore_dup_key = OFF,
     allow_row_locks = on, allow_page_locks = on, optimize_for_sequential_key =
     OFF) ON [PRIMARY]
  )
ON [PRIMARY]

go


SET ansi_nulls ON

go

SET quoted_identifier ON

go

CREATE TABLE [dbo].[measurement]
  (
     [id]          [INT] IDENTITY(1, 1) NOT NULL,
     [name]        [VARCHAR](255) NULL,
     [description] [VARCHAR](255) NULL,
     CONSTRAINT [PK__Measurem__3213E83FA1C46838] PRIMARY KEY CLUSTERED ( [id]
     ASC )WITH (pad_index = OFF, statistics_norecompute = OFF, ignore_dup_key =
     OFF, allow_row_locks = on, allow_page_locks = on,
     optimize_for_sequential_key = OFF) ON [PRIMARY]
  )
ON [PRIMARY]

go

SET ansi_nulls ON

go

SET quoted_identifier ON

go

CREATE TABLE [dbo].[producer]
  (
     [id]         [INT] IDENTITY(1, 1) NOT NULL,
     [name]       [VARCHAR](255) NULL,
     [id_address] [INT] NOT NULL,
     CONSTRAINT [PK__Producer__3213E83FB842F569] PRIMARY KEY CLUSTERED ( [id]
     ASC )WITH (pad_index = OFF, statistics_norecompute = OFF, ignore_dup_key =
     OFF, allow_row_locks = on, allow_page_locks = on,
     optimize_for_sequential_key = OFF) ON [PRIMARY]
  )
ON [PRIMARY]

go


SET ansi_nulls ON

go

SET quoted_identifier ON

go

CREATE TABLE [dbo].[product]
  (
     [id]             [INT] IDENTITY(1, 1) NOT NULL,
     [name]           [VARCHAR](255) NULL,
     [id_category]    [INT] NOT NULL,
     [price]          [DECIMAL](10, 2) NULL,
     [quantity]       [INT] NULL,
     [id_producer]    [INT] NOT NULL,
     [id_measurement] [INT] NOT NULL,
     [id_markup]      [INT] NOT NULL,
     CONSTRAINT [PK__Product__3213E83F0C2832BC] PRIMARY KEY CLUSTERED ( [id] ASC
     )WITH (pad_index = OFF, statistics_norecompute = OFF, ignore_dup_key = OFF,
     allow_row_locks = on, allow_page_locks = on, optimize_for_sequential_key =
     OFF) ON [PRIMARY]
  )
ON [PRIMARY]

go


SET ansi_nulls ON

go

SET quoted_identifier ON

go

CREATE TABLE [dbo].[region]
  (
     [id]         [INT] IDENTITY(1, 1) NOT NULL,
     [name]       [VARCHAR](255) NULL,
     [id_country] [INT] NOT NULL,
     CONSTRAINT [PK__Region__3213E83F5EFBCBB3] PRIMARY KEY CLUSTERED ( [id] ASC
     )WITH (pad_index = OFF, statistics_norecompute = OFF, ignore_dup_key = OFF,
     allow_row_locks = on, allow_page_locks = on, optimize_for_sequential_key =
     OFF) ON [PRIMARY]
  )
ON [PRIMARY]

go


SET ansi_nulls ON

go

SET quoted_identifier ON

go

CREATE TABLE [dbo].[sale]
  (
     [id]           [INT] IDENTITY(1, 1) NOT NULL,
     [id_product]   [INT] NOT NULL,
     [price]        [DECIMAL](10, 2) NULL,
     [quantity]     [INT] NULL,
     [date_of_sale] [DATE] NULL,
     CONSTRAINT [PK__Sale__3213E83FF76A3575] PRIMARY KEY CLUSTERED ( [id] ASC )
     WITH (pad_index = OFF, statistics_norecompute = OFF, ignore_dup_key = OFF,
     allow_row_locks = on, allow_page_locks = on, optimize_for_sequential_key =
     OFF) ON [PRIMARY]
  )
ON [PRIMARY]

go


SET ansi_nulls ON

go

SET quoted_identifier ON

go

CREATE TABLE [dbo].[supplier]
  (
     [id]         [INT] IDENTITY(1, 1) NOT NULL,
     [name]       [VARCHAR](255) NULL,
     [id_address] [INT] NOT NULL,
     CONSTRAINT [PK__Supplier__3213E83FA33A852E] PRIMARY KEY CLUSTERED ( [id]
     ASC )WITH (pad_index = OFF, statistics_norecompute = OFF, ignore_dup_key =
     OFF, allow_row_locks = on, allow_page_locks = on,
     optimize_for_sequential_key = OFF) ON [PRIMARY]
  )
ON [PRIMARY]

go

SET IDENTITY_INSERT [dbo].[Address] ON

INSERT [dbo].[address]
       ([id],
        [street],
        [id_city])
VALUES (25,
        N'Baker Street 221B',
        25)

INSERT [dbo].[address]
       ([id],
        [street],
        [id_city])
VALUES (26,
        N'Privet Drive 4',
        26)

INSERT [dbo].[address]
       ([id],
        [street],
        [id_city])
VALUES (27,
        N'Wall Street',
        27)

INSERT [dbo].[address]
       ([id],
        [street],
        [id_city])
VALUES (28,
        N'Fifth Avenue',
        28)

INSERT [dbo].[address]
       ([id],
        [street],
        [id_city])
VALUES (29,
        N'Abbey Road',
        29)

INSERT [dbo].[address]
       ([id],
        [street],
        [id_city])
VALUES (30,
        N'Elm Street',
        30)

SET IDENTITY_INSERT [dbo].[Address] OFF

go

SET IDENTITY_INSERT [dbo].[Category] ON

INSERT [dbo].[category]
       ([id],
        [name])
VALUES (25,
        N'Electronics')

INSERT [dbo].[category]
       ([id],
        [name])
VALUES (26,
        N'Books')

INSERT [dbo].[category]
       ([id],
        [name])
VALUES (27,
        N'Clothing')

INSERT [dbo].[category]
       ([id],
        [name])
VALUES (28,
        N'Groceries')

INSERT [dbo].[category]
       ([id],
        [name])
VALUES (29,
        N'Furniture')

INSERT [dbo].[category]
       ([id],
        [name])
VALUES (30,
        N'Toys')

SET IDENTITY_INSERT [dbo].[Category] OFF

go

SET IDENTITY_INSERT [dbo].[City] ON

INSERT [dbo].[city]
       ([id],
        [name],
        [id_region])
VALUES (25,
        N'Paris',
        25)

INSERT [dbo].[city]
       ([id],
        [name],
        [id_region])
VALUES (26,
        N'London',
        26)

INSERT [dbo].[city]
       ([id],
        [name],
        [id_region])
VALUES (27,
        N'New York',
        27)

INSERT [dbo].[city]
       ([id],
        [name],
        [id_region])
VALUES (28,
        N'Tokyo',
        28)

INSERT [dbo].[city]
       ([id],
        [name],
        [id_region])
VALUES (29,
        N'Sydney',
        29)

INSERT [dbo].[city]
       ([id],
        [name],
        [id_region])
VALUES (30,
        N'Moscow',
        30)

SET IDENTITY_INSERT [dbo].[City] OFF

go

SET IDENTITY_INSERT [dbo].[Country] ON

INSERT [dbo].[country]
       ([id],
        [name])
VALUES (25,
        N'France')

INSERT [dbo].[country]
       ([id],
        [name])
VALUES (26,
        N'United Kingdom')

INSERT [dbo].[country]
       ([id],
        [name])
VALUES (27,
        N'United States')

INSERT [dbo].[country]
       ([id],
        [name])
VALUES (28,
        N'Japan')

INSERT [dbo].[country]
       ([id],
        [name])
VALUES (29,
        N'Australia')

INSERT [dbo].[country]
       ([id],
        [name])
VALUES (30,
        N'Russia')

SET IDENTITY_INSERT [dbo].[Country] OFF

go

SET IDENTITY_INSERT [dbo].[Delivery] ON

INSERT [dbo].[delivery]
       ([id],
        [id_product],
        [id_supplier],
        [price],
        [quantity],
        [date_of_delivery])
VALUES (31,
        25,
        25,
        Cast(100.00 AS DECIMAL(10, 2)),
        50,
        Cast(N'2024-01-01' AS DATE))

INSERT [dbo].[delivery]
       ([id],
        [id_product],
        [id_supplier],
        [price],
        [quantity],
        [date_of_delivery])
VALUES (32,
        26,
        26,
        Cast(200.00 AS DECIMAL(10, 2)),
        40,
        Cast(N'2024-02-01' AS DATE))

INSERT [dbo].[delivery]
       ([id],
        [id_product],
        [id_supplier],
        [price],
        [quantity],
        [date_of_delivery])
VALUES (33,
        27,
        27,
        Cast(150.00 AS DECIMAL(10, 2)),
        60,
        Cast(N'2024-03-01' AS DATE))

INSERT [dbo].[delivery]
       ([id],
        [id_product],
        [id_supplier],
        [price],
        [quantity],
        [date_of_delivery])
VALUES (34,
        28,
        28,
        Cast(120.00 AS DECIMAL(10, 2)),
        70,
        Cast(N'2024-04-01' AS DATE))

INSERT [dbo].[delivery]
       ([id],
        [id_product],
        [id_supplier],
        [price],
        [quantity],
        [date_of_delivery])
VALUES (35,
        29,
        29,
        Cast(180.00 AS DECIMAL(10, 2)),
        80,
        Cast(N'2024-05-01' AS DATE))

INSERT [dbo].[delivery]
       ([id],
        [id_product],
        [id_supplier],
        [price],
        [quantity],
        [date_of_delivery])
VALUES (36,
        30,
        30,
        Cast(210.00 AS DECIMAL(10, 2)),
        90,
        Cast(N'2024-06-01' AS DATE))

SET IDENTITY_INSERT [dbo].[Delivery] OFF

go

SET IDENTITY_INSERT [dbo].[Markup] ON

INSERT [dbo].[markup]
       ([id],
        [name],
        [percentage])
VALUES (25,
        N'Electronics Markup',
        Cast(15.00 AS DECIMAL(5, 2)))

INSERT [dbo].[markup]
       ([id],
        [name],
        [percentage])
VALUES (26,
        N'Books Markup',
        Cast(10.00 AS DECIMAL(5, 2)))

INSERT [dbo].[markup]
       ([id],
        [name],
        [percentage])
VALUES (27,
        N'Clothing Markup',
        Cast(20.00 AS DECIMAL(5, 2)))

INSERT [dbo].[markup]
       ([id],
        [name],
        [percentage])
VALUES (28,
        N'Groceries Markup',
        Cast(5.00 AS DECIMAL(5, 2)))

INSERT [dbo].[markup]
       ([id],
        [name],
        [percentage])
VALUES (29,
        N'Furniture Markup',
        Cast(25.00 AS DECIMAL(5, 2)))

INSERT [dbo].[markup]
       ([id],
        [name],
        [percentage])
VALUES (30,
        N'Toys Markup',
        Cast(30.00 AS DECIMAL(5, 2)))

SET IDENTITY_INSERT [dbo].[Markup] OFF

go

SET IDENTITY_INSERT [dbo].[Measurement] ON

INSERT [dbo].[measurement]
       ([id],
        [name],
        [description])
VALUES (25,
        N'Kilogram',
        N'Weight measurement')

INSERT [dbo].[measurement]
       ([id],
        [name],
        [description])
VALUES (26,
        N'Meter',
        N'Length measurement')

INSERT [dbo].[measurement]
       ([id],
        [name],
        [description])
VALUES (27,
        N'Liter',
        N'Volume measurement')

INSERT [dbo].[measurement]
       ([id],
        [name],
        [description])
VALUES (28,
        N'Square Meter',
        N'Area measurement')

INSERT [dbo].[measurement]
       ([id],
        [name],
        [description])
VALUES (29,
        N'Cubic Meter',
        N'Space measurement')

INSERT [dbo].[measurement]
       ([id],
        [name],
        [description])
VALUES (30,
        N'Piece',
        N'Count measurement')

SET IDENTITY_INSERT [dbo].[Measurement] OFF

go

SET IDENTITY_INSERT [dbo].[Producer] ON

INSERT [dbo].[producer]
       ([id],
        [name],
        [id_address])
VALUES (25,
        N'Apple Inc.',
        25)

INSERT [dbo].[producer]
       ([id],
        [name],
        [id_address])
VALUES (26,
        N'Samsung',
        26)

INSERT [dbo].[producer]
       ([id],
        [name],
        [id_address])
VALUES (27,
        N'Sony',
        27)

INSERT [dbo].[producer]
       ([id],
        [name],
        [id_address])
VALUES (28,
        N'LG',
        28)

INSERT [dbo].[producer]
       ([id],
        [name],
        [id_address])
VALUES (29,
        N'Panasonic',
        29)

INSERT [dbo].[producer]
       ([id],
        [name],
        [id_address])
VALUES (30,
        N'Philips',
        30)

SET IDENTITY_INSERT [dbo].[Producer] OFF

go

SET IDENTITY_INSERT [dbo].[Product] ON

INSERT [dbo].[product]
       ([id],
        [name],
        [id_category],
        [price],
        [quantity],
        [id_producer],
        [id_measurement],
        [id_markup])
VALUES (25,
        N'iPhone',
        25,
        Cast(1000.00 AS DECIMAL(10, 2)),
        100,
        25,
        30,
        25)

INSERT [dbo].[product]
       ([id],
        [name],
        [id_category],
        [price],
        [quantity],
        [id_producer],
        [id_measurement],
        [id_markup])
VALUES (26,
        N'Galaxy',
        25,
        Cast(900.00 AS DECIMAL(10, 2)),
        200,
        26,
        30,
        25)

INSERT [dbo].[product]
       ([id],
        [name],
        [id_category],
        [price],
        [quantity],
        [id_producer],
        [id_measurement],
        [id_markup])
VALUES (27,
        N'PlayStation',
        25,
        Cast(500.00 AS DECIMAL(10, 2)),
        300,
        27,
        30,
        25)

INSERT [dbo].[product]
       ([id],
        [name],
        [id_category],
        [price],
        [quantity],
        [id_producer],
        [id_measurement],
        [id_markup])
VALUES (28,
        N'OLED TV',
        25,
        Cast(1500.00 AS DECIMAL(10, 2)),
        400,
        28,
        30,
        25)

INSERT [dbo].[product]
       ([id],
        [name],
        [id_category],
        [price],
        [quantity],
        [id_producer],
        [id_measurement],
        [id_markup])
VALUES (29,
        N'Lumix Camera',
        25,
        Cast(800.00 AS DECIMAL(10, 2)),
        500,
        29,
        30,
        25)

INSERT [dbo].[product]
       ([id],
        [name],
        [id_category],
        [price],
        [quantity],
        [id_producer],
        [id_measurement],
        [id_markup])
VALUES (30,
        N'Airfryer',
        25,
        Cast(200.00 AS DECIMAL(10, 2)),
        600,
        30,
        30,
        25)

SET IDENTITY_INSERT [dbo].[Product] OFF

go

SET IDENTITY_INSERT [dbo].[Region] ON

INSERT [dbo].[region]
       ([id],
        [name],
        [id_country])
VALUES (25,
        N'Ile-de-France',
        25)

INSERT [dbo].[region]
       ([id],
        [name],
        [id_country])
VALUES (26,
        N'England',
        26)

INSERT [dbo].[region]
       ([id],
        [name],
        [id_country])
VALUES (27,
        N'New York State',
        27)

INSERT [dbo].[region]
       ([id],
        [name],
        [id_country])
VALUES (28,
        N'Kanto',
        28)

INSERT [dbo].[region]
       ([id],
        [name],
        [id_country])
VALUES (29,
        N'New South Wales',
        29)

INSERT [dbo].[region]
       ([id],
        [name],
        [id_country])
VALUES (30,
        N'Central Federal District',
        30)

SET IDENTITY_INSERT [dbo].[Region] OFF

go

SET IDENTITY_INSERT [dbo].[Sale] ON

INSERT [dbo].[sale]
       ([id],
        [id_product],
        [price],
        [quantity],
        [date_of_sale])
VALUES (25,
        25,
        Cast(1100.00 AS DECIMAL(10, 2)),
        50,
        Cast(N'2024-01-01' AS DATE))

INSERT [dbo].[sale]
       ([id],
        [id_product],
        [price],
        [quantity],
        [date_of_sale])
VALUES (26,
        26,
        Cast(990.00 AS DECIMAL(10, 2)),
        60,
        Cast(N'2024-02-01' AS DATE))

INSERT [dbo].[sale]
       ([id],
        [id_product],
        [price],
        [quantity],
        [date_of_sale])
VALUES (27,
        27,
        Cast(550.00 AS DECIMAL(10, 2)),
        70,
        Cast(N'2024-03-01' AS DATE))

INSERT [dbo].[sale]
       ([id],
        [id_product],
        [price],
        [quantity],
        [date_of_sale])
VALUES (28,
        28,
        Cast(1650.00 AS DECIMAL(10, 2)),
        80,
        Cast(N'2024-04-01' AS DATE))

INSERT [dbo].[sale]
       ([id],
        [id_product],
        [price],
        [quantity],
        [date_of_sale])
VALUES (29,
        29,
        Cast(880.00 AS DECIMAL(10, 2)),
        90,
        Cast(N'2024-05-01' AS DATE))

INSERT [dbo].[sale]
       ([id],
        [id_product],
        [price],
        [quantity],
        [date_of_sale])
VALUES (30,
        30,
        Cast(220.00 AS DECIMAL(10, 2)),
        100,
        Cast(N'2024-06-01' AS DATE))

SET IDENTITY_INSERT [dbo].[Sale] OFF

go

SET IDENTITY_INSERT [dbo].[Supplier] ON

INSERT [dbo].[supplier]
       ([id],
        [name],
        [id_address])
VALUES (25,
        N'Best Buy',
        25)

INSERT [dbo].[supplier]
       ([id],
        [name],
        [id_address])
VALUES (26,
        N'Amazon',
        26)

INSERT [dbo].[supplier]
       ([id],
        [name],
        [id_address])
VALUES (27,
        N'Walmart',
        27)

INSERT [dbo].[supplier]
       ([id],
        [name],
        [id_address])
VALUES (28,
        N'Target',
        28)

INSERT [dbo].[supplier]
       ([id],
        [name],
        [id_address])
VALUES (29,
        N'Costco',
        29)

INSERT [dbo].[supplier]
       ([id],
        [name],
        [id_address])
VALUES (30,
        N'eBay',
        30)

SET IDENTITY_INSERT [dbo].[Supplier] OFF

go

ALTER TABLE [dbo].[address]
  WITH CHECK ADD CONSTRAINT [FK__Address__id_city__3F466844] FOREIGN KEY(
  [id_city]) REFERENCES [dbo].[city] ([id])

go

ALTER TABLE [dbo].[address]
  CHECK CONSTRAINT [FK__Address__id_city__3F466844]

go

ALTER TABLE [dbo].[city]
  WITH CHECK ADD CONSTRAINT [FK__City__id_region__3C69FB99] FOREIGN KEY(
  [id_region]) REFERENCES [dbo].[region] ([id])

go

ALTER TABLE [dbo].[city]
  CHECK CONSTRAINT [FK__City__id_region__3C69FB99]

go

ALTER TABLE [dbo].[delivery]
  WITH CHECK ADD CONSTRAINT [FK__Delivery__id_pro__5629CD9C] FOREIGN KEY(
  [id_product]) REFERENCES [dbo].[product] ([id])

go

ALTER TABLE [dbo].[delivery]
  CHECK CONSTRAINT [FK__Delivery__id_pro__5629CD9C]

go

ALTER TABLE [dbo].[delivery]
  WITH CHECK ADD CONSTRAINT [FK__Delivery__id_sup__44FF419A] FOREIGN KEY(
  [id_supplier]) REFERENCES [dbo].[supplier] ([id])

go

ALTER TABLE [dbo].[delivery]
  CHECK CONSTRAINT [FK__Delivery__id_sup__44FF419A]

go

ALTER TABLE [dbo].[producer]
  WITH CHECK ADD CONSTRAINT [FK__Producer__id_add__4F7CD00D] FOREIGN KEY(
  [id_address]) REFERENCES [dbo].[address] ([id])

go

ALTER TABLE [dbo].[producer]
  CHECK CONSTRAINT [FK__Producer__id_add__4F7CD00D]

go

ALTER TABLE [dbo].[product]
  WITH CHECK ADD CONSTRAINT [FK__Product__id_cate__52593CB8] FOREIGN KEY(
  [id_category]) REFERENCES [dbo].[category] ([id])

go

ALTER TABLE [dbo].[product]
  CHECK CONSTRAINT [FK__Product__id_cate__52593CB8]

go

ALTER TABLE [dbo].[product]
  WITH CHECK ADD CONSTRAINT [FK__Product__id_mark__5535A963] FOREIGN KEY(
  [id_markup]) REFERENCES [dbo].[markup] ([id])

go

ALTER TABLE [dbo].[product]
  CHECK CONSTRAINT [FK__Product__id_mark__5535A963]

go

ALTER TABLE [dbo].[product]
  WITH CHECK ADD CONSTRAINT [FK__Product__id_meas__5441852A] FOREIGN KEY(
  [id_measurement]) REFERENCES [dbo].[measurement] ([id])

go

ALTER TABLE [dbo].[product]
  CHECK CONSTRAINT [FK__Product__id_meas__5441852A]

go

ALTER TABLE [dbo].[product]
  WITH CHECK ADD CONSTRAINT [FK__Product__id_prod__534D60F1] FOREIGN KEY(
  [id_producer]) REFERENCES [dbo].[producer] ([id])

go

ALTER TABLE [dbo].[product]
  CHECK CONSTRAINT [FK__Product__id_prod__534D60F1]

go

ALTER TABLE [dbo].[region]
  WITH CHECK ADD CONSTRAINT [FK__Region__id_count__398D8EEE] FOREIGN KEY(
  [id_country]) REFERENCES [dbo].[country] ([id])

go

ALTER TABLE [dbo].[region]
  CHECK CONSTRAINT [FK__Region__id_count__398D8EEE]

go

ALTER TABLE [dbo].[sale]
  WITH CHECK ADD CONSTRAINT [FK__Sale__id_product__571DF1D5] FOREIGN KEY(
  [id_product]) REFERENCES [dbo].[product] ([id])

go

ALTER TABLE [dbo].[sale]
  CHECK CONSTRAINT [FK__Sale__id_product__571DF1D5]

go

ALTER TABLE [dbo].[supplier]
  WITH CHECK ADD CONSTRAINT [FK__Supplier__id_add__4222D4EF] FOREIGN KEY(
  [id_address]) REFERENCES [dbo].[address] ([id])

go

ALTER TABLE [dbo].[supplier]
  CHECK CONSTRAINT [FK__Supplier__id_add__4222D4EF]

go

USE [master]

go

ALTER DATABASE [Management]

SET read_write

go
