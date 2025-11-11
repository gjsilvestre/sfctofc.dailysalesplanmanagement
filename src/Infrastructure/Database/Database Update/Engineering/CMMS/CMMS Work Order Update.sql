USE [SFCTOFC-CorporateSolutions]
GO
/****** Object:  Table [dbo].[WorkOrders]    Script Date: 10/23/2025 10:44:48 AM ******/
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
	[Description] [nvarchar](100) NULL,
	[Category] [nvarchar](50) NULL,
	[AssignedTo] [int] NULL,
	[Location] [nvarchar](255) NULL,
	[TimeCompleted] [nvarchar](50) NULL,
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
	[AssignedName] [nvarchar](255) NULL,
	[NOFScheduleType] [nvarchar](100) NULL,
	[NOFCategory] [nvarchar](250) NULL,
	[IsCompleted] [nvarchar](50) NULL,
	[TypeOfFault] [nvarchar](100) NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[WorkOrders] ON 
GO
INSERT [dbo].[WorkOrders] ([WorkOrderID], [JobRequestId], [PreventiveMaintenanceId], [RefId], [Title], [Description], [Category], [AssignedTo], [Location], [TimeCompleted], [Status], [Machine], [Priority], [WeekNumberSched], [Created], [CreatedBy], [LastModified], [LastModifiedBy], [TenantId], [TenantName], [LastModifiedByUserId], [CreatedByUserId], [AssignedName], [NOFScheduleType], [NOFCategory], [IsCompleted], [TypeOfFault]) VALUES (22, 8, NULL, N'WO251000001', N'nasirang machine dine bigla ', N'nung biglang nahulog di nagumalaw gumana hel', N'Downtime', 3, N'Marshmallow Extrusion Line 1', N'00:00:24', N'Completed', N'ifheisohfoi', N'Low', NULL, CAST(N'2025-10-22T17:23:47.510' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[WorkOrders] ([WorkOrderID], [JobRequestId], [PreventiveMaintenanceId], [RefId], [Title], [Description], [Category], [AssignedTo], [Location], [TimeCompleted], [Status], [Machine], [Priority], [WeekNumberSched], [Created], [CreatedBy], [LastModified], [LastModifiedBy], [TenantId], [TenantName], [LastModifiedByUserId], [CreatedByUserId], [AssignedName], [NOFScheduleType], [NOFCategory], [IsCompleted], [TypeOfFault]) VALUES (23, NULL, 160, N'WO251000002', N'PM - Syrup Pump After Mixing Head Line 5', N'Preventive Maintenance Tasks for Week Number 43', N'Preventive Maintenance', NULL, N'MARSHMALLOW', NULL, N'Not Yet Started', N'Syrup Pump After Mixing Head Line 5', N'High', 43, CAST(N'2025-10-22T17:24:29.227' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[WorkOrders] ([WorkOrderID], [JobRequestId], [PreventiveMaintenanceId], [RefId], [Title], [Description], [Category], [AssignedTo], [Location], [TimeCompleted], [Status], [Machine], [Priority], [WeekNumberSched], [Created], [CreatedBy], [LastModified], [LastModifiedBy], [TenantId], [TenantName], [LastModifiedByUserId], [CreatedByUserId], [AssignedName], [NOFScheduleType], [NOFCategory], [IsCompleted], [TypeOfFault]) VALUES (24, NULL, 152, N'WO251000003', N'PM - Rotary Vibratory Screen ', N'Preventive Maintenance Tasks for Week Number 43', N'Preventive Maintenance', NULL, N'CHOCOLATE', NULL, N'Not Yet Started', N'Rotary Vibratory Screen ', N'High', 43, CAST(N'2025-10-22T17:24:29.240' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[WorkOrders] ([WorkOrderID], [JobRequestId], [PreventiveMaintenanceId], [RefId], [Title], [Description], [Category], [AssignedTo], [Location], [TimeCompleted], [Status], [Machine], [Priority], [WeekNumberSched], [Created], [CreatedBy], [LastModified], [LastModifiedBy], [TenantId], [TenantName], [LastModifiedByUserId], [CreatedByUserId], [AssignedName], [NOFScheduleType], [NOFCategory], [IsCompleted], [TypeOfFault]) VALUES (25, NULL, 54, N'WO251000004', N'PM - Baking 1 (Flour Dumping)', N'Preventive Maintenance Tasks for Week Number 43', N'Preventive Maintenance', NULL, N'BAKING LINE 1', NULL, N'Not Yet Started', N'Baking 1 (Flour Dumping)', N'High', 43, CAST(N'2025-10-22T17:24:29.250' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[WorkOrders] ([WorkOrderID], [JobRequestId], [PreventiveMaintenanceId], [RefId], [Title], [Description], [Category], [AssignedTo], [Location], [TimeCompleted], [Status], [Machine], [Priority], [WeekNumberSched], [Created], [CreatedBy], [LastModified], [LastModifiedBy], [TenantId], [TenantName], [LastModifiedByUserId], [CreatedByUserId], [AssignedName], [NOFScheduleType], [NOFCategory], [IsCompleted], [TypeOfFault]) VALUES (26, 12, NULL, N'WO251000005', N'biglang di gumana yung pump sa chocolate', N'kasi nung time na yon di namin alam nakita nalang namin di gumaga arouond this time', N'Downtime', NULL, N'CHOCOLATE', N'00:00:01', N'Completed', N'pump ', N'High', NULL, CAST(N'2025-10-22T17:44:40.223' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[WorkOrders] OFF
GO
ALTER TABLE [dbo].[WorkOrders] ADD  CONSTRAINT [DF_WorkOrder_Status]  DEFAULT (N'Open') FOR [Status]
GO
ALTER TABLE [dbo].[WorkOrders] ADD  CONSTRAINT [DF__WorkOrder__Creat__0880433F]  DEFAULT (getdate()) FOR [Created]
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
