USE [SFCTOFC-CorporateSolutions]
GO
/****** Object:  Table [dbo].[Fleet]    Script Date: 10/29/2025 4:17:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fleet](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PlateNo] [nvarchar](50) NULL,
	[Model] [nvarchar](50) NULL,
	[Year] [nvarchar](50) NULL,
	[Brand] [nvarchar](50) NULL,
	[EmployeeId] [int] NULL,
	[Acquisition] [date] NULL,
	[CRN] [nvarchar](50) NULL,
	[CreatedBy] [nvarchar](256) NULL,
	[Created] [datetime2](7) NULL,
	[LastModifiedBy] [nvarchar](256) NULL,
	[LastModified] [datetime2](7) NULL,
	[TenantId] [nvarchar](450) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FleetDetail]    Script Date: 10/29/2025 4:17:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FleetDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FleetId] [int] NULL,
	[Type] [nvarchar](25) NULL,
	[Renewal] [date] NULL,
	[Expiry] [date] NULL,
	[Remarks] [text] NULL,
	[CreatedBy] [nvarchar](256) NULL,
	[Created] [datetime2](7) NULL,
	[LastModifiedBy] [nvarchar](256) NULL,
	[LastModified] [datetime2](7) NULL,
CONSTRAINT [PK__FleetDet__3214EC0794681A53] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Fleet] ON 
GO
INSERT [dbo].[Fleet] ([Id], [PlateNo], [Model], [Year], [Brand], [EmployeeId], [Acquisition], [CRN], [CreatedBy], [Created], [LastModifiedBy], [LastModified], [TenantId]) VALUES (1, N'1234CD', N'Model1', N'2003', N'VIOS', 1, CAST(N'2022-05-05' AS Date), N'ewan', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Fleet] ([Id], [PlateNo], [Model], [Year], [Brand], [EmployeeId], [Acquisition], [CRN], [CreatedBy], [Created], [LastModifiedBy], [LastModified], [TenantId]) VALUES (2, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-05-11' AS Date), NULL, N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-29T06:25:35.8946759' AS DateTime2), NULL, NULL, NULL)
GO
INSERT [dbo].[Fleet] ([Id], [PlateNo], [Model], [Year], [Brand], [EmployeeId], [Acquisition], [CRN], [CreatedBy], [Created], [LastModifiedBy], [LastModified], [TenantId]) VALUES (3, N'12323', N'123213', N'2025', NULL, NULL, CAST(N'2022-05-01' AS Date), N'1233', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-29T06:28:51.2697230' AS DateTime2), NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Fleet] OFF
GO