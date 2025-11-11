USE [SFCTOFC-CorporateSolutions]
GO
/****** Object:  Table [dbo].[JobRequests]    Script Date: 10/20/2025 11:27:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobRequests](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RefId] [nvarchar](250) NULL,
	[RequestorID] [int] NULL,
	[RequestTitle] [nvarchar](100) NULL,
	[RequestDetails] [nvarchar](350) NULL,
	[Reason] [nvarchar](50) NULL,
	[Requestor] [nvarchar](255) NULL,
	[Section] [nvarchar](100) NULL,
	[Machine] [nvarchar](100) NULL,
	[Priority] [nvarchar](100) NULL,
	[ApprovalStatus] [nvarchar](50) NOT NULL,
	[DueDate] [date] NULL,
	[TargetCompletionDate] [int] NULL,
	[Department] [nvarchar](255) NULL,
	[Status] [nvarchar](50) NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](450) NULL,
	[LastModified] [datetime] NULL,
	[LastModifiedBy] [nvarchar](450) NULL,
	[TenantId] [nvarchar](450) NULL,
	[TenantName] [nvarchar](450) NULL,
	[CreatedByUserId] [int] NULL,
	[LastModifiedByUserId] [int] NULL,
	[Comment] [nvarchar](450) NULL,
 CONSTRAINT [PK__JobReque__7A69B84606BEE3E7] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PicklistSets]    Script Date: 10/20/2025 11:27:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PicklistSets](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Value] [nvarchar](100) NULL,
	[Text] [nvarchar](100) NULL,
	[Description] [nvarchar](255) NULL,
	[Created] [datetime2](7) NULL,
	[CreatedBy] [nvarchar](450) NULL,
	[LastModified] [datetime2](7) NULL,
	[LastModifiedBy] [nvarchar](450) NULL,
 CONSTRAINT [PK_PicklistSets] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PreventiveMaintenances]    Script Date: 10/20/2025 11:27:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PreventiveMaintenances](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Location] [nvarchar](50) NULL,
	[UnitProcess] [nvarchar](255) NULL,
	[MachineName] [nvarchar](255) NULL,
	[MachineParts] [nvarchar](255) NULL,
	[Task] [nvarchar](max) NULL,
	[Checkpoint] [nvarchar](max) NULL,
	[Frequency] [nvarchar](50) NULL,
	[Classification] [nvarchar](50) NULL,
	[StartingPoint] [int] NULL,
	[NotificationReminder] [nvarchar](max) NULL,
	[Status] [nvarchar](100) NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](450) NULL,
	[LastModifed] [datetime] NULL,
	[LastModifiedBy] [nvarchar](450) NULL,
	[AssignedTo] [nvarchar](255) NULL,
	[WeekNumber] [int] NULL,
	[DueWeek] [int] NULL,
	[Section] [nvarchar](255) NULL,
 CONSTRAINT [PK__Preventi__82625B378DDBF052] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkOrders]    Script Date: 10/20/2025 11:27:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkOrders](
	[WorkOrderID] [int] IDENTITY(1,1) NOT NULL,
	[JobRequestId] [int] NULL,
	[PreventiveMaintenanceId] [int] NULL,
	[RefId] [nvarchar](255) NULL,
	[Title] [nvarchar](200) NULL,
	[Description] [nvarchar](max) NULL,
	[Category] [nvarchar](50) NULL,
	[AssignedTo] [int] NULL,
	[Location] [nvarchar](255) NULL,
	[Status] [nvarchar](50) NULL,
	[Machine] [nvarchar](100) NULL,
	[Priority] [nvarchar](20) NULL,
	[WeekNumberSched] [int] NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [nvarchar](450) NULL,
	[LastModified] [datetime] NULL,
	[LastModifiedBy] [nvarchar](450) NULL,
	[TenantId] [nvarchar](450) NULL,
	[TenantName] [nvarchar](450) NULL,
	[LastModifiedByUserId] [int] NULL,
	[CreatedByUserId] [int] NULL,
	[AssignedName] [nvarchar](255) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkOrderTasks]    Script Date: 10/20/2025 11:27:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkOrderTasks](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[WorkOrderId] [int] NULL,
	[MachinePart] [nvarchar](max) NULL,
	[Task] [nvarchar](450) NULL,
	[IsChecked] [bit] NULL,
	[Remarks] [nvarchar](250) NULL,
	[PhotoPath] [nvarchar](max) NULL,
	[Frequency] [nvarchar](50) NULL,
	[CreatedBy] [nvarchar](450) NULL,
	[Created] [datetime] NULL,
	[LastModifiedBy] [nvarchar](450) NULL,
	[LastModified] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[JobRequests] ON 
GO
INSERT [dbo].[JobRequests] ([Id], [RefId], [RequestorID], [RequestTitle], [RequestDetails], [Reason], [Requestor], [Section], [Machine], [Priority], [ApprovalStatus], [DueDate], [TargetCompletionDate], [Department], [Status], [Created], [CreatedBy], [LastModified], [LastModifiedBy], [TenantId], [TenantName], [CreatedByUserId], [LastModifiedByUserId], [Comment]) VALUES (6, N'JRF251000001', 0, N'2qe233232', N'd4324324324', N'Improvement', N'Administrator', N'BAKING LINE 2', N'4324324324', N'Low', N'Approved', CAST(N'2025-10-21' AS Date), NULL, NULL, NULL, CAST(N'2025-10-20T02:36:23.907' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[JobRequests] ([Id], [RefId], [RequestorID], [RequestTitle], [RequestDetails], [Reason], [Requestor], [Section], [Machine], [Priority], [ApprovalStatus], [DueDate], [TargetCompletionDate], [Department], [Status], [Created], [CreatedBy], [LastModified], [LastModifiedBy], [TenantId], [TenantName], [CreatedByUserId], [LastModifiedByUserId], [Comment]) VALUES (7, N'JRF251000002', 0, N'dsfdagfgregregregreger', N'lasldjaskf alsjdsldjdfdklfj lsadhfkdshfkhdsklfhkdsh hfh hfhf', N'Preventive Maintenance', N'Administrator', N'LALLRTTRRTY', N'dsfdagfgregregregreger', N'Medium', N'Pending', CAST(N'2025-10-21' AS Date), NULL, NULL, NULL, CAST(N'2025-10-20T02:38:46.073' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[JobRequests] ([Id], [RefId], [RequestorID], [RequestTitle], [RequestDetails], [Reason], [Requestor], [Section], [Machine], [Priority], [ApprovalStatus], [DueDate], [TargetCompletionDate], [Department], [Status], [Created], [CreatedBy], [LastModified], [LastModifiedBy], [TenantId], [TenantName], [CreatedByUserId], [LastModifiedByUserId], [Comment]) VALUES (8, N'JRF251000003', 0, N'nasirang machine dine bigla ', N'nung biglang nahulog di nagumalaw gumana hel', N'Repair', N'Administrator', N'Marshmallow Extrusion Line 1', N'ifheisohfoi', N'Low', N'Pending', CAST(N'2025-10-22' AS Date), NULL, NULL, NULL, CAST(N'2025-10-20T02:52:32.833' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[JobRequests] ([Id], [RefId], [RequestorID], [RequestTitle], [RequestDetails], [Reason], [Requestor], [Section], [Machine], [Priority], [ApprovalStatus], [DueDate], [TargetCompletionDate], [Department], [Status], [Created], [CreatedBy], [LastModified], [LastModifiedBy], [TenantId], [TenantName], [CreatedByUserId], [LastModifiedByUserId], [Comment]) VALUES (9, N'JRF251000004', 0, N'dsadsadsadasdsadewer32er', N'r324324234r', N'Quality Concern', N'Administrator', N'MARSHMALLOW', N'ewrewrwer', N'High', N'Approved', CAST(N'2025-10-22' AS Date), NULL, NULL, NULL, CAST(N'2025-10-20T03:12:14.510' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[JobRequests] OFF
GO
SET IDENTITY_INSERT [dbo].[PicklistSets] ON 
GO
INSERT [dbo].[PicklistSets] ([Id], [Name], [Value], [Text], [Description], [Created], [CreatedBy], [LastModified], [LastModifiedBy]) VALUES (1, N'STATUS', N'initialization', N'Initialization', N'Status of workflow', CAST(N'2025-08-06T02:01:12.3726418' AS DateTime2), NULL, NULL, NULL)
GO
INSERT [dbo].[PicklistSets] ([Id], [Name], [Value], [Text], [Description], [Created], [CreatedBy], [LastModified], [LastModifiedBy]) VALUES (2, N'STATUS', N'processing', N'Processing', N'Status of workflow', CAST(N'2025-08-06T02:01:12.3726418' AS DateTime2), NULL, NULL, NULL)
GO
INSERT [dbo].[PicklistSets] ([Id], [Name], [Value], [Text], [Description], [Created], [CreatedBy], [LastModified], [LastModifiedBy]) VALUES (3, N'STATUS', N'pending', N'Pending', N'Status of workflow', CAST(N'2025-08-06T02:01:12.3726418' AS DateTime2), NULL, NULL, NULL)
GO
INSERT [dbo].[PicklistSets] ([Id], [Name], [Value], [Text], [Description], [Created], [CreatedBy], [LastModified], [LastModifiedBy]) VALUES (4, N'STATUS', N'done', N'Done', N'Status of workflow', CAST(N'2025-08-06T02:01:12.3726418' AS DateTime2), NULL, NULL, NULL)
GO
INSERT [dbo].[PicklistSets] ([Id], [Name], [Value], [Text], [Description], [Created], [CreatedBy], [LastModified], [LastModifiedBy]) VALUES (5, N'BRAND', N'Apple', N'Apple', N'Brand of production', CAST(N'2025-08-06T02:01:12.3726418' AS DateTime2), NULL, NULL, NULL)
GO
INSERT [dbo].[PicklistSets] ([Id], [Name], [Value], [Text], [Description], [Created], [CreatedBy], [LastModified], [LastModifiedBy]) VALUES (6, N'BRAND', N'Google', N'Google', N'Brand of production', CAST(N'2025-08-06T02:01:12.3726418' AS DateTime2), NULL, NULL, NULL)
GO
INSERT [dbo].[PicklistSets] ([Id], [Name], [Value], [Text], [Description], [Created], [CreatedBy], [LastModified], [LastModifiedBy]) VALUES (7, N'BRAND', N'Microsoft', N'Microsoft', N'Brand of production', CAST(N'2025-08-06T02:01:12.3726418' AS DateTime2), NULL, NULL, NULL)
GO
INSERT [dbo].[PicklistSets] ([Id], [Name], [Value], [Text], [Description], [Created], [CreatedBy], [LastModified], [LastModifiedBy]) VALUES (8, N'UNIT', N'EA', N'EA', N'Unit of product', CAST(N'2025-08-06T02:01:12.3726418' AS DateTime2), NULL, NULL, NULL)
GO
INSERT [dbo].[PicklistSets] ([Id], [Name], [Value], [Text], [Description], [Created], [CreatedBy], [LastModified], [LastModifiedBy]) VALUES (9, N'UNIT', N'KM', N'KM', N'Unit of product', CAST(N'2025-08-06T02:01:12.3726418' AS DateTime2), NULL, NULL, NULL)
GO
INSERT [dbo].[PicklistSets] ([Id], [Name], [Value], [Text], [Description], [Created], [CreatedBy], [LastModified], [LastModifiedBy]) VALUES (10, N'UNIT', N'PC', N'PC', N'Unit of product', CAST(N'2025-08-06T02:01:12.3726418' AS DateTime2), NULL, NULL, NULL)
GO
INSERT [dbo].[PicklistSets] ([Id], [Name], [Value], [Text], [Description], [Created], [CreatedBy], [LastModified], [LastModifiedBy]) VALUES (11, N'UNIT', N'L', N'L', N'Unit of product', CAST(N'2025-08-06T02:01:12.3726418' AS DateTime2), NULL, NULL, NULL)
GO
INSERT [dbo].[PicklistSets] ([Id], [Name], [Value], [Text], [Description], [Created], [CreatedBy], [LastModified], [LastModifiedBy]) VALUES (12, N'CIVILSTATUS', N'Single', N'Single', N'Single', CAST(N'2025-08-16T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL)
GO
INSERT [dbo].[PicklistSets] ([Id], [Name], [Value], [Text], [Description], [Created], [CreatedBy], [LastModified], [LastModifiedBy]) VALUES (13, N'CIVILSTATUS', N'Married', N'Married', N'Married', CAST(N'2025-08-16T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL)
GO
INSERT [dbo].[PicklistSets] ([Id], [Name], [Value], [Text], [Description], [Created], [CreatedBy], [LastModified], [LastModifiedBy]) VALUES (14, N'CIVILSTATUS', N'Widowed', N'Widowed', N'Widowed', CAST(N'2025-08-16T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL)
GO
INSERT [dbo].[PicklistSets] ([Id], [Name], [Value], [Text], [Description], [Created], [CreatedBy], [LastModified], [LastModifiedBy]) VALUES (15, N'CIVILSTATUS', N'Divorced', N'Divorced', N'Divorced', CAST(N'2025-08-16T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL)
GO
INSERT [dbo].[PicklistSets] ([Id], [Name], [Value], [Text], [Description], [Created], [CreatedBy], [LastModified], [LastModifiedBy]) VALUES (16, N'CIVILSTATUS', N'Separated', N'Separated', N'Separated', CAST(N'2025-08-16T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL)
GO
INSERT [dbo].[PicklistSets] ([Id], [Name], [Value], [Text], [Description], [Created], [CreatedBy], [LastModified], [LastModifiedBy]) VALUES (17, N'CIVILSTATUS', N'Annulled', N'Annulled', N'Annulled', CAST(N'2025-08-16T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL)
GO
INSERT [dbo].[PicklistSets] ([Id], [Name], [Value], [Text], [Description], [Created], [CreatedBy], [LastModified], [LastModifiedBy]) VALUES (18, N'ADDRESSTYPE', N'PERMANENT', N'PERMANENT', N'PERMANENT', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PicklistSets] ([Id], [Name], [Value], [Text], [Description], [Created], [CreatedBy], [LastModified], [LastModifiedBy]) VALUES (19, N'ADDRESSTYPE', N'CURRENT', N'CURRENT', N'CURRENT', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PicklistSets] ([Id], [Name], [Value], [Text], [Description], [Created], [CreatedBy], [LastModified], [LastModifiedBy]) VALUES (20, N'JobPosition', N'ICT MANAGER', N'ICT MANAGER', N'ICT MANAGER', CAST(N'2025-08-28T10:05:24.8731076' AS DateTime2), N'e7305241-6806-435b-b878-d82638eff11a', NULL, NULL)
GO
INSERT [dbo].[PicklistSets] ([Id], [Name], [Value], [Text], [Description], [Created], [CreatedBy], [LastModified], [LastModifiedBy]) VALUES (21, N'JobPosition', N'ICT SUPERVISOR', N'ICT SUPERVISOR', N'ICT SUPERVISOR', CAST(N'2025-08-28T10:05:45.7955835' AS DateTime2), N'e7305241-6806-435b-b878-d82638eff11a', NULL, NULL)
GO
INSERT [dbo].[PicklistSets] ([Id], [Name], [Value], [Text], [Description], [Created], [CreatedBy], [LastModified], [LastModifiedBy]) VALUES (22, N'JobPosition', N'ICT NETWORK AND SYSTEM ADMINISTRATOR', N'ICT NETWORK AND SYSTEM ADMINISTRATOR', N'ICT NETWORK AND SYSTEM ADMINISTRATOR', CAST(N'2025-08-28T10:06:48.0783010' AS DateTime2), N'e7305241-6806-435b-b878-d82638eff11a', NULL, NULL)
GO
INSERT [dbo].[PicklistSets] ([Id], [Name], [Value], [Text], [Description], [Created], [CreatedBy], [LastModified], [LastModifiedBy]) VALUES (26, N'JobPosition', N'ICT SENIOR SOFTWARE DEVELOPER', N'ICT SENIOR SOFTWARE DEVELOPER', N'ICT SENIOR SOFTWARE DEVELOPER', CAST(N'2025-08-28T10:09:02.5544518' AS DateTime2), N'e7305241-6806-435b-b878-d82638eff11a', NULL, NULL)
GO
INSERT [dbo].[PicklistSets] ([Id], [Name], [Value], [Text], [Description], [Created], [CreatedBy], [LastModified], [LastModifiedBy]) VALUES (27, N'JobPosition', N'ICT JUNIOR SOFTWARE DEVELOPER', N'ICT JUNIOR SOFTWARE DEVELOPER', N'ICT JUNIOR SOFTWARE DEVELOPER', CAST(N'2025-08-28T10:09:22.3853165' AS DateTime2), N'e7305241-6806-435b-b878-d82638eff11a', NULL, NULL)
GO
INSERT [dbo].[PicklistSets] ([Id], [Name], [Value], [Text], [Description], [Created], [CreatedBy], [LastModified], [LastModifiedBy]) VALUES (28, N'JobPosition', N'ICT SUPPORT', N'ICT SUPPORT', N'ICT SUPPORT', CAST(N'2025-08-28T10:09:37.6755198' AS DateTime2), N'e7305241-6806-435b-b878-d82638eff11a', NULL, NULL)
GO
INSERT [dbo].[PicklistSets] ([Id], [Name], [Value], [Text], [Description], [Created], [CreatedBy], [LastModified], [LastModifiedBy]) VALUES (29, N'SalaryFactor', N'MONTHLY', N'MONTHLY', N'MONTHLY', CAST(N'2025-08-31T05:58:08.7334613' AS DateTime2), N'e7305241-6806-435b-b878-d82638eff11a', NULL, NULL)
GO
INSERT [dbo].[PicklistSets] ([Id], [Name], [Value], [Text], [Description], [Created], [CreatedBy], [LastModified], [LastModifiedBy]) VALUES (30, N'Currency', N'PHP', N'PHP', N'PHP', CAST(N'2025-08-31T05:58:23.3353317' AS DateTime2), N'e7305241-6806-435b-b878-d82638eff11a', NULL, NULL)
GO
INSERT [dbo].[PicklistSets] ([Id], [Name], [Value], [Text], [Description], [Created], [CreatedBy], [LastModified], [LastModifiedBy]) VALUES (31, N'EmploymentStatus', N'REGULAR', N'REGULAR', N'REGULAR', CAST(N'2025-08-31T06:07:37.9577007' AS DateTime2), N'e7305241-6806-435b-b878-d82638eff11a', NULL, NULL)
GO
INSERT [dbo].[PicklistSets] ([Id], [Name], [Value], [Text], [Description], [Created], [CreatedBy], [LastModified], [LastModifiedBy]) VALUES (32, N'DeductionType', N'FIXED', N'FIXED', N'FIXED', CAST(N'2025-09-01T04:47:31.7688947' AS DateTime2), N'e7305241-6806-435b-b878-d82638eff11a', NULL, NULL)
GO
INSERT [dbo].[PicklistSets] ([Id], [Name], [Value], [Text], [Description], [Created], [CreatedBy], [LastModified], [LastModifiedBy]) VALUES (33, N'DeductionType', N'BASIC', N'BASIC', N'BASIC', CAST(N'2025-09-01T04:47:47.3306200' AS DateTime2), N'e7305241-6806-435b-b878-d82638eff11a', NULL, NULL)
GO
INSERT [dbo].[PicklistSets] ([Id], [Name], [Value], [Text], [Description], [Created], [CreatedBy], [LastModified], [LastModifiedBy]) VALUES (34, N'WorkOrderCategory', N'Repair', N'Repair', N'Repair', CAST(N'2025-09-10T01:32:49.3631679' AS DateTime2), N'e7305241-6806-435b-b878-d82638eff11a', NULL, NULL)
GO
INSERT [dbo].[PicklistSets] ([Id], [Name], [Value], [Text], [Description], [Created], [CreatedBy], [LastModified], [LastModifiedBy]) VALUES (35, N'WorkOrderCategory', N'Improvement', N'Improvement', N'Improvement', CAST(N'2025-09-10T01:33:22.4313759' AS DateTime2), N'e7305241-6806-435b-b878-d82638eff11a', NULL, NULL)
GO
INSERT [dbo].[PicklistSets] ([Id], [Name], [Value], [Text], [Description], [Created], [CreatedBy], [LastModified], [LastModifiedBy]) VALUES (36, N'WorkOrderCategory', N'Preventive Maintenance', N'Preventive Maintenance', N'Preventive Maintenance', CAST(N'2025-09-10T01:33:38.3999819' AS DateTime2), N'e7305241-6806-435b-b878-d82638eff11a', NULL, NULL)
GO
INSERT [dbo].[PicklistSets] ([Id], [Name], [Value], [Text], [Description], [Created], [CreatedBy], [LastModified], [LastModifiedBy]) VALUES (37, N'WorkOrderCategory', N'Down Time', N'Down Time', N'Down Time', CAST(N'2025-09-10T01:33:48.6267850' AS DateTime2), N'e7305241-6806-435b-b878-d82638eff11a', NULL, NULL)
GO
INSERT [dbo].[PicklistSets] ([Id], [Name], [Value], [Text], [Description], [Created], [CreatedBy], [LastModified], [LastModifiedBy]) VALUES (38, N'WorkOrderPriority', N'High', N'High', N'High', CAST(N'2025-09-10T04:47:46.3104922' AS DateTime2), N'e7305241-6806-435b-b878-d82638eff11a', NULL, NULL)
GO
INSERT [dbo].[PicklistSets] ([Id], [Name], [Value], [Text], [Description], [Created], [CreatedBy], [LastModified], [LastModifiedBy]) VALUES (39, N'WorkOrderPriority', N'Medium', N'Medium', N'Medium', CAST(N'2025-09-10T04:48:00.0874786' AS DateTime2), N'e7305241-6806-435b-b878-d82638eff11a', NULL, NULL)
GO
INSERT [dbo].[PicklistSets] ([Id], [Name], [Value], [Text], [Description], [Created], [CreatedBy], [LastModified], [LastModifiedBy]) VALUES (40, N'WorkOrderPriority', N'Low', N'Low', N'Low', CAST(N'2025-09-10T04:48:12.4244986' AS DateTime2), N'e7305241-6806-435b-b878-d82638eff11a', NULL, NULL)
GO
INSERT [dbo].[PicklistSets] ([Id], [Name], [Value], [Text], [Description], [Created], [CreatedBy], [LastModified], [LastModifiedBy]) VALUES (41, N'WorkOrderPriority', N'None', N'None', N'None', CAST(N'2025-09-10T04:48:22.6581782' AS DateTime2), N'e7305241-6806-435b-b878-d82638eff11a', NULL, NULL)
GO
INSERT [dbo].[PicklistSets] ([Id], [Name], [Value], [Text], [Description], [Created], [CreatedBy], [LastModified], [LastModifiedBy]) VALUES (42, N'PMLocation', N'MARSHMALLOW', N'MARSHMALLOW', N'MARSHMALLOW', CAST(N'2025-09-11T23:18:43.4980942' AS DateTime2), N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-20T02:19:34.9417919' AS DateTime2), N'e7305241-6806-435b-b878-d82638eff11a')
GO
INSERT [dbo].[PicklistSets] ([Id], [Name], [Value], [Text], [Description], [Created], [CreatedBy], [LastModified], [LastModifiedBy]) VALUES (47, N'JRQReason', N'Repair', N'Repair', N'Repair', CAST(N'2025-09-11T23:29:39.1728248' AS DateTime2), N'e7305241-6806-435b-b878-d82638eff11a', NULL, NULL)
GO
INSERT [dbo].[PicklistSets] ([Id], [Name], [Value], [Text], [Description], [Created], [CreatedBy], [LastModified], [LastModifiedBy]) VALUES (48, N'JRQReason', N'Improvement', N'Improvement', N'Improvement', CAST(N'2025-09-11T23:29:55.5000856' AS DateTime2), N'e7305241-6806-435b-b878-d82638eff11a', NULL, NULL)
GO
INSERT [dbo].[PicklistSets] ([Id], [Name], [Value], [Text], [Description], [Created], [CreatedBy], [LastModified], [LastModifiedBy]) VALUES (49, N'JRQReason', N'Preventive Maintenance', N'Preventive Maintenance', N'Preventive Maintenance', CAST(N'2025-09-11T23:30:06.8953435' AS DateTime2), N'e7305241-6806-435b-b878-d82638eff11a', NULL, NULL)
GO
INSERT [dbo].[PicklistSets] ([Id], [Name], [Value], [Text], [Description], [Created], [CreatedBy], [LastModified], [LastModifiedBy]) VALUES (50, N'JRQReason', N'Down Time', N'Down Time', N'Down Time', CAST(N'2025-09-11T23:30:18.7774061' AS DateTime2), N'e7305241-6806-435b-b878-d82638eff11a', NULL, NULL)
GO
INSERT [dbo].[PicklistSets] ([Id], [Name], [Value], [Text], [Description], [Created], [CreatedBy], [LastModified], [LastModifiedBy]) VALUES (51, N'JRQPriority', N'Low', N'Low', N'Low', CAST(N'2025-09-14T15:50:04.1997726' AS DateTime2), N'e7305241-6806-435b-b878-d82638eff11a', NULL, NULL)
GO
INSERT [dbo].[PicklistSets] ([Id], [Name], [Value], [Text], [Description], [Created], [CreatedBy], [LastModified], [LastModifiedBy]) VALUES (52, N'JRQPriority', N'Medium', N'Medium', N'Medium', CAST(N'2025-09-14T15:50:14.5671855' AS DateTime2), N'e7305241-6806-435b-b878-d82638eff11a', NULL, NULL)
GO
INSERT [dbo].[PicklistSets] ([Id], [Name], [Value], [Text], [Description], [Created], [CreatedBy], [LastModified], [LastModifiedBy]) VALUES (53, N'JRQPriority', N'High', N'High', N'High', CAST(N'2025-09-14T15:50:23.8077529' AS DateTime2), N'e7305241-6806-435b-b878-d82638eff11a', NULL, NULL)
GO
INSERT [dbo].[PicklistSets] ([Id], [Name], [Value], [Text], [Description], [Created], [CreatedBy], [LastModified], [LastModifiedBy]) VALUES (54, N'JRQPriority', N'None', N'None', N'None', CAST(N'2025-09-14T15:50:32.7582985' AS DateTime2), N'e7305241-6806-435b-b878-d82638eff11a', NULL, NULL)
GO
INSERT [dbo].[PicklistSets] ([Id], [Name], [Value], [Text], [Description], [Created], [CreatedBy], [LastModified], [LastModifiedBy]) VALUES (56, N'PMClassification', N'NFC', N'Non Food Contact', N'Non Food Contact', CAST(N'2025-09-15T10:41:53.8945330' AS DateTime2), N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-17T05:54:39.8848297' AS DateTime2), N'e7305241-6806-435b-b878-d82638eff11a')
GO
INSERT [dbo].[PicklistSets] ([Id], [Name], [Value], [Text], [Description], [Created], [CreatedBy], [LastModified], [LastModifiedBy]) VALUES (57, N'PMClassification', N'FC', N'Food Contact', N'Food Contact', CAST(N'2025-09-15T10:42:04.6347253' AS DateTime2), N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-17T05:54:33.9592281' AS DateTime2), N'e7305241-6806-435b-b878-d82638eff11a')
GO
INSERT [dbo].[PicklistSets] ([Id], [Name], [Value], [Text], [Description], [Created], [CreatedBy], [LastModified], [LastModifiedBy]) VALUES (58, N'PMFrequency', N'Weekly', N'Weekly', N'Weekly', CAST(N'2025-09-15T10:54:59.7206042' AS DateTime2), N'e7305241-6806-435b-b878-d82638eff11a', NULL, NULL)
GO
INSERT [dbo].[PicklistSets] ([Id], [Name], [Value], [Text], [Description], [Created], [CreatedBy], [LastModified], [LastModifiedBy]) VALUES (59, N'PMFrequency', N'Monthly', N'Monthly', N'Monthly', CAST(N'2025-09-15T10:55:09.7187611' AS DateTime2), N'e7305241-6806-435b-b878-d82638eff11a', NULL, NULL)
GO
INSERT [dbo].[PicklistSets] ([Id], [Name], [Value], [Text], [Description], [Created], [CreatedBy], [LastModified], [LastModifiedBy]) VALUES (60, N'PMFrequency', N'Quarterly', N'Quarterly', N'Quarterly', CAST(N'2025-09-15T10:55:19.7731595' AS DateTime2), N'e7305241-6806-435b-b878-d82638eff11a', NULL, NULL)
GO
INSERT [dbo].[PicklistSets] ([Id], [Name], [Value], [Text], [Description], [Created], [CreatedBy], [LastModified], [LastModifiedBy]) VALUES (61, N'PMFrequency', N'Annually', N'Annually', N'Annually', CAST(N'2025-09-15T10:55:33.8776986' AS DateTime2), N'e7305241-6806-435b-b878-d82638eff11a', NULL, NULL)
GO
INSERT [dbo].[PicklistSets] ([Id], [Name], [Value], [Text], [Description], [Created], [CreatedBy], [LastModified], [LastModifiedBy]) VALUES (62, N'PMStatus', N'Not Yet Started', N'Not Yet Started', N'Not Yet Started', CAST(N'2025-09-16T01:51:29.4042223' AS DateTime2), N'e7305241-6806-435b-b878-d82638eff11a', NULL, NULL)
GO
INSERT [dbo].[PicklistSets] ([Id], [Name], [Value], [Text], [Description], [Created], [CreatedBy], [LastModified], [LastModifiedBy]) VALUES (63, N'PMStatus', N'On Going', N'On Going', N'On Going', CAST(N'2025-09-16T01:51:40.0818034' AS DateTime2), N'e7305241-6806-435b-b878-d82638eff11a', NULL, NULL)
GO
INSERT [dbo].[PicklistSets] ([Id], [Name], [Value], [Text], [Description], [Created], [CreatedBy], [LastModified], [LastModifiedBy]) VALUES (64, N'PMStatus', N'Completed', N'Completed', N'Completed', CAST(N'2025-09-16T01:51:54.5435741' AS DateTime2), N'e7305241-6806-435b-b878-d82638eff11a', NULL, NULL)
GO
INSERT [dbo].[PicklistSets] ([Id], [Name], [Value], [Text], [Description], [Created], [CreatedBy], [LastModified], [LastModifiedBy]) VALUES (65, N'PMStatus', N'Cancelled', N'Cancelled', N'Cancelled', CAST(N'2025-09-16T01:52:06.2767124' AS DateTime2), N'e7305241-6806-435b-b878-d82638eff11a', NULL, NULL)
GO
INSERT [dbo].[PicklistSets] ([Id], [Name], [Value], [Text], [Description], [Created], [CreatedBy], [LastModified], [LastModifiedBy]) VALUES (84, N'ProductionTicketMarshmallowProcess', N'CKPR', N'COOKING PROCESS', N'PRODUCTION TICKET PROCESS', CAST(N'2025-09-10T00:00:00.0000000' AS DateTime2), N'e7305241-6806-435b-b878-d82638eff11a', NULL, NULL)
GO
INSERT [dbo].[PicklistSets] ([Id], [Name], [Value], [Text], [Description], [Created], [CreatedBy], [LastModified], [LastModifiedBy]) VALUES (85, N'ProductionShift', N'DS', N'DS', N'PRODUCTION SHIFT', CAST(N'2025-09-16T00:00:00.0000000' AS DateTime2), N'e7305241-6806-435b-b878-d82638eff11a', NULL, NULL)
GO
INSERT [dbo].[PicklistSets] ([Id], [Name], [Value], [Text], [Description], [Created], [CreatedBy], [LastModified], [LastModifiedBy]) VALUES (86, N'ProductionShift', N'NS', N'NS', N'PRODUCTION SHIFT', CAST(N'2025-09-16T00:00:00.0000000' AS DateTime2), N'e7305241-6806-435b-b878-d82638eff11a', NULL, NULL)
GO
INSERT [dbo].[PicklistSets] ([Id], [Name], [Value], [Text], [Description], [Created], [CreatedBy], [LastModified], [LastModifiedBy]) VALUES (87, N'ProductionTicketMarshmallowProcess', N'RMGP', N'RAW MATERIALS AND GELATIN PREPARATION', N'PRODUCTION TICKET PROCESS', CAST(N'2025-09-16T00:00:00.0000000' AS DateTime2), N'e7305241-6806-435b-b878-d82638eff11a', NULL, NULL)
GO
INSERT [dbo].[PicklistSets] ([Id], [Name], [Value], [Text], [Description], [Created], [CreatedBy], [LastModified], [LastModifiedBy]) VALUES (88, N'ProductionTicketMarshmallowProcess', N'XNSP', N'EXTRUSION INSPECTION', N'PRODUCTION TICKET PROCESS', CAST(N'2025-09-16T00:00:00.0000000' AS DateTime2), N'e7305241-6806-435b-b878-d82638eff11a', NULL, NULL)
GO
INSERT [dbo].[PicklistSets] ([Id], [Name], [Value], [Text], [Description], [Created], [CreatedBy], [LastModified], [LastModifiedBy]) VALUES (89, N'ProductionTicketMarshmallowProcess', N'NCHT', N'NEW CORNSTARCH HEAT TREATMENT MANUFACTURING PROCESS', N'PRODUCTION TICKET PROCESS', CAST(N'2025-09-16T00:00:00.0000000' AS DateTime2), N'e7305241-6806-435b-b878-d82638eff11a', NULL, NULL)
GO
INSERT [dbo].[PicklistSets] ([Id], [Name], [Value], [Text], [Description], [Created], [CreatedBy], [LastModified], [LastModifiedBy]) VALUES (90, N'ProductionTicketMarshmallowProcess', N'RCMP', N'RETREATMENT CORNSTARCH MANUFACTURING PROCESS', N'PRODUCTION TICKET PROCESS', CAST(N'2025-09-16T00:00:00.0000000' AS DateTime2), N'e7305241-6806-435b-b878-d82638eff11a', NULL, NULL)
GO
INSERT [dbo].[PicklistSets] ([Id], [Name], [Value], [Text], [Description], [Created], [CreatedBy], [LastModified], [LastModifiedBy]) VALUES (91, N'ProductionTicketMarshmallowProcess', N'BPTC', N'BAGGING PRODUCTION TICKET', N'PRODUCTION TICKET PROCESS', CAST(N'2025-09-16T00:00:00.0000000' AS DateTime2), N'e7305241-6806-435b-b878-d82638eff11a', NULL, NULL)
GO
INSERT [dbo].[PicklistSets] ([Id], [Name], [Value], [Text], [Description], [Created], [CreatedBy], [LastModified], [LastModifiedBy]) VALUES (92, N'ProductionTicketMarshmallowProcess', N'FWBI', N'FLOW WRAPPING AND BAGGING INSPECTION', N'PRODUCTION TICKET PROCESS', CAST(N'2025-09-16T00:00:00.0000000' AS DateTime2), N'e7305241-6806-435b-b878-d82638eff11a', NULL, NULL)
GO
INSERT [dbo].[PicklistSets] ([Id], [Name], [Value], [Text], [Description], [Created], [CreatedBy], [LastModified], [LastModifiedBy]) VALUES (93, N'ProductionTicketChocolateProcess', N'RMDR', N'RAW MATERIALS DUMPING REPORT', N'PRODUCTION TICKET PROCESS', CAST(N'2025-09-16T00:00:00.0000000' AS DateTime2), N'e7305241-6806-435b-b878-d82638eff11a', NULL, NULL)
GO
INSERT [dbo].[PicklistSets] ([Id], [Name], [Value], [Text], [Description], [Created], [CreatedBy], [LastModified], [LastModifiedBy]) VALUES (94, N'ProductionTicketChocolateProcess', N'CBPR', N'CHOCOLATE BATCHING PROCESS REPORT', N'PRODUCTION TICKET PROCESS', CAST(N'2025-09-16T00:00:00.0000000' AS DateTime2), N'e7305241-6806-435b-b878-d82638eff11a', NULL, NULL)
GO
INSERT [dbo].[PicklistSets] ([Id], [Name], [Value], [Text], [Description], [Created], [CreatedBy], [LastModified], [LastModifiedBy]) VALUES (95, N'ProductionTicketChocolateProcess', N'CRIC', N'CHOCOLATE REFINER INSPECTION CHECKLIST', N'PRODUCTION TICKET PROCESS', CAST(N'2025-09-16T00:00:00.0000000' AS DateTime2), N'e7305241-6806-435b-b878-d82638eff11a', NULL, NULL)
GO
INSERT [dbo].[PicklistSets] ([Id], [Name], [Value], [Text], [Description], [Created], [CreatedBy], [LastModified], [LastModifiedBy]) VALUES (96, N'ProductionTicketChocolateProcess', N'CRLI', N'CHOCOLATE ROLLER INSPECTION CHECKLIST', N'PRODUCTION TICKET PROCESS', CAST(N'2025-09-16T00:00:00.0000000' AS DateTime2), N'e7305241-6806-435b-b878-d82638eff11a', NULL, NULL)
GO
INSERT [dbo].[PicklistSets] ([Id], [Name], [Value], [Text], [Description], [Created], [CreatedBy], [LastModified], [LastModifiedBy]) VALUES (97, N'ProductionTicketChocolateProcess', N'CDDI', N'CHOCOLATE DROPS DEPOSITOR INSPECTION', N'PRODUCTION TICKET PROCESS', CAST(N'2025-09-16T00:00:00.0000000' AS DateTime2), N'e7305241-6806-435b-b878-d82638eff11a', NULL, NULL)
GO
INSERT [dbo].[PicklistSets] ([Id], [Name], [Value], [Text], [Description], [Created], [CreatedBy], [LastModified], [LastModifiedBy]) VALUES (98, N'ProductionTicketChocolateProcess', N'WRPT', N'WRAPPING PRODUCTION TICKET', N'PRODUCTION TICKET PROCESS', CAST(N'2025-09-16T00:00:00.0000000' AS DateTime2), N'e7305241-6806-435b-b878-d82638eff11a', NULL, NULL)
GO
INSERT [dbo].[PicklistSets] ([Id], [Name], [Value], [Text], [Description], [Created], [CreatedBy], [LastModified], [LastModifiedBy]) VALUES (99, N'PMLocation', N'CHOCOLATE', N'CHOCOLATE', N'CHOCOLATE', CAST(N'2025-09-24T01:44:36.0737553' AS DateTime2), N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-09-24T01:55:09.3826963' AS DateTime2), N'e7305241-6806-435b-b878-d82638eff11a')
GO
INSERT [dbo].[PicklistSets] ([Id], [Name], [Value], [Text], [Description], [Created], [CreatedBy], [LastModified], [LastModifiedBy]) VALUES (100, N'PMLocation', N'BAKING LINE 1', N'BAKING LINE 1', N'BAKING LINE 1', CAST(N'2025-09-24T01:44:51.9102685' AS DateTime2), N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-09-24T01:55:04.4962938' AS DateTime2), N'e7305241-6806-435b-b878-d82638eff11a')
GO
INSERT [dbo].[PicklistSets] ([Id], [Name], [Value], [Text], [Description], [Created], [CreatedBy], [LastModified], [LastModifiedBy]) VALUES (101, N'PMLocation', N'BAKING LINE 2', N'BAKING LINE 2', N'BAKING LINE 2', CAST(N'2025-09-24T01:45:03.4277748' AS DateTime2), N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-09-24T01:54:57.0409114' AS DateTime2), N'e7305241-6806-435b-b878-d82638eff11a')
GO
INSERT [dbo].[PicklistSets] ([Id], [Name], [Value], [Text], [Description], [Created], [CreatedBy], [LastModified], [LastModifiedBy]) VALUES (102, N'PMLocation', N'PANNING', N'PANNING', N'PANNING', CAST(N'2025-09-24T01:45:16.5263530' AS DateTime2), N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-09-24T01:54:50.5917606' AS DateTime2), N'e7305241-6806-435b-b878-d82638eff11a')
GO
INSERT [dbo].[PicklistSets] ([Id], [Name], [Value], [Text], [Description], [Created], [CreatedBy], [LastModified], [LastModifiedBy]) VALUES (103, N'PMLocation', N'BARLINE', N'BARLINE', N'BARLINE', CAST(N'2025-09-24T01:46:11.1108047' AS DateTime2), N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-09-24T01:54:46.4293263' AS DateTime2), N'e7305241-6806-435b-b878-d82638eff11a')
GO
INSERT [dbo].[PicklistSets] ([Id], [Name], [Value], [Text], [Description], [Created], [CreatedBy], [LastModified], [LastModifiedBy]) VALUES (104, N'PMLocation', N'RICE CRISPIES', N'RICE CRISPIES', N'RICE CRISPIES', CAST(N'2025-09-24T01:46:23.7821611' AS DateTime2), N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-09-24T01:54:39.9072767' AS DateTime2), N'e7305241-6806-435b-b878-d82638eff11a')
GO
INSERT [dbo].[PicklistSets] ([Id], [Name], [Value], [Text], [Description], [Created], [CreatedBy], [LastModified], [LastModifiedBy]) VALUES (105, N'PMFrequency', N'5 years', N'5 years', N'5 years', CAST(N'2025-09-24T03:02:33.3196614' AS DateTime2), N'e7305241-6806-435b-b878-d82638eff11a', NULL, NULL)
GO
INSERT [dbo].[PicklistSets] ([Id], [Name], [Value], [Text], [Description], [Created], [CreatedBy], [LastModified], [LastModifiedBy]) VALUES (107, N'WorkOrderCategory', N'Fabrication', N'Fabrication', N'Fabrication', CAST(N'2025-10-16T05:17:11.6657029' AS DateTime2), N'e7305241-6806-435b-b878-d82638eff11a', NULL, NULL)
GO
INSERT [dbo].[PicklistSets] ([Id], [Name], [Value], [Text], [Description], [Created], [CreatedBy], [LastModified], [LastModifiedBy]) VALUES (108, N'WorkOrderStatus', N'Completed', N'Completed', N'Completed', CAST(N'2025-10-17T07:16:40.1331846' AS DateTime2), N'e7305241-6806-435b-b878-d82638eff11a', NULL, NULL)
GO
INSERT [dbo].[PicklistSets] ([Id], [Name], [Value], [Text], [Description], [Created], [CreatedBy], [LastModified], [LastModifiedBy]) VALUES (109, N'WorkOrderStatus', N'Not Yet Started', N'Not Yet Started', N'Not Yet Started', CAST(N'2025-10-17T07:17:07.3464931' AS DateTime2), N'e7305241-6806-435b-b878-d82638eff11a', NULL, NULL)
GO
INSERT [dbo].[PicklistSets] ([Id], [Name], [Value], [Text], [Description], [Created], [CreatedBy], [LastModified], [LastModifiedBy]) VALUES (110, N'WorkOrderStatus', N'Cancelled', N'Cancelled', N'Cancelled', CAST(N'2025-10-17T07:17:19.0591763' AS DateTime2), N'e7305241-6806-435b-b878-d82638eff11a', NULL, NULL)
GO
INSERT [dbo].[PicklistSets] ([Id], [Name], [Value], [Text], [Description], [Created], [CreatedBy], [LastModified], [LastModifiedBy]) VALUES (111, N'WorkOrderStatus', N'On-going', N'On-going', N'On-going', CAST(N'2025-10-17T07:43:41.9995360' AS DateTime2), N'e7305241-6806-435b-b878-d82638eff11a', NULL, NULL)
GO
INSERT [dbo].[PicklistSets] ([Id], [Name], [Value], [Text], [Description], [Created], [CreatedBy], [LastModified], [LastModifiedBy]) VALUES (112, N'JRQReason', N'Food Safety', N'Food Safety', N'Food Safety', CAST(N'2025-10-20T00:53:53.4219192' AS DateTime2), N'e7305241-6806-435b-b878-d82638eff11a', NULL, NULL)
GO
INSERT [dbo].[PicklistSets] ([Id], [Name], [Value], [Text], [Description], [Created], [CreatedBy], [LastModified], [LastModifiedBy]) VALUES (113, N'JRQReason', N'Quality Concern', N'Quality Concern', N'Quality Concern', CAST(N'2025-10-20T00:54:17.2545606' AS DateTime2), N'e7305241-6806-435b-b878-d82638eff11a', NULL, NULL)
GO
INSERT [dbo].[PicklistSets] ([Id], [Name], [Value], [Text], [Description], [Created], [CreatedBy], [LastModified], [LastModifiedBy]) VALUES (114, N'PMLocation', N'OTHERS', N'OTHERS', N'OTHERS', CAST(N'2025-10-20T01:00:53.5874341' AS DateTime2), N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-20T02:19:53.0988792' AS DateTime2), N'e7305241-6806-435b-b878-d82638eff11a')
GO
SET IDENTITY_INSERT [dbo].[PicklistSets] OFF
GO
SET IDENTITY_INSERT [dbo].[PreventiveMaintenances] ON 
GO
INSERT [dbo].[PreventiveMaintenances] ([Id], [Location], [UnitProcess], [MachineName], [MachineParts], [Task], [Checkpoint], [Frequency], [Classification], [StartingPoint], [NotificationReminder], [Status], [Created], [CreatedBy], [LastModifed], [LastModifiedBy], [AssignedTo], [WeekNumber], [DueWeek], [Section]) VALUES (53, N'BAKING LINE 1', N'BATCHING', N'Baking 1 (Flour Dumping)', N'Flour Hopper', N'Inspection of sugar hopper. Check for crack or dents on hopper, weld and repair dents on hopper', N'Inspection of sugar hopper. Check for crack or dents on hopper, weld and repair dents on hopper', N'Monthly', N'FC', 1, N'3 Weeks', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PreventiveMaintenances] ([Id], [Location], [UnitProcess], [MachineName], [MachineParts], [Task], [Checkpoint], [Frequency], [Classification], [StartingPoint], [NotificationReminder], [Status], [Created], [CreatedBy], [LastModifed], [LastModifiedBy], [AssignedTo], [WeekNumber], [DueWeek], [Section]) VALUES (54, N'BAKING LINE 1', N'BATCHING', N'Baking 1 (Flour Dumping)', N'Flour Hopper', N'Inspect the integrity of gasket', N'Inspect the integrity of gasket', N'Weekly', N'FC', 1, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PreventiveMaintenances] ([Id], [Location], [UnitProcess], [MachineName], [MachineParts], [Task], [Checkpoint], [Frequency], [Classification], [StartingPoint], [NotificationReminder], [Status], [Created], [CreatedBy], [LastModifed], [LastModifiedBy], [AssignedTo], [WeekNumber], [DueWeek], [Section]) VALUES (55, N'BAKING LINE 1', N'BATCHING', N'Baking 1 (Flour Dumping)', N'Flour Hopper', N'Replacement of rubber gasket.', N'Replacement of rubber gasket.', N'5 Years ', N'FC', 1, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PreventiveMaintenances] ([Id], [Location], [UnitProcess], [MachineName], [MachineParts], [Task], [Checkpoint], [Frequency], [Classification], [StartingPoint], [NotificationReminder], [Status], [Created], [CreatedBy], [LastModifed], [LastModifiedBy], [AssignedTo], [WeekNumber], [DueWeek], [Section]) VALUES (56, N'BAKING LINE 1', N'BATCHING', N'Baking 1 (Flour Dumping)', N'Flour Hopper', N'Check the right tightness of bolts & nuts', N'Check the right tightness of bolts & nuts', N'Monthly', N'NFC', 2, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PreventiveMaintenances] ([Id], [Location], [UnitProcess], [MachineName], [MachineParts], [Task], [Checkpoint], [Frequency], [Classification], [StartingPoint], [NotificationReminder], [Status], [Created], [CreatedBy], [LastModifed], [LastModifiedBy], [AssignedTo], [WeekNumber], [DueWeek], [Section]) VALUES (57, N'BAKING LINE 1', N'BATCHING', N'Baking 1 (Flour Dumping)', N'Horizontal Screw Feeder Drive Motor', N'Inspection of packing gland. Adjust if necessary.', N'Inspection of packing gland. Adjust if necessary.', N'Monthly', N'NFC', 2, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PreventiveMaintenances] ([Id], [Location], [UnitProcess], [MachineName], [MachineParts], [Task], [Checkpoint], [Frequency], [Classification], [StartingPoint], [NotificationReminder], [Status], [Created], [CreatedBy], [LastModifed], [LastModifiedBy], [AssignedTo], [WeekNumber], [DueWeek], [Section]) VALUES (58, N'BAKING LINE 1', N'BATCHING', N'Baking 1 (Flour Dumping)', N'Horizontal Screw Feeder Drive Motor', N'Inspect the key bar and set screw.', N'Inspect the key bar and set screw.', N'Monthly', N'NFC', 2, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PreventiveMaintenances] ([Id], [Location], [UnitProcess], [MachineName], [MachineParts], [Task], [Checkpoint], [Frequency], [Classification], [StartingPoint], [NotificationReminder], [Status], [Created], [CreatedBy], [LastModifed], [LastModifiedBy], [AssignedTo], [WeekNumber], [DueWeek], [Section]) VALUES (59, N'BAKING LINE 1', N'BATCHING', N'Baking 1 (Flour Dumping)', N'Horizontal Screw Feeder Drive Motor', N'Lubrication of flange bearing, clean and remove excess grease', N'Lubrication of flange bearing, clean and remove excess grease', N'Annually', N'NFC', 13, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PreventiveMaintenances] ([Id], [Location], [UnitProcess], [MachineName], [MachineParts], [Task], [Checkpoint], [Frequency], [Classification], [StartingPoint], [NotificationReminder], [Status], [Created], [CreatedBy], [LastModifed], [LastModifiedBy], [AssignedTo], [WeekNumber], [DueWeek], [Section]) VALUES (60, N'BAKING LINE 1', N'BATCHING', N'Baking 1 (Flour Dumping)', N'Horizontal Screw Feeder Drive Motor', N'Inspection of packing gland for powder leak. Adust packing gland if necessary. ', N'Inspection of packing gland for powder leak. Adust packing gland if necessary. ', N'Weekly', N'NFC', 1, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PreventiveMaintenances] ([Id], [Location], [UnitProcess], [MachineName], [MachineParts], [Task], [Checkpoint], [Frequency], [Classification], [StartingPoint], [NotificationReminder], [Status], [Created], [CreatedBy], [LastModifed], [LastModifiedBy], [AssignedTo], [WeekNumber], [DueWeek], [Section]) VALUES (61, N'BAKING LINE 1', N'BATCHING', N'Baking 1 (Flour Dumping)', N'Horizontal Screw Feeder Drive Motor', N'Replacement of packing seal for screw feeder', N'Replacement of packing seal for screw feeder', N'Annually', N'FC', 11, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PreventiveMaintenances] ([Id], [Location], [UnitProcess], [MachineName], [MachineParts], [Task], [Checkpoint], [Frequency], [Classification], [StartingPoint], [NotificationReminder], [Status], [Created], [CreatedBy], [LastModifed], [LastModifiedBy], [AssignedTo], [WeekNumber], [DueWeek], [Section]) VALUES (62, N'BAKING LINE 1', N'BATCHING', N'Baking 1 (Flour Dumping)', N'Horizontal Screw Feeder Drive Motor', N'Lubrication of chains & sprockets.', N'Lubrication of chains & sprockets.', N'Annually', N'NFC', 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PreventiveMaintenances] ([Id], [Location], [UnitProcess], [MachineName], [MachineParts], [Task], [Checkpoint], [Frequency], [Classification], [StartingPoint], [NotificationReminder], [Status], [Created], [CreatedBy], [LastModifed], [LastModifiedBy], [AssignedTo], [WeekNumber], [DueWeek], [Section]) VALUES (63, N'BAKING LINE 1', N'BATCHING', N'Baking 1 (Flour Dumping)', N'Horizontal Screw Feeder Drive Motor', N'Replacement of drive chain (40B)', N'Replacement of drive chain (40B)', N'5 Years ', N'NFC', 1, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PreventiveMaintenances] ([Id], [Location], [UnitProcess], [MachineName], [MachineParts], [Task], [Checkpoint], [Frequency], [Classification], [StartingPoint], [NotificationReminder], [Status], [Created], [CreatedBy], [LastModifed], [LastModifiedBy], [AssignedTo], [WeekNumber], [DueWeek], [Section]) VALUES (64, N'BAKING LINE 1', N'BATCHING', N'Baking 1 (Flour Dumping)', N'Horizontal Screw Feeder Drive Motor', N'Replacement of sprocket drive (40B2R)', N'Replacement of sprocket drive (40B2R)', N'20 Years ', N'NFC', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PreventiveMaintenances] ([Id], [Location], [UnitProcess], [MachineName], [MachineParts], [Task], [Checkpoint], [Frequency], [Classification], [StartingPoint], [NotificationReminder], [Status], [Created], [CreatedBy], [LastModifed], [LastModifiedBy], [AssignedTo], [WeekNumber], [DueWeek], [Section]) VALUES (146, N'CHOCOLATE', N'1ST BATCHING ', N'Rotary Vibratory Screen ', N'Bolts and Nuts', N'Check the tightness of bolt for clamp.', N'Check the tightness of bolt for clamp.', N'Monthly', N'NFC', 1, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PreventiveMaintenances] ([Id], [Location], [UnitProcess], [MachineName], [MachineParts], [Task], [Checkpoint], [Frequency], [Classification], [StartingPoint], [NotificationReminder], [Status], [Created], [CreatedBy], [LastModifed], [LastModifiedBy], [AssignedTo], [WeekNumber], [DueWeek], [Section]) VALUES (147, N'CHOCOLATE', N'1ST BATCHING ', N'Rotary Vibratory Screen ', N'Vibrator Drive Motor', N'Replacement of drive motor bearing.', N'Replacement of drive motor bearing.', N'5 Years ', N'NFC', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PreventiveMaintenances] ([Id], [Location], [UnitProcess], [MachineName], [MachineParts], [Task], [Checkpoint], [Frequency], [Classification], [StartingPoint], [NotificationReminder], [Status], [Created], [CreatedBy], [LastModifed], [LastModifiedBy], [AssignedTo], [WeekNumber], [DueWeek], [Section]) VALUES (148, N'CHOCOLATE', N'1ST BATCHING ', N'Rotary Vibratory Screen ', N'Vibrator Drive Motor', N'Inspect the counter button weight assembly.', N'Inspect the counter button weight assembly.', N'Annually', N'NFC', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PreventiveMaintenances] ([Id], [Location], [UnitProcess], [MachineName], [MachineParts], [Task], [Checkpoint], [Frequency], [Classification], [StartingPoint], [NotificationReminder], [Status], [Created], [CreatedBy], [LastModifed], [LastModifiedBy], [AssignedTo], [WeekNumber], [DueWeek], [Section]) VALUES (149, N'CHOCOLATE', N'1ST BATCHING ', N'Rotary Vibratory Screen ', N'Vibrator Drive Motor', N'Replacement of drive motor (rewinding or re-insulation of drive motor)', N'Replacement of drive motor (rewinding or re-insulation of drive motor)', N'Annually', N'NFC', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PreventiveMaintenances] ([Id], [Location], [UnitProcess], [MachineName], [MachineParts], [Task], [Checkpoint], [Frequency], [Classification], [StartingPoint], [NotificationReminder], [Status], [Created], [CreatedBy], [LastModifed], [LastModifiedBy], [AssignedTo], [WeekNumber], [DueWeek], [Section]) VALUES (150, N'CHOCOLATE', N'1ST BATCHING ', N'Rotary Vibratory Screen ', N'Spring Spools', N'Check the spring spools for any damage. Replace if necessary.', N'Check the spring spools for any damage. Replace if necessary.', N'Monthly', N'NFC', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PreventiveMaintenances] ([Id], [Location], [UnitProcess], [MachineName], [MachineParts], [Task], [Checkpoint], [Frequency], [Classification], [StartingPoint], [NotificationReminder], [Status], [Created], [CreatedBy], [LastModifed], [LastModifiedBy], [AssignedTo], [WeekNumber], [DueWeek], [Section]) VALUES (151, N'CHOCOLATE', N'1ST BATCHING ', N'Rotary Vibratory Screen ', N'Vibrating Spring', N'Inspect the mounting position of spring and rubber.', N'Inspect the mounting position of spring and rubber.', N'Quarterly', N'NFC', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PreventiveMaintenances] ([Id], [Location], [UnitProcess], [MachineName], [MachineParts], [Task], [Checkpoint], [Frequency], [Classification], [StartingPoint], [NotificationReminder], [Status], [Created], [CreatedBy], [LastModifed], [LastModifiedBy], [AssignedTo], [WeekNumber], [DueWeek], [Section]) VALUES (152, N'CHOCOLATE', N'1ST BATCHING ', N'Rotary Vibratory Screen ', N'PU Belt Connector', N'Inspect the integrity of PU Belt. Replace if neccesary', N'Inspect the integrity of PU Belt. Replace if neccesary', N'Monthly', N'FC', 3, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PreventiveMaintenances] ([Id], [Location], [UnitProcess], [MachineName], [MachineParts], [Task], [Checkpoint], [Frequency], [Classification], [StartingPoint], [NotificationReminder], [Status], [Created], [CreatedBy], [LastModifed], [LastModifiedBy], [AssignedTo], [WeekNumber], [DueWeek], [Section]) VALUES (153, N'CHOCOLATE', N'1ST BATCHING ', N'Sugar Rotary Valve After Rotary Vibrating Screen ', N'Grate Magnet ', N'Inspect the surface & functions of magnet. Replace if necessary', N'Inspect the surface & functions of magnet. Replace if necessary', N'Monthly', N'FC', 4, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PreventiveMaintenances] ([Id], [Location], [UnitProcess], [MachineName], [MachineParts], [Task], [Checkpoint], [Frequency], [Classification], [StartingPoint], [NotificationReminder], [Status], [Created], [CreatedBy], [LastModifed], [LastModifiedBy], [AssignedTo], [WeekNumber], [DueWeek], [Section]) VALUES (154, N'CHOCOLATE', N'1ST BATCHING ', N'Sugar Rotary Valve After Rotary Vibrating Screen ', N'Flange Bolts and Nuts ', N'Check the tightness of bolt for flange of rotary valve motor (4 pcs)', N'Check the tightness of bolt for flange of rotary valve motor (4 pcs)', N'Monthly', N'NFC', 1, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PreventiveMaintenances] ([Id], [Location], [UnitProcess], [MachineName], [MachineParts], [Task], [Checkpoint], [Frequency], [Classification], [StartingPoint], [NotificationReminder], [Status], [Created], [CreatedBy], [LastModifed], [LastModifiedBy], [AssignedTo], [WeekNumber], [DueWeek], [Section]) VALUES (155, N'CHOCOLATE', N'1ST BATCHING ', N'Sugar Rotary Valve After Rotary Vibrating Screen ', N'Rotary Drive Motor', N'Replacement of drive motor bearing.', N'Replacement of drive motor bearing.', N'5 Years ', N'NFC', 1, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PreventiveMaintenances] ([Id], [Location], [UnitProcess], [MachineName], [MachineParts], [Task], [Checkpoint], [Frequency], [Classification], [StartingPoint], [NotificationReminder], [Status], [Created], [CreatedBy], [LastModifed], [LastModifiedBy], [AssignedTo], [WeekNumber], [DueWeek], [Section]) VALUES (156, N'CHOCOLATE', N'1ST BATCHING ', N'Sugar Rotary Valve After Rotary Vibrating Screen ', N'Rotary Drive Motor', N'Inspection of sprocket, key bar and drive chain.', N'Inspection of sprocket, key bar and drive chain.', N'Annually', N'NFC', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PreventiveMaintenances] ([Id], [Location], [UnitProcess], [MachineName], [MachineParts], [Task], [Checkpoint], [Frequency], [Classification], [StartingPoint], [NotificationReminder], [Status], [Created], [CreatedBy], [LastModifed], [LastModifiedBy], [AssignedTo], [WeekNumber], [DueWeek], [Section]) VALUES (157, N'CHOCOLATE', N'1ST BATCHING ', N'Sugar Rotary Valve After Rotary Vibrating Screen ', N'Rotary Drive Motor', N'Replacement of drive chain.', N'Replacement of drive chain.', N'2 Years ', N'NFC', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PreventiveMaintenances] ([Id], [Location], [UnitProcess], [MachineName], [MachineParts], [Task], [Checkpoint], [Frequency], [Classification], [StartingPoint], [NotificationReminder], [Status], [Created], [CreatedBy], [LastModifed], [LastModifiedBy], [AssignedTo], [WeekNumber], [DueWeek], [Section]) VALUES (158, N'CHOCOLATE', N'1ST BATCHING ', N'Sugar Rotary Valve After Rotary Vibrating Screen ', N'Rotary Drive Motor', N'Replacement of sprocket.', N'Replacement of sprocket.', N'4 Years ', N'NFC', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PreventiveMaintenances] ([Id], [Location], [UnitProcess], [MachineName], [MachineParts], [Task], [Checkpoint], [Frequency], [Classification], [StartingPoint], [NotificationReminder], [Status], [Created], [CreatedBy], [LastModifed], [LastModifiedBy], [AssignedTo], [WeekNumber], [DueWeek], [Section]) VALUES (159, N'MARSHMALLOW', N'AERATING ', N'Syrup Pump After Mixing Head Line 5', N' Fristan Pump', N'Preventive change  oil.', N'Preventive change  oil.', N'2 Years ', N'NFC', 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PreventiveMaintenances] ([Id], [Location], [UnitProcess], [MachineName], [MachineParts], [Task], [Checkpoint], [Frequency], [Classification], [StartingPoint], [NotificationReminder], [Status], [Created], [CreatedBy], [LastModifed], [LastModifiedBy], [AssignedTo], [WeekNumber], [DueWeek], [Section]) VALUES (160, N'MARSHMALLOW', N'AERATING ', N'Syrup Pump After Mixing Head Line 5', N' Fristan Pump', N'Visual inspection of mounting bolt. ', N'Visual inspection of mounting bolt. ', N'Monthly', N'NFC', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PreventiveMaintenances] ([Id], [Location], [UnitProcess], [MachineName], [MachineParts], [Task], [Checkpoint], [Frequency], [Classification], [StartingPoint], [NotificationReminder], [Status], [Created], [CreatedBy], [LastModifed], [LastModifiedBy], [AssignedTo], [WeekNumber], [DueWeek], [Section]) VALUES (161, N'MARSHMALLOW', N'AERATING ', N'Syrup Pump After Mixing Head Line 5', N' Fristan Pump', N'Visual inspection the shafting. Replacement if necessary. ', N'Visual inspection the shafting. Replacement if necessary. ', N'3 Years ', N'FC', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PreventiveMaintenances] ([Id], [Location], [UnitProcess], [MachineName], [MachineParts], [Task], [Checkpoint], [Frequency], [Classification], [StartingPoint], [NotificationReminder], [Status], [Created], [CreatedBy], [LastModifed], [LastModifiedBy], [AssignedTo], [WeekNumber], [DueWeek], [Section]) VALUES (162, N'MARSHMALLOW', N'AERATING ', N'Syrup Pump After Mixing Head Line 5', N' Fristan Pump', N'Visual inspection and testing for bearing play. ', N'Visual inspection and testing for bearing play. ', N'3 Years ', N'NFC', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PreventiveMaintenances] ([Id], [Location], [UnitProcess], [MachineName], [MachineParts], [Task], [Checkpoint], [Frequency], [Classification], [StartingPoint], [NotificationReminder], [Status], [Created], [CreatedBy], [LastModifed], [LastModifiedBy], [AssignedTo], [WeekNumber], [DueWeek], [Section]) VALUES (163, N'MARSHMALLOW', N'AERATING ', N'Syrup Pump After Mixing Head Line 5', N' Fristan Pump', N'Preventive replacement  bearing & greasing.', N'Preventive replacement  bearing & greasing.', N'3 Years ', N'NFC', 1, N'1 Week', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PreventiveMaintenances] ([Id], [Location], [UnitProcess], [MachineName], [MachineParts], [Task], [Checkpoint], [Frequency], [Classification], [StartingPoint], [NotificationReminder], [Status], [Created], [CreatedBy], [LastModifed], [LastModifiedBy], [AssignedTo], [WeekNumber], [DueWeek], [Section]) VALUES (164, N'MARSHMALLOW', N'AERATING ', N'Syrup Pump After Mixing Head Line 5', N' Fristan Pump', N'Preventive replacement mechanical seal & oil seal.', N'Preventive replacement mechanical seal & oil seal.', N'3 Years ', N'NFC', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PreventiveMaintenances] ([Id], [Location], [UnitProcess], [MachineName], [MachineParts], [Task], [Checkpoint], [Frequency], [Classification], [StartingPoint], [NotificationReminder], [Status], [Created], [CreatedBy], [LastModifed], [LastModifiedBy], [AssignedTo], [WeekNumber], [DueWeek], [Section]) VALUES (165, N'MARSHMALLOW', N'COLOR PUMP', N'Sera Pump - Colouring Pump Line 5', N'Pump Head #1', N'Visual inspection and listen for abromal noise.', N'Visual inspection and listen for abromal noise.', N'Monthly', N'NFC', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PreventiveMaintenances] ([Id], [Location], [UnitProcess], [MachineName], [MachineParts], [Task], [Checkpoint], [Frequency], [Classification], [StartingPoint], [NotificationReminder], [Status], [Created], [CreatedBy], [LastModifed], [LastModifiedBy], [AssignedTo], [WeekNumber], [DueWeek], [Section]) VALUES (166, N'MARSHMALLOW', N'COLOR PUMP', N'Sera Pump - Colouring Pump Line 5', N'Pump Head #1', N'Check that  the oil level cannot sink below the minimum position when the cylinder is positioned in the outer position.Refill if necessary.', N'Check that  the oil level cannot sink below the minimum position when the cylinder is positioned in the outer position.Refill if necessary.', N'Monthly', N'NFC', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PreventiveMaintenances] ([Id], [Location], [UnitProcess], [MachineName], [MachineParts], [Task], [Checkpoint], [Frequency], [Classification], [StartingPoint], [NotificationReminder], [Status], [Created], [CreatedBy], [LastModifed], [LastModifiedBy], [AssignedTo], [WeekNumber], [DueWeek], [Section]) VALUES (167, N'MARSHMALLOW', N'COLOR PUMP', N'Sera Pump - Colouring Pump Line 5', N'Pump Head #1', N'Routine and visual  inspection for posible leaking the pump head.', N'Routine and visual  inspection for posible leaking the pump head.', N'Monthly', N'NFC', 1, N'1 Week', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PreventiveMaintenances] ([Id], [Location], [UnitProcess], [MachineName], [MachineParts], [Task], [Checkpoint], [Frequency], [Classification], [StartingPoint], [NotificationReminder], [Status], [Created], [CreatedBy], [LastModifed], [LastModifiedBy], [AssignedTo], [WeekNumber], [DueWeek], [Section]) VALUES (168, N'MARSHMALLOW', N'COLOR PUMP', N'Sera Pump - Colouring Pump Line 5', N'Pump head #1', N'Preventive replacement of bearings.', N'Preventive replacement of bearings.', N'3 Years ', N'NFC', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PreventiveMaintenances] ([Id], [Location], [UnitProcess], [MachineName], [MachineParts], [Task], [Checkpoint], [Frequency], [Classification], [StartingPoint], [NotificationReminder], [Status], [Created], [CreatedBy], [LastModifed], [LastModifiedBy], [AssignedTo], [WeekNumber], [DueWeek], [Section]) VALUES (169, N'MARSHMALLOW', N'COLOR PUMP', N'Sera Pump - Colouring Pump Line 5', N'Pump Head #1', N'Preventive change  oil. (food grade oil)', N'Preventive change  oil. (food grade oil)', N'3 Years ', N'NFC', 1, N'2 Weeks', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PreventiveMaintenances] ([Id], [Location], [UnitProcess], [MachineName], [MachineParts], [Task], [Checkpoint], [Frequency], [Classification], [StartingPoint], [NotificationReminder], [Status], [Created], [CreatedBy], [LastModifed], [LastModifiedBy], [AssignedTo], [WeekNumber], [DueWeek], [Section]) VALUES (170, N'MARSHMALLOW', N'COLOR PUMP', N'Sera Pump - Colouring Pump Line 5', N'Pump Head #1', N'Preventive inspection Silicon diaphragm.replacement if necessary', N'Preventive inspection Silicon diaphragm.replacement if necessary', N'Annually', N'FC', 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PreventiveMaintenances] ([Id], [Location], [UnitProcess], [MachineName], [MachineParts], [Task], [Checkpoint], [Frequency], [Classification], [StartingPoint], [NotificationReminder], [Status], [Created], [CreatedBy], [LastModifed], [LastModifiedBy], [AssignedTo], [WeekNumber], [DueWeek], [Section]) VALUES (171, N'MARSHMALLOW', N'COLOR PUMP', N'Sera Pump - Colouring Pump Line 5', N'Pump Motor #1', N'Visual inspection and listen for abromal noise.', N'Visual inspection and listen for abromal noise.', N'Monthly', N'NFC', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PreventiveMaintenances] ([Id], [Location], [UnitProcess], [MachineName], [MachineParts], [Task], [Checkpoint], [Frequency], [Classification], [StartingPoint], [NotificationReminder], [Status], [Created], [CreatedBy], [LastModifed], [LastModifiedBy], [AssignedTo], [WeekNumber], [DueWeek], [Section]) VALUES (172, N'MARSHMALLOW', N'COLOR PUMP', N'Sera Pump - Colouring Pump Line 5', N'Pump head #1', N'Preventive replacemen bearing & greasing.', N'Preventive replacemen bearing & greasing.', N'5 Years ', N'NFC', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PreventiveMaintenances] ([Id], [Location], [UnitProcess], [MachineName], [MachineParts], [Task], [Checkpoint], [Frequency], [Classification], [StartingPoint], [NotificationReminder], [Status], [Created], [CreatedBy], [LastModifed], [LastModifiedBy], [AssignedTo], [WeekNumber], [DueWeek], [Section]) VALUES (173, N'MARSHMALLOW', N'COLOR PUMP', N'Sera Pump - Colouring Pump Line 5', N'Pump Motor #1', N'Preventive replacement drive motor ( other option rewinding or re insulation the winding excisting motor', N'Preventive replacement drive motor ( other option rewinding or re insulation the winding excisting motor', N'20 Years ', N'NFC', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PreventiveMaintenances] ([Id], [Location], [UnitProcess], [MachineName], [MachineParts], [Task], [Checkpoint], [Frequency], [Classification], [StartingPoint], [NotificationReminder], [Status], [Created], [CreatedBy], [LastModifed], [LastModifiedBy], [AssignedTo], [WeekNumber], [DueWeek], [Section]) VALUES (174, N'MARSHMALLOW', N'COLOR PUMP', N'Sera Pump - Colouring Pump Line 5', N'Coloring Tank #1', N'Preventive inspection position of bypass valve going to tank.', N'Preventive inspection position of bypass valve going to tank.', N'Annually', N'FC', 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[PreventiveMaintenances] ([Id], [Location], [UnitProcess], [MachineName], [MachineParts], [Task], [Checkpoint], [Frequency], [Classification], [StartingPoint], [NotificationReminder], [Status], [Created], [CreatedBy], [LastModifed], [LastModifiedBy], [AssignedTo], [WeekNumber], [DueWeek], [Section]) VALUES (175, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[PreventiveMaintenances] OFF
GO
SET IDENTITY_INSERT [dbo].[WorkOrders] ON 
GO
INSERT [dbo].[WorkOrders] ([WorkOrderID], [JobRequestId], [PreventiveMaintenanceId], [RefId], [Title], [Description], [Category], [AssignedTo], [Location], [Status], [Machine], [Priority], [WeekNumberSched], [Created], [CreatedBy], [LastModified], [LastModifiedBy], [TenantId], [TenantName], [LastModifiedByUserId], [CreatedByUserId], [AssignedName]) VALUES (1, 6, NULL, N'WO251000001', N'2qe233232', N'd4324324324', N'Improvement', NULL, N'BAKING LINE 2', N'Not Yet Started', N'4324324324', N'Low', NULL, CAST(N'2025-10-20T10:36:45.810' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[WorkOrders] ([WorkOrderID], [JobRequestId], [PreventiveMaintenanceId], [RefId], [Title], [Description], [Category], [AssignedTo], [Location], [Status], [Machine], [Priority], [WeekNumberSched], [Created], [CreatedBy], [LastModified], [LastModifiedBy], [TenantId], [TenantName], [LastModifiedByUserId], [CreatedByUserId], [AssignedName]) VALUES (2, 9, NULL, N'WO251000002', N'dsadsadsadasdsadewer32er', N'r324324234r', N'Quality Concern', NULL, N'MARSHMALLOW', N'Not Yet Started', N'ewrewrwer', N'High', NULL, CAST(N'2025-10-20T11:12:18.757' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[WorkOrders] ([WorkOrderID], [JobRequestId], [PreventiveMaintenanceId], [RefId], [Title], [Description], [Category], [AssignedTo], [Location], [Status], [Machine], [Priority], [WeekNumberSched], [Created], [CreatedBy], [LastModified], [LastModifiedBy], [TenantId], [TenantName], [LastModifiedByUserId], [CreatedByUserId], [AssignedName]) VALUES (6, NULL, 160, N'WO251000003', N'PM - Syrup Pump After Mixing Head Line 5', N'Preventive Maintenance Tasks for Week Number 43', N'Preventive Maintenance', NULL, N'MARSHMALLOW', N'Not Yet Started', N'Syrup Pump After Mixing Head Line 5', N'High', 43, CAST(N'2025-10-20T11:18:27.830' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[WorkOrders] ([WorkOrderID], [JobRequestId], [PreventiveMaintenanceId], [RefId], [Title], [Description], [Category], [AssignedTo], [Location], [Status], [Machine], [Priority], [WeekNumberSched], [Created], [CreatedBy], [LastModified], [LastModifiedBy], [TenantId], [TenantName], [LastModifiedByUserId], [CreatedByUserId], [AssignedName]) VALUES (7, NULL, 152, N'WO251000004', N'PM - Rotary Vibratory Screen ', N'Preventive Maintenance Tasks for Week Number 43', N'Preventive Maintenance', NULL, N'CHOCOLATE', N'Not Yet Started', N'Rotary Vibratory Screen ', N'High', 43, CAST(N'2025-10-20T11:18:27.853' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[WorkOrders] ([WorkOrderID], [JobRequestId], [PreventiveMaintenanceId], [RefId], [Title], [Description], [Category], [AssignedTo], [Location], [Status], [Machine], [Priority], [WeekNumberSched], [Created], [CreatedBy], [LastModified], [LastModifiedBy], [TenantId], [TenantName], [LastModifiedByUserId], [CreatedByUserId], [AssignedName]) VALUES (8, NULL, 54, N'WO251000005', N'PM - Baking 1 (Flour Dumping)', N'Preventive Maintenance Tasks for Week Number 43', N'Preventive Maintenance', 3, N'BAKING LINE 1', N'Not Yet Started', N'Baking 1 (Flour Dumping)', N'High', 43, CAST(N'2025-10-20T11:18:27.863' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[WorkOrders] OFF
GO
SET IDENTITY_INSERT [dbo].[WorkOrderTasks] ON 
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (124, 245, N'Pump Head #1', N'Check that  the oil level cannot sink below the minimum position when the cylinder is positioned in the outer position.Refill if necessary.', 0, NULL, NULL, N'Monthly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-15T05:51:29.113' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (125, 246, N'Spring Spools', N'Check the spring spools for any damage. Replace if necessary.', 0, NULL, NULL, N'Monthly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-15T05:51:29.163' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (126, 246, N'Vibrating Spring', N'Inspect the mounting position of spring and rubber.', 0, NULL, NULL, N'Quarterly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-15T05:51:29.163' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (127, 247, N'Flour Hopper', N'Inspect the integrity of gasket', 0, NULL, NULL, N'Weekly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-15T05:51:29.200' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (128, 247, N'Flour Hopper', N'Check the right tightness of bolts & nuts', 0, NULL, NULL, N'Monthly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-15T05:51:29.200' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (129, 247, N'Horizontal Screw Feeder Drive Motor', N'Inspection of packing gland. Adjust if necessary.', 0, NULL, NULL, N'Monthly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-15T05:51:29.200' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (130, 247, N'Horizontal Screw Feeder Drive Motor', N'Inspect the key bar and set screw.', 0, NULL, NULL, N'Monthly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-15T05:51:29.200' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (131, 247, N'Horizontal Screw Feeder Drive Motor', N'Inspection of packing gland for powder leak. Adust packing gland if necessary. ', 0, NULL, NULL, N'Weekly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-15T05:51:29.200' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (132, 248, N'Pump Head #1', N'Check that  the oil level cannot sink below the minimum position when the cylinder is positioned in the outer position.Refill if necessary.', 0, NULL, NULL, N'Monthly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-15T07:18:35.423' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (133, 249, N'Spring Spools', N'Check the spring spools for any damage. Replace if necessary.', 0, NULL, NULL, N'Monthly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-15T07:18:35.530' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (134, 249, N'Vibrating Spring', N'Inspect the mounting position of spring and rubber.', 0, NULL, NULL, N'Quarterly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-15T07:18:35.530' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (135, 250, N'Flour Hopper', N'Inspect the integrity of gasket', 0, NULL, NULL, N'Weekly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-15T07:18:35.577' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (136, 250, N'Flour Hopper', N'Check the right tightness of bolts & nuts', 0, NULL, NULL, N'Monthly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-15T07:18:35.577' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (137, 250, N'Horizontal Screw Feeder Drive Motor', N'Inspection of packing gland. Adjust if necessary.', 0, NULL, NULL, N'Monthly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-15T07:18:35.577' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (138, 250, N'Horizontal Screw Feeder Drive Motor', N'Inspect the key bar and set screw.', 0, NULL, NULL, N'Monthly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-15T07:18:35.577' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (139, 250, N'Horizontal Screw Feeder Drive Motor', N'Inspection of packing gland for powder leak. Adust packing gland if necessary. ', 0, NULL, NULL, N'Weekly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-15T07:18:35.577' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (141, 252, N'Spring Spools', N'Check the spring spools for any damage. Replace if necessary.', 1, N'wewewqe', NULL, N'Monthly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-15T07:21:34.667' AS DateTime), N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-16T06:51:19.163' AS DateTime))
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (142, 252, N'Vibrating Spring', N'Inspect the mounting position of spring and rubber.', 1, NULL, NULL, N'Quarterly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-15T07:21:34.667' AS DateTime), N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-16T06:51:44.773' AS DateTime))
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (140, 251, N'Pump Head #1', N'Check that  the oil level cannot sink below the minimum position when the cylinder is positioned in the outer position.Refill if necessary.', 1, N'ewrretertrt', NULL, N'Monthly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-15T07:21:34.617' AS DateTime), N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-16T06:51:42.180' AS DateTime))
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (143, 253, N'Flour Hopper', N'Inspect the integrity of gasket', 1, NULL, NULL, N'Weekly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-15T07:21:34.687' AS DateTime), N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-16T07:01:09.370' AS DateTime))
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (144, 253, N'Flour Hopper', N'Check the right tightness of bolts & nuts', 0, N'HAKD66OGGGGGGGG', N'uploads/2ae3e015-f3a3-4593-bce9-0052b5c70fd6_-ks7RG7Q.jpg', N'Monthly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-15T07:21:34.687' AS DateTime), N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-17T00:02:36.593' AS DateTime))
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (145, 253, N'Horizontal Screw Feeder Drive Motor', N'Inspection of packing gland. Adjust if necessary.', 1, NULL, NULL, N'Monthly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-15T07:21:34.687' AS DateTime), N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-16T07:01:09.370' AS DateTime))
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (146, 253, N'Horizontal Screw Feeder Drive Motor', N'Inspect the key bar and set screw.', 1, NULL, NULL, N'Monthly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-15T07:21:34.687' AS DateTime), N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-16T07:01:09.370' AS DateTime))
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (147, 253, N'Horizontal Screw Feeder Drive Motor', N'Inspection of packing gland for powder leak. Adust packing gland if necessary. ', 1, NULL, NULL, N'Weekly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-15T07:21:34.687' AS DateTime), N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-16T07:01:09.370' AS DateTime))
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (148, 258, N' Fristan Pump', N'Visual inspection of mounting bolt. ', 0, NULL, NULL, N'Monthly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-16T15:37:27.233' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (149, 259, N'PU Belt Connector', N'Inspect the integrity of PU Belt. Replace if neccesary', 0, NULL, NULL, N'Monthly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-16T15:37:27.363' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (150, 260, N'Flour Hopper', N'Inspect the integrity of gasket', 0, NULL, NULL, N'Weekly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-16T15:37:27.390' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (151, 260, N'Horizontal Screw Feeder Drive Motor', N'Inspection of packing gland for powder leak. Adust packing gland if necessary. ', 0, NULL, NULL, N'Weekly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-16T15:37:27.390' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (152, 264, N' Fristan Pump', N'Visual inspection of mounting bolt. ', 0, NULL, NULL, N'Monthly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-17T06:35:08.530' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (153, 265, N'PU Belt Connector', N'Inspect the integrity of PU Belt. Replace if neccesary', 0, NULL, NULL, N'Monthly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-17T06:35:08.587' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (154, 266, N'Flour Hopper', N'Inspect the integrity of gasket', 0, NULL, NULL, N'Weekly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-17T06:35:08.597' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (155, 266, N'Horizontal Screw Feeder Drive Motor', N'Inspection of packing gland for powder leak. Adust packing gland if necessary. ', 0, NULL, NULL, N'Weekly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-17T06:35:08.597' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (156, 267, N' Fristan Pump', N'Visual inspection of mounting bolt. ', 0, NULL, NULL, N'Monthly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-17T06:46:09.350' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (157, 268, N'PU Belt Connector', N'Inspect the integrity of PU Belt. Replace if neccesary', 0, NULL, NULL, N'Monthly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-17T06:46:09.460' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (160, 271, N'Pump Head #1', N'Check that  the oil level cannot sink below the minimum position when the cylinder is positioned in the outer position.Refill if necessary.', 0, NULL, NULL, N'Monthly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-17T06:51:42.323' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (161, 272, N'Spring Spools', N'Check the spring spools for any damage. Replace if necessary.', 0, NULL, NULL, N'Monthly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-17T06:51:42.503' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (162, 272, N'Vibrating Spring', N'Inspect the mounting position of spring and rubber.', 0, NULL, NULL, N'Quarterly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-17T06:51:42.503' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (163, 273, N'Flour Hopper', N'Inspect the integrity of gasket', 0, NULL, NULL, N'Weekly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-17T06:51:42.557' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (164, 273, N'Flour Hopper', N'Check the right tightness of bolts & nuts', 0, NULL, NULL, N'Monthly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-17T06:51:42.557' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (165, 273, N'Horizontal Screw Feeder Drive Motor', N'Inspection of packing gland. Adjust if necessary.', 0, NULL, NULL, N'Monthly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-17T06:51:42.557' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (166, 273, N'Horizontal Screw Feeder Drive Motor', N'Inspect the key bar and set screw.', 0, NULL, NULL, N'Monthly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-17T06:51:42.557' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (167, 273, N'Horizontal Screw Feeder Drive Motor', N'Inspection of packing gland for powder leak. Adust packing gland if necessary. ', 0, NULL, NULL, N'Weekly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-17T06:51:42.557' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (168, 274, N'Pump Head #1', N'Check that  the oil level cannot sink below the minimum position when the cylinder is positioned in the outer position.Refill if necessary.', 0, NULL, NULL, N'Monthly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-17T06:56:48.250' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (169, 275, N'Spring Spools', N'Check the spring spools for any damage. Replace if necessary.', 0, NULL, NULL, N'Monthly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-17T06:56:48.373' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (170, 275, N'Vibrating Spring', N'Inspect the mounting position of spring and rubber.', 0, NULL, NULL, N'Quarterly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-17T06:56:48.373' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (171, 276, N'Flour Hopper', N'Inspect the integrity of gasket', 0, NULL, NULL, N'Weekly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-17T06:56:48.443' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (172, 276, N'Flour Hopper', N'Check the right tightness of bolts & nuts', 0, NULL, NULL, N'Monthly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-17T06:56:48.443' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (173, 276, N'Horizontal Screw Feeder Drive Motor', N'Inspection of packing gland. Adjust if necessary.', 0, NULL, NULL, N'Monthly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-17T06:56:48.443' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (174, 276, N'Horizontal Screw Feeder Drive Motor', N'Inspect the key bar and set screw.', 0, NULL, NULL, N'Monthly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-17T06:56:48.443' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (158, 269, N'Flour Hopper', N'Inspect the integrity of gasket', 0, NULL, NULL, N'Weekly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-17T06:46:09.483' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (159, 269, N'Horizontal Screw Feeder Drive Motor', N'Inspection of packing gland for powder leak. Adust packing gland if necessary. ', 0, NULL, NULL, N'Weekly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-17T06:46:09.483' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (175, 276, N'Horizontal Screw Feeder Drive Motor', N'Inspection of packing gland for powder leak. Adust packing gland if necessary. ', 0, NULL, NULL, N'Weekly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-17T06:56:48.443' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (184, 281, N'Pump Head #1', N'Visual inspection and listen for abromal noise.', 0, NULL, NULL, N'Monthly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-17T07:07:29.063' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (185, 281, N'Pump Head #1', N'Routine and visual  inspection for posible leaking the pump head.', 0, NULL, NULL, N'Monthly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-17T07:07:29.063' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (186, 282, N'Flange Bolts and Nuts ', N'Check the tightness of bolt for flange of rotary valve motor (4 pcs)', 0, NULL, NULL, N'Monthly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-17T07:07:29.140' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (187, 283, N'Bolts and Nuts', N'Check the tightness of bolt for clamp.', 0, NULL, NULL, N'Monthly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-17T07:07:29.150' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (188, 284, N'Flour Hopper', N'Inspection of sugar hopper. Check for crack or dents on hopper, weld and repair dents on hopper', 0, NULL, NULL, N'Monthly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-17T07:07:29.160' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (189, 284, N'Flour Hopper', N'Inspect the integrity of gasket', 0, NULL, NULL, N'Weekly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-17T07:07:29.160' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (190, 284, N'Horizontal Screw Feeder Drive Motor', N'Inspection of packing gland for powder leak. Adust packing gland if necessary. ', 0, NULL, NULL, N'Weekly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-17T07:07:29.160' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (191, 289, N' Fristan Pump', N'Visual inspection of mounting bolt. ', 0, NULL, NULL, N'Monthly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-20T00:13:33.107' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (192, 290, N'PU Belt Connector', N'Inspect the integrity of PU Belt. Replace if neccesary', 0, NULL, NULL, N'Monthly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-20T00:13:33.133' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (193, 291, N'Flour Hopper', N'Inspect the integrity of gasket', 0, NULL, NULL, N'Weekly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-20T00:13:33.140' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (194, 291, N'Horizontal Screw Feeder Drive Motor', N'Inspection of packing gland for powder leak. Adust packing gland if necessary. ', 0, NULL, NULL, N'Weekly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-20T00:13:33.140' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (195, 292, N'Pump Motor #1', N'Visual inspection and listen for abromal noise.', 0, NULL, NULL, N'Monthly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-20T00:14:17.780' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (196, 293, N'Grate Magnet ', N'Inspect the surface & functions of magnet. Replace if necessary', 0, NULL, NULL, N'Monthly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-20T00:14:17.803' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (197, 294, N'Flour Hopper', N'Inspect the integrity of gasket', 0, NULL, NULL, N'Weekly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-20T00:14:17.810' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (198, 294, N'Horizontal Screw Feeder Drive Motor', N'Inspection of packing gland for powder leak. Adust packing gland if necessary. ', 0, NULL, NULL, N'Weekly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-20T00:14:17.810' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (199, 296, N' Fristan Pump', N'Visual inspection of mounting bolt. ', 0, NULL, NULL, N'Monthly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-20T00:27:57.090' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (200, 297, N'PU Belt Connector', N'Inspect the integrity of PU Belt. Replace if neccesary', 0, NULL, NULL, N'Monthly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-20T00:27:57.123' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (201, 298, N'Flour Hopper', N'Inspect the integrity of gasket', 0, NULL, NULL, N'Weekly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-20T00:27:57.133' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (202, 298, N'Horizontal Screw Feeder Drive Motor', N'Inspection of packing gland for powder leak. Adust packing gland if necessary. ', 0, NULL, NULL, N'Weekly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-20T00:27:57.133' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (207, 308, N' Fristan Pump', N'Visual inspection of mounting bolt. ', 0, NULL, NULL, N'Monthly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-20T00:39:04.553' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (208, 309, N'PU Belt Connector', N'Inspect the integrity of PU Belt. Replace if neccesary', 0, NULL, NULL, N'Monthly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-20T00:39:04.610' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (209, 310, N'Flour Hopper', N'Inspect the integrity of gasket', 0, NULL, NULL, N'Weekly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-20T00:39:04.630' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (210, 310, N'Horizontal Screw Feeder Drive Motor', N'Inspection of packing gland for powder leak. Adust packing gland if necessary. ', 0, NULL, NULL, N'Weekly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-20T00:39:04.630' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (176, 277, N'Pump Head #1', N'Check that  the oil level cannot sink below the minimum position when the cylinder is positioned in the outer position.Refill if necessary.', 1, N'ok', N'uploads/71b9ff15-6a52-467d-9874-48aea79562e7_1757233515708.jpg', N'Monthly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-17T07:00:38.327' AS DateTime), N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-17T08:20:00.650' AS DateTime))
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (177, 278, N'Spring Spools', N'Check the spring spools for any damage. Replace if necessary.', 0, NULL, NULL, N'Monthly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-17T07:00:38.490' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (178, 278, N'Vibrating Spring', N'Inspect the mounting position of spring and rubber.', 0, NULL, NULL, N'Quarterly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-17T07:00:38.490' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (179, 279, N'Flour Hopper', N'Inspect the integrity of gasket', 0, NULL, NULL, N'Weekly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-17T07:00:38.543' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (180, 279, N'Flour Hopper', N'Check the right tightness of bolts & nuts', 0, NULL, NULL, N'Monthly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-17T07:00:38.543' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (181, 279, N'Horizontal Screw Feeder Drive Motor', N'Inspection of packing gland. Adjust if necessary.', 0, NULL, NULL, N'Monthly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-17T07:00:38.543' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (182, 279, N'Horizontal Screw Feeder Drive Motor', N'Inspect the key bar and set screw.', 0, NULL, NULL, N'Monthly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-17T07:00:38.543' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (183, 279, N'Horizontal Screw Feeder Drive Motor', N'Inspection of packing gland for powder leak. Adust packing gland if necessary. ', 0, NULL, NULL, N'Weekly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-17T07:00:38.543' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (203, 299, N' Fristan Pump', N'Visual inspection of mounting bolt. ', 0, NULL, NULL, N'Monthly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-20T00:30:08.097' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (204, 300, N'PU Belt Connector', N'Inspect the integrity of PU Belt. Replace if neccesary', 0, NULL, NULL, N'Monthly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-20T00:30:08.127' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (211, 313, N' Fristan Pump', N'Visual inspection of mounting bolt. ', 0, NULL, NULL, N'Monthly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-20T00:40:33.147' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (212, 314, N'PU Belt Connector', N'Inspect the integrity of PU Belt. Replace if neccesary', 0, NULL, NULL, N'Monthly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-20T00:40:33.157' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (213, 315, N'Flour Hopper', N'Inspect the integrity of gasket', 0, NULL, NULL, N'Weekly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-20T00:40:33.163' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (214, 315, N'Horizontal Screw Feeder Drive Motor', N'Inspection of packing gland for powder leak. Adust packing gland if necessary. ', 0, NULL, NULL, N'Weekly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-20T00:40:33.163' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (215, 3, N' Fristan Pump', N'Visual inspection of mounting bolt. ', 0, NULL, NULL, N'Monthly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-20T03:15:42.927' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (216, 4, N'PU Belt Connector', N'Inspect the integrity of PU Belt. Replace if neccesary', 0, NULL, NULL, N'Monthly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-20T03:15:42.980' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (217, 5, N'Flour Hopper', N'Inspect the integrity of gasket', 0, NULL, NULL, N'Weekly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-20T03:15:42.987' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (218, 5, N'Horizontal Screw Feeder Drive Motor', N'Inspection of packing gland for powder leak. Adust packing gland if necessary. ', 0, NULL, NULL, N'Weekly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-20T03:15:42.987' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (219, 6, N' Fristan Pump', N'Visual inspection of mounting bolt. ', 0, NULL, NULL, N'Monthly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-20T03:18:27.817' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (220, 7, N'PU Belt Connector', N'Inspect the integrity of PU Belt. Replace if neccesary', 0, NULL, NULL, N'Monthly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-20T03:18:27.853' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (221, 8, N'Flour Hopper', N'Inspect the integrity of gasket', 0, NULL, NULL, N'Weekly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-20T03:18:27.863' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (222, 8, N'Horizontal Screw Feeder Drive Motor', N'Inspection of packing gland for powder leak. Adust packing gland if necessary. ', 0, NULL, NULL, N'Weekly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-20T03:18:27.863' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (205, 301, N'Flour Hopper', N'Inspect the integrity of gasket', 0, NULL, NULL, N'Weekly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-20T00:30:08.137' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[WorkOrderTasks] ([Id], [WorkOrderId], [MachinePart], [Task], [IsChecked], [Remarks], [PhotoPath], [Frequency], [CreatedBy], [Created], [LastModifiedBy], [LastModified]) VALUES (206, 301, N'Horizontal Screw Feeder Drive Motor', N'Inspection of packing gland for powder leak. Adust packing gland if necessary. ', 0, NULL, NULL, N'Weekly', N'e7305241-6806-435b-b878-d82638eff11a', CAST(N'2025-10-20T00:30:08.137' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[WorkOrderTasks] OFF
GO
ALTER TABLE [dbo].[JobRequests] ADD  CONSTRAINT [DF__JobReques__Creat__5224328E]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[WorkOrders] ADD  CONSTRAINT [DF_WorkOrder_Status]  DEFAULT (N'Open') FOR [Status]
GO
ALTER TABLE [dbo].[WorkOrders] ADD  CONSTRAINT [DF__WorkOrder__Creat__0880433F]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[JobRequests]  WITH CHECK ADD  CONSTRAINT [FK_JobRequest_AspNetUsers] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[JobRequests] CHECK CONSTRAINT [FK_JobRequest_AspNetUsers]
GO
ALTER TABLE [dbo].[JobRequests]  WITH CHECK ADD  CONSTRAINT [FK_JobRequest_AspNetUsers1] FOREIGN KEY([LastModifiedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[JobRequests] CHECK CONSTRAINT [FK_JobRequest_AspNetUsers1]
GO
ALTER TABLE [dbo].[JobRequests]  WITH CHECK ADD  CONSTRAINT [FK_JobRequest_Tenants] FOREIGN KEY([TenantId])
REFERENCES [dbo].[Tenants] ([Id])
GO
ALTER TABLE [dbo].[JobRequests] CHECK CONSTRAINT [FK_JobRequest_Tenants]
GO
ALTER TABLE [dbo].[PreventiveMaintenances]  WITH CHECK ADD  CONSTRAINT [FK_PreventiveMaintenance_CreatedBy] FOREIGN KEY([Id])
REFERENCES [dbo].[PreventiveMaintenances] ([Id])
GO
ALTER TABLE [dbo].[PreventiveMaintenances] CHECK CONSTRAINT [FK_PreventiveMaintenance_CreatedBy]
GO
ALTER TABLE [dbo].[WorkOrders]  WITH CHECK ADD  CONSTRAINT [FK_WorkOrders_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[WorkOrders] CHECK CONSTRAINT [FK_WorkOrders_CreatedBy]
GO
ALTER TABLE [dbo].[WorkOrders]  WITH CHECK ADD  CONSTRAINT [FK_WorkOrders_Employees] FOREIGN KEY([AssignedTo])
REFERENCES [dbo].[Employees] ([Id])
GO
ALTER TABLE [dbo].[WorkOrders] CHECK CONSTRAINT [FK_WorkOrders_Employees]
GO
ALTER TABLE [dbo].[WorkOrders]  WITH CHECK ADD  CONSTRAINT [FK_WorkOrders_JobRequests] FOREIGN KEY([JobRequestId])
REFERENCES [dbo].[JobRequests] ([Id])
GO
ALTER TABLE [dbo].[WorkOrders] CHECK CONSTRAINT [FK_WorkOrders_JobRequests]
GO
ALTER TABLE [dbo].[WorkOrders]  WITH CHECK ADD  CONSTRAINT [FK_WorkOrders_LastModifiedBy] FOREIGN KEY([LastModifiedBy])
REFERENCES [dbo].[AspNetRoles] ([Id])
GO
ALTER TABLE [dbo].[WorkOrders] CHECK CONSTRAINT [FK_WorkOrders_LastModifiedBy]
GO
ALTER TABLE [dbo].[WorkOrders]  WITH CHECK ADD  CONSTRAINT [FK_WorkOrders_PreventiveMaintenances] FOREIGN KEY([PreventiveMaintenanceId])
REFERENCES [dbo].[PreventiveMaintenances] ([Id])
GO
ALTER TABLE [dbo].[WorkOrders] CHECK CONSTRAINT [FK_WorkOrders_PreventiveMaintenances]
GO
ALTER TABLE [dbo].[WorkOrders]  WITH CHECK ADD  CONSTRAINT [FK_WorkOrders_TenantID] FOREIGN KEY([TenantId])
REFERENCES [dbo].[Tenants] ([Id])
GO
ALTER TABLE [dbo].[WorkOrders] CHECK CONSTRAINT [FK_WorkOrders_TenantID]
GO
ALTER TABLE [dbo].[JobRequests]  WITH CHECK ADD  CONSTRAINT [CK__JobReques__Prior__503BEA1C] CHECK  (([Priority]='None' OR [Priority]='Low' OR [Priority]='Medium' OR [Priority]='High'))
GO
ALTER TABLE [dbo].[JobRequests] CHECK CONSTRAINT [CK__JobReques__Prior__503BEA1C]
GO
ALTER TABLE [dbo].[JobRequests]  WITH CHECK ADD  CONSTRAINT [CK__JobReques__Statu__51300E55] CHECK  (([Status]='On-Going' OR [Status]='Canceled' OR [Status]='Approved' OR [Status]='Pending'))
GO
ALTER TABLE [dbo].[JobRequests] CHECK CONSTRAINT [CK__JobReques__Statu__51300E55]
GO
ALTER TABLE [dbo].[PreventiveMaintenances]  WITH CHECK ADD  CONSTRAINT [CK__Preventiv__Statu__58D1301D] CHECK  (([Status]='Canceled' OR [Status]='Completed' OR [Status]='On Going' OR [Status]='Not Yet Started'))
GO
ALTER TABLE [dbo].[PreventiveMaintenances] CHECK CONSTRAINT [CK__Preventiv__Statu__58D1301D]
GO
