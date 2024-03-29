USE [ex01]
GO
/****** Object:  Table [dbo].[category]    Script Date: 10/30/2023 2:30:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[cat_id] [varchar](10) NOT NULL,
	[cat_name] [nvarchar](50) NOT NULL,
	[cat_description] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_category] PRIMARY KEY CLUSTERED 
(
	[cat_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 10/30/2023 2:30:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[pro_id] [varchar](10) NOT NULL,
	[pro_name] [varchar](50) NOT NULL,
	[pro_price] [bigint] NOT NULL,
	[pro_quantity] [int] NOT NULL,
	[pro_picture] [varchar](500) NOT NULL,
	[pro_description] [nvarchar](1000) NOT NULL,
	[cat_id] [varchar](10) NOT NULL,
 CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED 
(
	[pro_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[category] ([cat_id], [cat_name], [cat_description]) VALUES (N'1', N'Apple', N'New')
INSERT [dbo].[category] ([cat_id], [cat_name], [cat_description]) VALUES (N'2', N'Samsung', N'New')
INSERT [dbo].[category] ([cat_id], [cat_name], [cat_description]) VALUES (N'3', N'Oppo', N'Old')
INSERT [dbo].[category] ([cat_id], [cat_name], [cat_description]) VALUES (N'4', N'Realme', N'New')
INSERT [dbo].[category] ([cat_id], [cat_name], [cat_description]) VALUES (N'5', N'Redmi', N'Old')
GO
INSERT [dbo].[product] ([pro_id], [pro_name], [pro_price], [pro_quantity], [pro_picture], [pro_description], [cat_id]) VALUES (N'IP13PrM', N'Iphone 13 Promax', 35000000, 25, N'image/iphone13Promax.jpg', N'New', N'1')
INSERT [dbo].[product] ([pro_id], [pro_name], [pro_price], [pro_quantity], [pro_picture], [pro_description], [cat_id]) VALUES (N'IP14', N'Iphone 14', 18000000, 30, N'image/iphone14Pro.jpg', N'New', N'1')
INSERT [dbo].[product] ([pro_id], [pro_name], [pro_price], [pro_quantity], [pro_picture], [pro_description], [cat_id]) VALUES (N'IP15PrM', N'Iphone 15 Promax', 36000000, 60, N'image/iphone15Promax.jpg', N'New', N'1')
INSERT [dbo].[product] ([pro_id], [pro_name], [pro_price], [pro_quantity], [pro_picture], [pro_description], [cat_id]) VALUES (N'IP8P', N'Iphone 8 Plus', 4500000, 15, N'image/iphone8Plus.jpg', N'New', N'1')
INSERT [dbo].[product] ([pro_id], [pro_name], [pro_price], [pro_quantity], [pro_picture], [pro_description], [cat_id]) VALUES (N'OA53', N'Oppo A53', 3600000, 12, N'image/oppoA53.jpg', N'New', N'3')
INSERT [dbo].[product] ([pro_id], [pro_name], [pro_price], [pro_quantity], [pro_picture], [pro_description], [cat_id]) VALUES (N'OF1S', N'Oppo F1S', 2800000, 10, N'image/oppoF1S.jpg', N'Old', N'3')
INSERT [dbo].[product] ([pro_id], [pro_name], [pro_price], [pro_quantity], [pro_picture], [pro_description], [cat_id]) VALUES (N'SG8', N'Samsung Galaxy 8', 3500000, 12, N'image/samsungGalaxy8.jpg', N'Old', N'2')
INSERT [dbo].[product] ([pro_id], [pro_name], [pro_price], [pro_quantity], [pro_picture], [pro_description], [cat_id]) VALUES (N'SGZF4', N'Samsung Galaxy Z Fold 4', 36000000, 25, N'image/galaxyZFold4.jpg', N'New', N'2')
INSERT [dbo].[product] ([pro_id], [pro_name], [pro_price], [pro_quantity], [pro_picture], [pro_description], [cat_id]) VALUES (N'SGZF5', N'Samsung Galaxy Z Fold 5', 35000000, 30, N'image/galaxyZFold5.jpg', N'New', N'2')
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK_product_category] FOREIGN KEY([cat_id])
REFERENCES [dbo].[category] ([cat_id])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK_product_category]
GO
