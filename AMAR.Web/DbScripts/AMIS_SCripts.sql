USE [AMIS]
GO
/****** Object:  Table [dbo].[tblCompany]    Script Date: 7/5/2017 8:02:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCompany](
	[CPRef] [uniqueidentifier] NULL,
	[CPCode] [varchar](10) NOT NULL,
	[CPName] [varchar](50) NULL,
	[CPAddress] [varchar](250) NULL,
	[CPCountry] [varchar](50) NULL,
	[CPPerson] [varchar](50) NULL,
	[CPCell] [varchar](50) NULL,
	[CPEmail] [varchar](100) NULL,
	[CPWeb] [varchar](100) NULL,
	[CPCGRef] [uniqueidentifier] NULL,
	[CPCGCode] [varchar](50) NULL,
	[CPUser] [varchar](10) NULL,
	[CPDate] [datetime] NULL,
	[CPPCIP] [varchar](100) NULL,
	[CPPCName] [varchar](100) NULL,
	[CPPCMac] [varchar](100) NULL,
	[CPStatus] [varchar](10) NULL,
	[CPRemarks] [varchar](250) NULL,
 CONSTRAINT [PK_tblCompany] PRIMARY KEY CLUSTERED 
(
	[CPCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblCompGroup]    Script Date: 7/5/2017 8:02:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCompGroup](
	[CGRef] [uniqueidentifier] NULL,
	[CGCode] [varchar](10) NOT NULL,
	[CGName] [varchar](50) NULL,
	[CGAddress] [varchar](250) NULL,
	[CGCountry] [varchar](50) NULL,
	[CGPerson] [varchar](50) NULL,
	[CGCell] [varchar](50) NULL,
	[CGEmail] [varchar](100) NULL,
	[CGWeb] [varchar](100) NULL,
	[CGUser] [varchar](10) NULL,
	[CGDate] [datetime] NULL,
	[CGPCIP] [varchar](100) NULL,
	[CGPCName] [varchar](100) NULL,
	[CGPCMac] [varchar](100) NULL,
	[CGStatus] [varchar](10) NULL,
	[CGRemarks] [varchar](250) NULL,
 CONSTRAINT [PK_tblCompGroup] PRIMARY KEY CLUSTERED 
(
	[CGCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblItemMaster]    Script Date: 7/5/2017 8:02:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblItemMaster](
	[ItemRef] [uniqueidentifier] NULL,
	[ItemCode] [varchar](10) NOT NULL,
	[ItemName] [varchar](50) NULL,
	[TRef] [uniqueidentifier] NULL,
	[TCode] [varchar](10) NULL,
	[ItemStatus] [varchar](10) NULL,
	[ItemUser] [varchar](10) NULL,
	[ItemDate] [datetime] NULL,
	[ItemPCIP] [varchar](100) NULL,
	[ItemPCName] [varchar](100) NULL,
	[ItemPCMac] [varchar](100) NULL,
	[ItemRemarks] [varchar](250) NULL,
 CONSTRAINT [PK_tblItemMaster] PRIMARY KEY CLUSTERED 
(
	[ItemCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblMainMenu]    Script Date: 7/5/2017 8:02:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMainMenu](
	[RefNo] [uniqueidentifier] NOT NULL,
	[MenuCode] [varchar](10) NOT NULL,
	[MenuName] [varchar](50) NULL,
	[MenuDate] [datetime] NULL,
	[MenuUser] [varchar](10) NULL,
	[MenuPCIP] [varchar](100) NULL,
	[MenuPCName] [varchar](100) NULL,
	[MenuPCMac] [varchar](100) NULL,
	[MenuStatus] [varchar](10) NULL,
	[MenuRemarks] [varchar](250) NULL,
	[CreatedBy] [varchar](max) NULL,
 CONSTRAINT [PK_tblMainMenu] PRIMARY KEY CLUSTERED 
(
	[MenuCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblModules]    Script Date: 7/5/2017 8:02:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblModules](
	[RefNo] [uniqueidentifier] NOT NULL,
	[MdCode] [varchar](10) NOT NULL,
	[MdName] [varchar](50) NULL,
	[SMCode] [varchar](50) NULL,
	[MMRef] [uniqueidentifier] NULL,
	[SMRef] [uniqueidentifier] NULL,
	[MdUrl] [varchar](50) NULL,
	[MdDate] [datetime] NULL,
	[MdUser] [varchar](10) NULL,
	[MdPCIP] [varchar](100) NULL,
	[MdPCName] [varchar](100) NULL,
	[MdPCMac] [varchar](100) NULL,
	[MdStatus] [varchar](10) NULL,
	[MdRemarks] [varchar](250) NULL,
 CONSTRAINT [PK_tblModules] PRIMARY KEY CLUSTERED 
(
	[MdCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblSubMenu]    Script Date: 7/5/2017 8:02:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSubMenu](
	[RefNo] [uniqueidentifier] NOT NULL,
	[SMCode] [varchar](50) NOT NULL,
	[SMName] [varchar](50) NULL,
	[MenuRef] [varchar](50) NULL,
	[MenuCode] [varchar](10) NULL,
	[SMDate] [datetime] NULL,
	[SMUser] [varchar](10) NULL,
	[SMPCIP] [varchar](100) NULL,
	[SMPCName] [varchar](100) NULL,
	[SMPCMac] [varchar](100) NULL,
	[SMStatus] [varchar](10) NULL,
	[SMRemarks] [varchar](250) NULL,
 CONSTRAINT [PK_tblSubMenu] PRIMARY KEY CLUSTERED 
(
	[SMCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblSubModules]    Script Date: 7/5/2017 8:02:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSubModules](
	[RefNo] [uniqueidentifier] NOT NULL,
	[MSCode] [varchar](10) NOT NULL,
	[MSName] [varchar](50) NULL,
	[MdCode] [varchar](10) NULL,
	[MdRef] [uniqueidentifier] NULL,
	[MSInsert] [varchar](5) NULL,
	[MSUpdate] [varchar](5) NULL,
	[MSDelete] [varchar](5) NULL,
	[MSSelect] [varchar](5) NULL,
	[MSImport] [varchar](5) NULL,
	[MSExport] [varchar](5) NULL,
	[MSDate] [datetime] NULL,
	[MSUsers] [varchar](10) NULL,
	[MSPCIP] [nchar](10) NULL,
	[MSPCName] [varchar](100) NULL,
	[MSMACAddress] [varchar](100) NULL,
	[MSStatus] [varchar](10) NULL,
	[MSRemarks] [varchar](250) NULL,
 CONSTRAINT [PK_tblSubModules] PRIMARY KEY CLUSTERED 
(
	[MSCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblTypes]    Script Date: 7/5/2017 8:02:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTypes](
	[TRef] [uniqueidentifier] NULL,
	[TCode] [varchar](10) NOT NULL,
	[TName] [varchar](50) NULL,
	[TUser] [varchar](50) NULL,
	[TStatus] [varchar](50) NULL,
	[TDate] [datetime] NULL,
	[TPCIP] [varchar](100) NULL,
	[TPCName] [varchar](100) NULL,
	[TPCMac] [varchar](100) NULL,
 CONSTRAINT [PK_tblTypes] PRIMARY KEY CLUSTERED 
(
	[TCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblUserPer]    Script Date: 7/5/2017 8:02:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUserPer](
	[RefNo] [uniqueidentifier] NOT NULL,
	[CompRefNo] [uniqueidentifier] NULL,
	[CompCode] [varchar](50) NULL,
	[UserRefNo] [uniqueidentifier] NULL,
	[UserCode] [varchar](50) NULL,
	[ModuleRefNo] [uniqueidentifier] NULL,
	[ModuleCode] [varchar](50) NULL,
	[PCIP] [varchar](100) NULL,
	[PCName] [varchar](100) NULL,
	[PCMac] [varchar](100) NULL,
	[CUser] [varchar](10) NULL,
	[CDate] [varchar](10) NULL,
	[CStatus] [varchar](10) NULL,
	[CRemarks] [varchar](250) NULL,
 CONSTRAINT [PK_tblUserPer] PRIMARY KEY CLUSTERED 
(
	[RefNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 7/5/2017 8:02:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[UserRef] [uniqueidentifier] NOT NULL,
	[UserCGRef] [nchar](10) NULL,
	[UserCGCode] [varchar](10) NOT NULL,
	[UserCPRef] [uniqueidentifier] NOT NULL,
	[UserCPCode] [varchar](10) NOT NULL,
	[UserCode] [varchar](10) NOT NULL,
	[UserName] [varchar](50) NULL,
	[UserPW] [varchar](50) NULL,
	[UserCell] [varchar](50) NULL,
	[UserEmail] [varchar](50) NULL,
	[UserDate] [datetime] NULL,
	[UserPCIP] [varchar](100) NULL,
	[UserPCName] [varchar](100) NULL,
	[UserMac] [varchar](100) NULL,
	[UserStatus] [varchar](10) NULL,
	[UserRemarks] [varchar](250) NULL,
 CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED 
(
	[UserCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[tblCompany] ([CPRef], [CPCode], [CPName], [CPAddress], [CPCountry], [CPPerson], [CPCell], [CPEmail], [CPWeb], [CPCGRef], [CPCGCode], [CPUser], [CPDate], [CPPCIP], [CPPCName], [CPPCMac], [CPStatus], [CPRemarks]) VALUES (N'739ef3ce-4dd5-4cb0-817b-09181cd7547c', N'AMARS', N'Amar Solutions Ltd.', N'Dhaka', N'BD', N'Mr. Anik', N'01777769591', N'anik@amarmis.com', N'www.amarmis.com', N'4117b241-a172-448b-83c3-dbe6a32f7aaa', N'AMAR', N'ADM', CAST(N'2017-06-25T13:49:21.303' AS DateTime), N'192.168.1.239', N'Arafat-PC', N'fe80::a5c8:da90:1e14:d3f3%13', N'Active', N'')
INSERT [dbo].[tblCompany] ([CPRef], [CPCode], [CPName], [CPAddress], [CPCountry], [CPPerson], [CPCell], [CPEmail], [CPWeb], [CPCGRef], [CPCGCode], [CPUser], [CPDate], [CPPCIP], [CPPCName], [CPPCMac], [CPStatus], [CPRemarks]) VALUES (N'be407b67-607a-45d1-9b7a-d0047d2c18fa', N'AMART', N'Amar Technology', N'Dhaka', N'BD', N'Mr. Arafat', N'01777769591', N'anik@amarmis.com', N'www.amarmis.com', N'4117b241-a172-448b-83c3-dbe6a32f7aaa', N'AMAR', N'ADM', CAST(N'2017-06-25T13:52:05.850' AS DateTime), N'192.168.1.239', N'Arafat-PC', N'fe80::a5c8:da90:1e14:d3f3%13', N'Active', N'')
INSERT [dbo].[tblCompany] ([CPRef], [CPCode], [CPName], [CPAddress], [CPCountry], [CPPerson], [CPCell], [CPEmail], [CPWeb], [CPCGRef], [CPCGCode], [CPUser], [CPDate], [CPPCIP], [CPPCName], [CPPCMac], [CPStatus], [CPRemarks]) VALUES (N'65d026c7-ada6-49e5-b67d-4fe4deb21218', N'BPKW', N'Blue Planet Knitwear Ltd', N'Dhaka', N'BD', N'Mr. Arafat', N'01777769591', N'arafat@amarmis.com', N'www.amarmis.com', N'fc81836b-ace5-4674-8453-18fbd7ae9b5b', N'BPG', N'ADM', CAST(N'2017-06-25T13:58:34.450' AS DateTime), N'192.168.1.239', N'Arafat-PC', N'fe80::a5c8:da90:1e14:d3f3%13', N'Active', N'')
INSERT [dbo].[tblCompany] ([CPRef], [CPCode], [CPName], [CPAddress], [CPCountry], [CPPerson], [CPCell], [CPEmail], [CPWeb], [CPCGRef], [CPCGCode], [CPUser], [CPDate], [CPPCIP], [CPPCName], [CPPCMac], [CPStatus], [CPRemarks]) VALUES (N'09f5334e-4873-43a1-bc68-9001e665c437', N'BPKW2', N'Blue Planet Knitwear Ltd. (Unit-2)', N'Dhaka', N'BD', N'Mr. Arafat', N'01777769591', N'arafat@amarmis.com', N'www.amarmis.com', N'fc81836b-ace5-4674-8453-18fbd7ae9b5b', N'BPG', N'ADM', CAST(N'2017-06-25T13:56:38.633' AS DateTime), N'192.168.1.239', N'Arafat-PC', N'fe80::a5c8:da90:1e14:d3f3%13', N'Active', N'')
INSERT [dbo].[tblCompGroup] ([CGRef], [CGCode], [CGName], [CGAddress], [CGCountry], [CGPerson], [CGCell], [CGEmail], [CGWeb], [CGUser], [CGDate], [CGPCIP], [CGPCName], [CGPCMac], [CGStatus], [CGRemarks]) VALUES (N'4117b241-a172-448b-83c3-dbe6a32f7aaa', N'AMAR', N'Amar', N'Dhaka', N'BD', N'Mr. Anik', N'01748919303', N'arafat@amarmis.com', N'www.amarmis.com', N'ADM', CAST(N'2017-06-25T13:42:16.430' AS DateTime), N'192.168.1.239', N'Arafat-PC', N'fe80::a5c8:da90:1e14:d3f3%13', N'Active', N'')
INSERT [dbo].[tblCompGroup] ([CGRef], [CGCode], [CGName], [CGAddress], [CGCountry], [CGPerson], [CGCell], [CGEmail], [CGWeb], [CGUser], [CGDate], [CGPCIP], [CGPCName], [CGPCMac], [CGStatus], [CGRemarks]) VALUES (N'fc81836b-ace5-4674-8453-18fbd7ae9b5b', N'BPG', N'Blue Planet Group', N'Dhaka', N'BD', N'Mr. Arafat', N'01748919303', N'arafat@amarmis.com', N'www.amarmis.com', N'ADM', CAST(N'2017-06-25T13:41:06.020' AS DateTime), N'192.168.1.239', N'Arafat-PC', N'fe80::a5c8:da90:1e14:d3f3%13', N'Active', N'')
INSERT [dbo].[tblItemMaster] ([ItemRef], [ItemCode], [ItemName], [TRef], [TCode], [ItemStatus], [ItemUser], [ItemDate], [ItemPCIP], [ItemPCName], [ItemPCMac], [ItemRemarks]) VALUES (N'b4c2226c-6bdd-4a33-8b2a-83dc462ca438', N'Active', N'Active', N'd283c160-8f92-484a-a4b4-ba6bdc3a828f', N'Status', N'Active', N'ADM', CAST(N'2017-06-25T13:30:59.567' AS DateTime), N'192.168.1.239', N'Arafat-PC', N'fe80::a5c8:da90:1e14:d3f3%13', N'')
INSERT [dbo].[tblItemMaster] ([ItemRef], [ItemCode], [ItemName], [TRef], [TCode], [ItemStatus], [ItemUser], [ItemDate], [ItemPCIP], [ItemPCName], [ItemPCMac], [ItemRemarks]) VALUES (N'fb46427a-dcfe-444a-beb2-ce6f46031778', N'BD', N'Bangladesh', N'fe9159d8-c27f-4af4-9964-04df41bd7025', N'Country', N'Active', N'ADM', CAST(N'2017-06-25T11:08:09.783' AS DateTime), N'192.168.1.239', N'Arafat-PC', N'fe80::a5c8:da90:1e14:d3f3%13', N'')
INSERT [dbo].[tblItemMaster] ([ItemRef], [ItemCode], [ItemName], [TRef], [TCode], [ItemStatus], [ItemUser], [ItemDate], [ItemPCIP], [ItemPCName], [ItemPCMac], [ItemRemarks]) VALUES (N'05603375-46c5-422e-8dbf-776d5e16ef0f', N'Black', N'Black', N'8aafcf22-4aae-408f-89ed-97715be7cac3', N'Color', N'Active', N'ADM', CAST(N'2017-06-25T11:06:45.743' AS DateTime), N'192.168.1.239', N'Arafat-PC', N'fe80::a5c8:da90:1e14:d3f3%13', N'')
INSERT [dbo].[tblItemMaster] ([ItemRef], [ItemCode], [ItemName], [TRef], [TCode], [ItemStatus], [ItemUser], [ItemDate], [ItemPCIP], [ItemPCName], [ItemPCMac], [ItemRemarks]) VALUES (N'929ff2f6-1692-4836-9c6a-bd63395e86df', N'Dubai', N'Dubai', N'fe9159d8-c27f-4af4-9964-04df41bd7025', N'Country', N'Active', N'ADM', CAST(N'2017-06-25T12:53:46.000' AS DateTime), N'192.168.1.239', N'Arafat-PC', N'fe80::a5c8:da90:1e14:d3f3%13', N'')
INSERT [dbo].[tblItemMaster] ([ItemRef], [ItemCode], [ItemName], [TRef], [TCode], [ItemStatus], [ItemUser], [ItemDate], [ItemPCIP], [ItemPCName], [ItemPCMac], [ItemRemarks]) VALUES (N'2642638d-b011-408d-9a30-0003e2b6719d', N'Germany', N'Germany', N'fe9159d8-c27f-4af4-9964-04df41bd7025', N'Country', N'Active', N'ADM', CAST(N'2017-06-25T11:09:02.873' AS DateTime), N'192.168.1.239', N'Arafat-PC', N'fe80::a5c8:da90:1e14:d3f3%13', N'')
INSERT [dbo].[tblItemMaster] ([ItemRef], [ItemCode], [ItemName], [TRef], [TCode], [ItemStatus], [ItemUser], [ItemDate], [ItemPCIP], [ItemPCName], [ItemPCMac], [ItemRemarks]) VALUES (N'b4568288-87c2-4a71-b07e-1e26cfda12a5', N'Inactive', N'Inactive', N'd283c160-8f92-484a-a4b4-ba6bdc3a828f', N'Status', N'Active', N'ADM', CAST(N'2017-06-25T13:31:12.990' AS DateTime), N'192.168.1.239', N'Arafat-PC', N'fe80::a5c8:da90:1e14:d3f3%13', N'')
INSERT [dbo].[tblItemMaster] ([ItemRef], [ItemCode], [ItemName], [TRef], [TCode], [ItemStatus], [ItemUser], [ItemDate], [ItemPCIP], [ItemPCName], [ItemPCMac], [ItemRemarks]) VALUES (N'780a0a80-facb-4b61-84fb-2da07394e68a', N'INDIA', N'INDIA', N'fe9159d8-c27f-4af4-9964-04df41bd7025', N'Country', N'Active', N'ADM', CAST(N'2017-06-25T11:08:28.827' AS DateTime), N'192.168.1.239', N'Arafat-PC', N'fe80::a5c8:da90:1e14:d3f3%13', N'')
INSERT [dbo].[tblItemMaster] ([ItemRef], [ItemCode], [ItemName], [TRef], [TCode], [ItemStatus], [ItemUser], [ItemDate], [ItemPCIP], [ItemPCName], [ItemPCMac], [ItemRemarks]) VALUES (N'd75a0b97-7b36-4933-8a31-3785e3fb03c2', N'Navy', N'Navy', N'8aafcf22-4aae-408f-89ed-97715be7cac3', N'Color', N'Active', N'ADM', CAST(N'2017-06-25T11:07:23.320' AS DateTime), N'192.168.1.239', N'Arafat-PC', N'fe80::a5c8:da90:1e14:d3f3%13', N'')
INSERT [dbo].[tblItemMaster] ([ItemRef], [ItemCode], [ItemName], [TRef], [TCode], [ItemStatus], [ItemUser], [ItemDate], [ItemPCIP], [ItemPCName], [ItemPCMac], [ItemRemarks]) VALUES (N'911f5c67-279f-48f6-965a-75a106516fd2', N'UK', N'UK', N'fe9159d8-c27f-4af4-9964-04df41bd7025', N'Country', N'Active', N'ADM', CAST(N'2017-06-25T11:08:48.530' AS DateTime), N'192.168.1.239', N'Arafat-PC', N'fe80::a5c8:da90:1e14:d3f3%13', N'')
INSERT [dbo].[tblItemMaster] ([ItemRef], [ItemCode], [ItemName], [TRef], [TCode], [ItemStatus], [ItemUser], [ItemDate], [ItemPCIP], [ItemPCName], [ItemPCMac], [ItemRemarks]) VALUES (N'6bb193ec-b3ec-4d01-9815-4f24f75f241c', N'White', N'White', N'8aafcf22-4aae-408f-89ed-97715be7cac3', N'Color', N'Active', N'ADM', CAST(N'2017-06-25T11:07:12.150' AS DateTime), N'192.168.1.239', N'Arafat-PC', N'fe80::a5c8:da90:1e14:d3f3%13', N'')
INSERT [dbo].[tblItemMaster] ([ItemRef], [ItemCode], [ItemName], [TRef], [TCode], [ItemStatus], [ItemUser], [ItemDate], [ItemPCIP], [ItemPCName], [ItemPCMac], [ItemRemarks]) VALUES (N'a22fad56-be7b-46f2-8912-4e52f9bfd127', N'Yellow', N'Yellow', N'8aafcf22-4aae-408f-89ed-97715be7cac3', N'Color', N'Active', N'ADM', CAST(N'2017-06-25T11:07:34.987' AS DateTime), N'192.168.1.239', N'Arafat-PC', N'fe80::a5c8:da90:1e14:d3f3%13', N'')
INSERT [dbo].[tblMainMenu] ([RefNo], [MenuCode], [MenuName], [MenuDate], [MenuUser], [MenuPCIP], [MenuPCName], [MenuPCMac], [MenuStatus], [MenuRemarks], [CreatedBy]) VALUES (N'da481671-626c-4d73-9b53-1452fa6ca00a', N'Admin', N'Administrator', CAST(N'2017-06-29T15:47:58.987' AS DateTime), N'', N'::1', N'Mustafizur', N'D43D7E9293FD', N'Active', N'', NULL)
INSERT [dbo].[tblMainMenu] ([RefNo], [MenuCode], [MenuName], [MenuDate], [MenuUser], [MenuPCIP], [MenuPCName], [MenuPCMac], [MenuStatus], [MenuRemarks], [CreatedBy]) VALUES (N'4cc62f08-40de-4b45-a847-539f5128bc56', N'GSD', N'Garments Sewing Development', CAST(N'2017-06-25T14:12:26.630' AS DateTime), N'ADM', N'192.168.1.239', N'Arafat-PC', N'fe80::a5c8:da90:1e14:d3f3%13', N'Active', N'', NULL)
INSERT [dbo].[tblMainMenu] ([RefNo], [MenuCode], [MenuName], [MenuDate], [MenuUser], [MenuPCIP], [MenuPCName], [MenuPCMac], [MenuStatus], [MenuRemarks], [CreatedBy]) VALUES (N'331a990f-1c24-49f2-acd8-cfd8c42d3c9f', N'Inventory', N'Inventory', CAST(N'2017-06-25T14:18:11.460' AS DateTime), N'ADM', N'192.168.1.239', N'Arafat-PC', N'fe80::a5c8:da90:1e14:d3f3%13', N'Active', N'', NULL)
INSERT [dbo].[tblMainMenu] ([RefNo], [MenuCode], [MenuName], [MenuDate], [MenuUser], [MenuPCIP], [MenuPCName], [MenuPCMac], [MenuStatus], [MenuRemarks], [CreatedBy]) VALUES (N'eaf2161d-1a44-464b-96fb-aa5d7fc60b0d', N'LAB', N'Laboretory', CAST(N'2017-06-25T14:11:48.643' AS DateTime), N'ADM', N'192.168.1.239', N'Arafat-PC', N'fe80::a5c8:da90:1e14:d3f3%13', N'Active', N'', NULL)
INSERT [dbo].[tblMainMenu] ([RefNo], [MenuCode], [MenuName], [MenuDate], [MenuUser], [MenuPCIP], [MenuPCName], [MenuPCMac], [MenuStatus], [MenuRemarks], [CreatedBy]) VALUES (N'f9cf0aba-ac6e-493b-b5ce-7f37704dba9a', N'Merch', N'Merchandising', CAST(N'2017-06-25T14:09:59.560' AS DateTime), N'ADM', N'192.168.1.239', N'Arafat-PC', N'fe80::a5c8:da90:1e14:d3f3%13', N'Active', N'', NULL)
INSERT [dbo].[tblMainMenu] ([RefNo], [MenuCode], [MenuName], [MenuDate], [MenuUser], [MenuPCIP], [MenuPCName], [MenuPCMac], [MenuStatus], [MenuRemarks], [CreatedBy]) VALUES (N'd0611b4d-1984-4918-b220-1570d8853106', N'Planning', N'Planning', CAST(N'2017-06-25T14:10:48.037' AS DateTime), N'ADM', N'192.168.1.239', N'Arafat-PC', N'fe80::a5c8:da90:1e14:d3f3%13', N'Active', N'', NULL)
INSERT [dbo].[tblMainMenu] ([RefNo], [MenuCode], [MenuName], [MenuDate], [MenuUser], [MenuPCIP], [MenuPCName], [MenuPCMac], [MenuStatus], [MenuRemarks], [CreatedBy]) VALUES (N'52c74790-e00d-4dc6-acca-3eeebeeff5c0', N'Production', N'Production', CAST(N'2017-06-25T14:13:50.460' AS DateTime), N'ADM', N'192.168.1.239', N'Arafat-PC', N'fe80::a5c8:da90:1e14:d3f3%13', N'Active', N'', NULL)
INSERT [dbo].[tblMainMenu] ([RefNo], [MenuCode], [MenuName], [MenuDate], [MenuUser], [MenuPCIP], [MenuPCName], [MenuPCMac], [MenuStatus], [MenuRemarks], [CreatedBy]) VALUES (N'cc8e9a6e-7c1d-49fd-9a23-ad628969ffd9', N'Reports', N'Reports', CAST(N'2017-06-25T14:12:44.890' AS DateTime), N'ADM', N'192.168.1.239', N'Arafat-PC', N'fe80::a5c8:da90:1e14:d3f3%13', N'Active', N'', NULL)
INSERT [dbo].[tblMainMenu] ([RefNo], [MenuCode], [MenuName], [MenuDate], [MenuUser], [MenuPCIP], [MenuPCName], [MenuPCMac], [MenuStatus], [MenuRemarks], [CreatedBy]) VALUES (N'abb78747-7359-47c5-ba17-50831cd7630a', N'Sample', N'Sample', CAST(N'2017-06-25T14:11:02.380' AS DateTime), N'ADM', N'192.168.1.239', N'Arafat-PC', N'fe80::a5c8:da90:1e14:d3f3%13', N'Active', N'', NULL)
INSERT [dbo].[tblMainMenu] ([RefNo], [MenuCode], [MenuName], [MenuDate], [MenuUser], [MenuPCIP], [MenuPCName], [MenuPCMac], [MenuStatus], [MenuRemarks], [CreatedBy]) VALUES (N'56802418-8d85-48c6-8982-917a7807d7de', N'TNA', N'Time and Action', CAST(N'2017-06-25T14:10:36.053' AS DateTime), N'ADM', N'192.168.1.239', N'Arafat-PC', N'fe80::a5c8:da90:1e14:d3f3%13', N'Active', N'', NULL)
INSERT [dbo].[tblModules] ([RefNo], [MdCode], [MdName], [SMCode], [MMRef], [SMRef], [MdUrl], [MdDate], [MdUser], [MdPCIP], [MdPCName], [MdPCMac], [MdStatus], [MdRemarks]) VALUES (N'b6633b08-9190-4c0a-b382-a59c62c3605c', N'dsfdsf', N'dsfdsf', N'', NULL, N'0cc05f03-6ff3-4d28-a8b4-6fa9d32787d8', N'sdfdsf', CAST(N'2017-06-29T17:54:02.843' AS DateTime), N'', N'::1', N'Mustafizur', N'D43D7E9293FD', N'Active', N'dsfdsf')
INSERT [dbo].[tblModules] ([RefNo], [MdCode], [MdName], [SMCode], [MMRef], [SMRef], [MdUrl], [MdDate], [MdUser], [MdPCIP], [MdPCName], [MdPCMac], [MdStatus], [MdRemarks]) VALUES (N'91730dd7-7d77-4d68-8b2a-93f1d2707a9c', N'sdsad', N'asdsad', N'', N'da481671-626c-4d73-9b53-1452fa6ca00a', N'7f94b2ce-938e-4896-9331-e38182983ae8', N'sadsad', CAST(N'2017-06-29T18:16:19.910' AS DateTime), N'', N'::1', N'Mustafizur', N'D43D7E9293FD', N'InActive', N'sadsad')
INSERT [dbo].[tblModules] ([RefNo], [MdCode], [MdName], [SMCode], [MMRef], [SMRef], [MdUrl], [MdDate], [MdUser], [MdPCIP], [MdPCName], [MdPCMac], [MdStatus], [MdRemarks]) VALUES (N'6041cc29-9e3b-42ce-b16b-7854077c0b2c', N'xdsfs', N'dsfdsf', N'', N'da481671-626c-4d73-9b53-1452fa6ca00a', N'0cc05f03-6ff3-4d28-a8b4-6fa9d32787d8', N'sdfdsf', CAST(N'2017-06-29T18:23:35.933' AS DateTime), N'', N'::1', N'Mustafizur', N'D43D7E9293FD', N'Active', N'dsfdsf')
INSERT [dbo].[tblSubMenu] ([RefNo], [SMCode], [SMName], [MenuRef], [MenuCode], [SMDate], [SMUser], [SMPCIP], [SMPCName], [SMPCMac], [SMStatus], [SMRemarks]) VALUES (N'0cc05f03-6ff3-4d28-a8b4-6fa9d32787d8', N'12', N'sm1', N'DA481671-626C-4D73-9B53-1452FA6CA00A', N'Admin', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblSubMenu] ([RefNo], [SMCode], [SMName], [MenuRef], [MenuCode], [SMDate], [SMUser], [SMPCIP], [SMPCName], [SMPCMac], [SMStatus], [SMRemarks]) VALUES (N'7f94b2ce-938e-4896-9331-e38182983ae8', N'23', N'sm2', N'DA481671-626C-4D73-9B53-1452FA6CA00A', N'Admin', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblTypes] ([TRef], [TCode], [TName], [TUser], [TStatus], [TDate], [TPCIP], [TPCName], [TPCMac]) VALUES (N'8aafcf22-4aae-408f-89ed-97715be7cac3', N'Color', N'Color', N'ADM', N'Active', CAST(N'2017-06-25T10:46:11.593' AS DateTime), N'192.168.1.239', N'Arafat-PC', N'fe80::a5c8:da90:1e14:d3f3%13')
INSERT [dbo].[tblTypes] ([TRef], [TCode], [TName], [TUser], [TStatus], [TDate], [TPCIP], [TPCName], [TPCMac]) VALUES (N'fe9159d8-c27f-4af4-9964-04df41bd7025', N'Country', N'Country', N'ADM', N'Active', CAST(N'2017-06-25T10:46:30.930' AS DateTime), N'192.168.1.239', N'Arafat-PC', N'fe80::a5c8:da90:1e14:d3f3%13')
INSERT [dbo].[tblTypes] ([TRef], [TCode], [TName], [TUser], [TStatus], [TDate], [TPCIP], [TPCName], [TPCMac]) VALUES (N'8383c848-d9ff-41e7-b666-42d7bab17dbc', N'Floor', N'Floor', N'ADM', N'Active', CAST(N'2017-06-25T10:48:47.330' AS DateTime), N'192.168.1.239', N'Arafat-PC', N'fe80::a5c8:da90:1e14:d3f3%13')
INSERT [dbo].[tblTypes] ([TRef], [TCode], [TName], [TUser], [TStatus], [TDate], [TPCIP], [TPCName], [TPCMac]) VALUES (N'c01e7d93-28fb-4d7b-9282-cc8843aacfca', N'Party', N'Party', N'ADM', N'Active', CAST(N'2017-06-25T10:47:18.053' AS DateTime), N'192.168.1.239', N'Arafat-PC', N'fe80::a5c8:da90:1e14:d3f3%13')
INSERT [dbo].[tblTypes] ([TRef], [TCode], [TName], [TUser], [TStatus], [TDate], [TPCIP], [TPCName], [TPCMac]) VALUES (N'd283c160-8f92-484a-a4b4-ba6bdc3a828f', N'Status', N'Status', N'ADM', N'Active', CAST(N'2017-06-25T10:44:37.033' AS DateTime), N'192.168.1.239', N'Arafat-PC', N'fe80::a5c8:da90:1e14:d3f3%13')
INSERT [dbo].[tblTypes] ([TRef], [TCode], [TName], [TUser], [TStatus], [TDate], [TPCIP], [TPCName], [TPCMac]) VALUES (N'20664443-5f13-4ecc-8f95-2d95fc10828d', N'Store', N'Store', N'ADM', N'Active', CAST(N'2017-06-25T10:49:02.270' AS DateTime), N'192.168.1.239', N'Arafat-PC', N'fe80::a5c8:da90:1e14:d3f3%13')
INSERT [dbo].[tblTypes] ([TRef], [TCode], [TName], [TUser], [TStatus], [TDate], [TPCIP], [TPCName], [TPCMac]) VALUES (N'a43a9859-2b94-401e-9e9d-ae2f6192929e', N'Supplier', N'Supplier', N'ADM', N'Active', CAST(N'2017-06-25T10:47:32.960' AS DateTime), N'192.168.1.239', N'Arafat-PC', N'fe80::a5c8:da90:1e14:d3f3%13')
INSERT [dbo].[tblTypes] ([TRef], [TCode], [TName], [TUser], [TStatus], [TDate], [TPCIP], [TPCName], [TPCMac]) VALUES (N'03f75fc6-b2b9-4118-a499-386445d3c67d', N'UOM', N'UOM', N'ADM', N'Active', CAST(N'2017-06-25T10:47:01.300' AS DateTime), N'192.168.1.239', N'Arafat-PC', N'fe80::a5c8:da90:1e14:d3f3%13')
ALTER TABLE [dbo].[tblItemMaster]  WITH CHECK ADD  CONSTRAINT [FK_tblItemMaster_tblTypes] FOREIGN KEY([TCode])
REFERENCES [dbo].[tblTypes] ([TCode])
GO
ALTER TABLE [dbo].[tblItemMaster] CHECK CONSTRAINT [FK_tblItemMaster_tblTypes]
GO
ALTER TABLE [dbo].[tblSubMenu]  WITH CHECK ADD  CONSTRAINT [FK_tblSubMenu_tblMainMenu] FOREIGN KEY([MenuCode])
REFERENCES [dbo].[tblMainMenu] ([MenuCode])
GO
ALTER TABLE [dbo].[tblSubMenu] CHECK CONSTRAINT [FK_tblSubMenu_tblMainMenu]
GO
ALTER TABLE [dbo].[tblSubModules]  WITH CHECK ADD  CONSTRAINT [FK_tblSubModules_tblSubModules] FOREIGN KEY([MSCode])
REFERENCES [dbo].[tblModules] ([MdCode])
GO
ALTER TABLE [dbo].[tblSubModules] CHECK CONSTRAINT [FK_tblSubModules_tblSubModules]
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD  CONSTRAINT [FK_tblUsers_tblCompany] FOREIGN KEY([UserCPCode])
REFERENCES [dbo].[tblCompany] ([CPCode])
GO
ALTER TABLE [dbo].[tblUsers] CHECK CONSTRAINT [FK_tblUsers_tblCompany]
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD  CONSTRAINT [FK_tblUsers_tblCompGroup] FOREIGN KEY([UserCGCode])
REFERENCES [dbo].[tblCompGroup] ([CGCode])
GO
ALTER TABLE [dbo].[tblUsers] CHECK CONSTRAINT [FK_tblUsers_tblCompGroup]
GO
/****** Object:  StoredProcedure [dbo].[SP_Company]    Script Date: 7/5/2017 8:02:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_Company]
@Action varchar(10)='select',
@CPCode varchar(10)='BPKW', 
@CPName varchar(50)='Blue Planet Knitwear Ltd', 
@CPAddress varchar(250)='Dhaka', 
@CPCountry varchar(50)='BD',
@CPPerson varchar(50)='Mr. Arafat', 
@CPCell varchar(50)='01777769591',
@CPEmail varchar(100)='arafat@amarmis.com',
@CPWeb varchar(100)='www.amarmis.com',
@CPCGRef uniqueidentifier='FC81836B-ACE5-4674-8453-18FBD7AE9B5B',
@CPCGCode varchar(10)='BPG',
@CPUser varchar(10)='ADM',
@CPPCIP varchar(100)='192.168.1.239', 
@CPPCName varchar(100)='Arafat-PC',
@CPPCMac varchar(100)='fe80::a5c8:da90:1e14:d3f3%13', 
@CPStatus varchar(10)='Active', 
@CPRemarks varchar(250)=''
as
BEGIN
if @Action='FCompGroup'
BEGIN
select CGCode,CGName from tblCompGroup order by CGName
END
if @Action='FCGRef'
BEGIN
select CGRef,CGName from tblCompGroup order by CGName
END
if @Action='FCountry'
BEGIN
select ItemCode,ItemName from tblItemMaster where TCode='Country' order by ItemName
END
if @Action='FStatus'
BEGIN
select ItemCode,ItemName from tblItemMaster where TCode='Status' order by ItemName
END
if @Action='select'
BEGIN
SELECT CPRef, CPCode, CPName, CPAddress, CPCountry, CPPerson, CPCell, CPEmail, CPWeb, CPCGRef, CPCGCode, CPUser, CPDate, CPPCIP, CPPCName, CPPCMac, CPStatus, CPRemarks FROM tblCompany order by CPName
END
if @Action='Insert'
BEGIN
Insert into tblCompany(CPRef, CPCode, CPName, CPAddress, CPCountry, CPPerson, CPCell, CPEmail, CPWeb, CPCGRef, CPCGCode, CPUser, CPDate, CPPCIP, CPPCName, CPPCMac, CPStatus, CPRemarks)
VALUES(NEWID(), @CPCode, @CPName, @CPAddress, @CPCountry, @CPPerson, @CPCell, @CPEmail, @CPWeb, @CPCGRef, @CPCGCode, @CPUser, GETDATE(), @CPPCIP, @CPPCName, @CPPCMac, @CPStatus, @CPRemarks)
END
if @Action='update'
BEGIN
update tblCompany set CPCode=@CPCode, CPName=@CPName, CPAddress=@CPAddress, CPCountry=@CPCountry, CPPerson=@CPPerson, CPCell=@CPCell, CPEmail=@CPEmail, CPWeb=@CPWeb, CPCGRef=@CPCGRef, CPCGCode=@CPCGCode, CPUser=@CPUser, CPDate=GETDATE(), CPPCIP=@CPPCIP, CPPCName=@CPPCName, CPPCMac=@CPPCMac, CPStatus=@CPStatus, CPRemarks=@CPRemarks where CPCode=@CPCode
END
if @Action='Delete'
BEGIN
Delete from tblCompany where CPCode=@CPCode
END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_CompGroup]    Script Date: 7/5/2017 8:02:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_CompGroup]
@Action varchar(10)='select',
@CGCode varchar(10)='AMAR', 
@CGName varchar(50)='Amar', 
@CGAddress varchar(250)='Dhaka',
@CGCountry varchar(10)='BD',
@CGPerson varchar(50)='Mr. Anik',
@CGCell varchar(50)='01748919303',
@CGEmail varchar(100)='arafat@amarmis.com',
@CGWeb varchar(100)='www.amarmis.com',
@CGUser varchar(10)='ADM',
@CGPCIP varchar(50)='192.168.1.239',
@CGPCName varchar(100)='Arafat-PC', 
@CGPCMac varchar(100)='fe80::a5c8:da90:1e14:d3f3%13', 
@CGStatus varchar(10)='Active', 
@CGRemarks varchar(250)=''
as
BEGIN
if @Action='FCountry'
BEGIN
select ItemCode,ItemName from tblItemMaster where TCode='Country' order by ItemName
END
if @Action='FStatus'
BEGIN
select ItemCode,ItemName from tblItemMaster where TCode='Status' order by ItemName
END
if @Action='select'
BEGIN
SELECT CGRef, CGCode, CGName, CGAddress, CGCountry, CGPerson, CGCell, CGEmail, CGWeb, CGUser, CGDate, CGPCIP, CGPCName, CGPCMac, CGStatus, CGRemarks FROM tblCompGroup order by CGName
END
if @Action='Insert'
BEGIN
insert into tblCompGroup(CGRef, CGCode, CGName, CGAddress, CGCountry, CGPerson, CGCell, CGEmail, CGWeb, CGUser, CGDate, CGPCIP, CGPCName, CGPCMac, CGStatus, CGRemarks)
VALUES(NEWID(), @CGCode, @CGName, @CGAddress, @CGCountry, @CGPerson, @CGCell, @CGEmail, @CGWeb, @CGUser, GETDATE(), @CGPCIP, @CGPCName, @CGPCMac, @CGStatus, @CGRemarks)
END
if @Action='Update'
Begin
update tblCompGroup set CGCode=@CGCode, CGName=@CGName, CGAddress=@CGAddress, CGCountry=@CGCountry, CGPerson=@CGPerson, CGCell=@CGCell, CGEmail=@CGEmail, CGWeb=@CGWeb, 
CGUser=@CGUser, CGDate=GETDATE(), CGPCIP=@CGPCIP, CGPCName=@CGPCName, CGPCMac=@CGPCMac, CGStatus=@CGStatus, CGRemarks=@CGRemarks where CGCode=@CGCode
end
if @Action='Delete'
BEGIN
delete from tblCompGroup where CGCode=@CGCode
end
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetMainMenuList]    Script Date: 7/5/2017 8:02:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Sp_GetMainMenuList]
@Type varchar(max)
as 
begin
if @Type='All'
begin
SELECT
	RefNo
   ,MenuName
FROM tblMainMenu
ORDER BY MenuName

END
ELSE IF (@type = 'Active')
BEGIN
SELECT
	RefNo
   ,MenuName
FROM tblMainMenu
WHERE MenuStatus = 'Active'
ORDER BY MenuName

END
ELSE IF (@type = 'InActive')
BEGIN
SELECT
	RefNo
   ,MenuName
FROM tblMainMenu
WHERE MenuStatus = 'Inactive'
ORDER BY MenuName

END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_getMenuSubMenuName]    Script Date: 7/5/2017 8:02:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[sp_getMenuSubMenuName] 

  @type nvarchar(50)='menu',
  @ref nvarchar(50)=''
AS
BEGIN

	SET NOCOUNT ON;

  if(@type='menu' and @ref='')
	begin
		select Mname,RefNo from(SELECT     [MenuName] as Mname, m.RefNo as RefNo, 
		s.SMName
		 FROM [AMIS].[dbo].[tblMainMenu] m
		 left outer join [AMIS].[dbo].[tblSubMenu] s
		 on m.RefNo = s.MenuRef
		 		 where s.SMName is not null 
		 group by m.RefNo,[MenuName],s.SMName) z
		 group by Mname,RefNo
		

	end

else if(@type='noSubmenu' and @ref='')
	begin

	select Mname,RefNo from(SELECT     [MenuName] as Mname, m.RefNo as RefNo, 
		s.SMName
		 FROM [AMIS].[dbo].[tblMainMenu] m
		 left outer join [AMIS].[dbo].[tblSubMenu] s
		 on m.RefNo = s.MenuRef
		 		 where s.SMName is  null
		 group by m.RefNo,[MenuName],s.SMName) z
		 --group by Mname,RefNo
	end
 else if (@type='menu' and @ref!='')
 begin
		SELECT    SMName FROM [AMIS].[dbo].[tblSubMenu]
		where MenuRef=@ref
	end
END

GO
/****** Object:  StoredProcedure [dbo].[Sp_GetSubMenuList]    Script Date: 7/5/2017 8:02:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Sp_GetSubMenuList]
@MainMenuRefNo varchar(max),
@Type varchar(max)
as 
begin
if @Type='All'
begin
SELECT
	RefNo,SMName
FROM tblSubMenu
where MenuRef=@MainMenuRefNo
ORDER BY SMName

END
ELSE IF (@type = 'Active')
BEGIN
SELECT
	RefNo,SMName
FROM tblSubMenu

WHERE SMStatus = 'Active' and MenuRef=@MainMenuRefNo
ORDER BY SMName

END
ELSE IF (@type = 'InActive')
BEGIN
SELECT
	RefNo,SMName
FROM tblSubMenu

WHERE SMStatus = 'Inactive' and MenuRef=@MainMenuRefNo
ORDER BY SMName

END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ItemMaster]    Script Date: 7/5/2017 8:02:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_ItemMaster]
@Action varchar(10)='select',
@ItemCode varchar(10)='Inactive', 
@ItemName varchar(50)='Inactive', 
@TRef uniqueidentifier='D283C160-8F92-484A-A4B4-BA6BDC3A828F', 
@TCode varchar(10)='Status',
@ItemStatus varchar(10)='Active', 
@ItemUser varchar(10)='ADM',
@ItemPCIP varchar(100)='192.168.1.239',
@ItemPCName varchar(100)='Arafat-PC', 
@ItemPCMac varchar(100)='fe80::a5c8:da90:1e14:d3f3%13', 
@ItemRemarks varchar(250)=''
as
BEGIN
if @Action='Filter'
BEGIN
select TCode, TName from tblTypes order by TName
END
if @Action='FilterTRef'
BEGIN
select TRef, TName from tblTypes where TCode=@TCode
END
if @Action='select'
BEGIN
SELECT ItemRef, ItemCode, ItemName, TRef, TCode, ItemStatus, ItemUser, ItemDate, ItemPCIP, ItemPCName, ItemPCMac, ItemRemarks FROM tblItemMaster
END
if @Action='Insert'
BEGIN
Insert into tblItemMaster(ItemRef, ItemCode, ItemName, TRef, TCode, ItemStatus, ItemUser, ItemDate, ItemPCIP, ItemPCName, ItemPCMac, ItemRemarks)
VALUES(NEWID(), @ItemCode, @ItemName, @TRef, @TCode, @ItemStatus, @ItemUser, GETDATE(), @ItemPCIP, @ItemPCName, @ItemPCMac, @ItemRemarks)
END
if @Action='Update'
BEGIN
Update tblItemMaster set ItemCode=@ItemCode, ItemName=@ItemName, TRef=@TRef, TCode=@TCode, ItemStatus=@ItemStatus, ItemUser=@ItemUser, ItemDate=GETDATE(), ItemPCIP=@ItemPCIP, ItemPCName=@ItemPCName, ItemPCMac=@ItemPCMac, ItemRemarks=@ItemRemarks where ItemCode=@ItemCode
END
if @Action='Delete'
BEGIN
Delete from tblItemMaster where ItemCode=@ItemCode
END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_MainMenu]    Script Date: 7/5/2017 8:02:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_MainMenu]
@Action varchar(10)='Select',
@MenuCode varchar(10)='Inventory',
@MenuName varchar(50)='Inventory',
@MenuUser varchar(100)='ADM',
@MenuPCIP varchar(100)='192.168.1.239',
@MenuPCName varchar(100)='Arafat-PC',
@MenuPCMac varchar(100)='fe80::a5c8:da90:1e14:d3f3%13',
@MenuStatus varchar(100)='Active',
@MenuRemarks varchar(100)=''
as
BEGIN
if @Action='FStatus'
BEGIN
select ItemCode, ItemName from tblItemMaster where TCode='Status'
END
if @Action='Select'
BEGIN
--select * from tblMainMenu
SELECT RefNo, MenuCode, MenuName, MenuDate, MenuUser, MenuPCIP, MenuPCName, MenuPCMac, MenuStatus, MenuRemarks FROM tblMainMenu order by MenuName
END
if @Action='Insert'
BEGIN
Insert into tblMainMenu(RefNo, MenuCode, MenuName, MenuDate, MenuUser, MenuPCIP, MenuPCName, MenuPCMac, MenuStatus, MenuRemarks)
VALUES(NEWID(), @MenuCode, @MenuName, GETDATE(), @MenuUser, @MenuPCIP, @MenuPCName, @MenuPCMac, @MenuStatus, @MenuRemarks)
END
if @Action='Update'
BEGIN
update tblMainMenu set MenuCode=@MenuCode, MenuName=@MenuName, MenuDate=GETDATE(), MenuUser=@MenuUser, MenuPCIP=@MenuPCIP, MenuPCName=@MenuPCName, 
MenuPCMac=@MenuPCMac, MenuStatus=@MenuStatus, MenuRemarks=@MenuRemarks where MenuCode=@MenuCode
END
if @Action='Delete'
BEGIN
delete from tblMainMenu where MenuCode=@MenuCode
END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Modules]    Script Date: 7/5/2017 8:02:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[SP_Modules]
@Action varchar(10)='Select',
@MdCode varchar(10)='Inventory',
@MdName varchar(50)='Inventory',
@MdUser varchar(100)='ADM',
@MdPCIP varchar(100)='192.168.1.239',
@MdPCName varchar(100)='Arafat-PC',
@MdPCMac varchar(100)='fe80::a5c8:da90:1e14:d3f3%13',
@MdStatus varchar(100)='Active',
@MdRemarks varchar(100)='',
@SmCode varchar(100)='',
@SmRef varchar(100)='',
@MdUrl varchar(100)='',
@MMRef varchar(100)=''

as
BEGIN

if @Action='Select'
BEGIN

SELECT RefNo, [MdCode],[MdName],[SMCode],[SMRef],[MdUrl],[MdDate],[MdUser],[MdPCIP],[MdPCName],[MdPCMac],[MdStatus],[MdRemarks],MMRef FROM tblModules 
where cast(SMRef as VARCHAR(MAX))=@SmRef and cast(MMRef as VARCHAR(MAX))=@MMRef
order by MdName
END
if @Action='Insert'
BEGIN
INSERT INTO [tblModules]
           ([RefNo],[MdCode],[MdName],[SMCode],[SMRef],[MdUrl],[MdDate],[MdUser],[MdPCIP],[MdPCName],[MdPCMac],[MdStatus],[MdRemarks],MMRef)
     VALUES(NEWID() ,@MdCode,@MdName,@SMCode ,@SMRef,@MdUrl,getdate(),@MdUser,@MdPCIP,@MdPCName,@MdPCMac,@MdStatus ,@MdRemarks,@MMRef)

END
if @Action='Update'
BEGIN
update [tblModules] set MdCode=@MdCode, MdName=@MdName, MdDate=GETDATE(), MdUser=@mduser, MdPCIP=@mdPCIP, MdPCName=@MdPCName,MMRef=@MMRef ,
MdPCMac=@MdPCMac, MdStatus=@MdStatus, MdRemarks=@MdRemarks where MdCode=@MdCode
END
if @Action='Delete'
BEGIN
delete from tblModules where MdCode=@MdCode 
END
END

GO
/****** Object:  StoredProcedure [dbo].[SP_types]    Script Date: 7/5/2017 8:02:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_types]
@Action varchar(10)='Select',
@TCode varchar(10)='Color',
@TName varchar(10)='Color',
@TUser varchar(10)='ADM',
@TStatus varchar(10)='Active',
@TPCIP varchar(100)='192.168.1.239',
@TPCName varchar(100)='Arafat-PC',
@TPCMac varchar(100)='fe80::a5c8:da90:1e14:d3f3%13'
as
BEGIN
if @Action='Select'
BEGIN
SELECT TRef, TCode, TName, TUser, TStatus, TDate, TPCIP, TPCName, TPCMac FROM tblTypes order by TName
End
if @Action='Insert'
BEGIN
insert into tblTypes(TRef, TCode, TName, TUser, TStatus, TDate, TPCIP, TPCName, TPCMac)
VALUES(NEWID(), @TCode, @TName, @TUser, @TStatus, GETDATE(), @TPCIP, @TPCName, @TPCMac)
End
if @Action='Update'
BEGIN
update tblTypes set TCode=@TCode, TName=@TName, TUser=@TUser, TStatus=@TStatus, TDate=GETDATE(), TPCIP=@TPCIP, TPCName=@TPCName, TPCMac=@TPCMac 
where TCode=@TCode
End
if @Action='Delete'
BEGIN
Delete from tblTypes where TCode=@TCode
End
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Users]    Script Date: 7/5/2017 8:02:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_Users]
@Action varchar(10)='Insert',
@UserCGRef uniqueidentifier='4117B241-A172-448B-83C3-DBE6A32F7AAA', 
@UserCGCode varchar(10)='AMAR', 
@UserCPRef uniqueidentifier='BE407B67-607A-45D1-9B7A-D0047D2C18FA', 
@UserCPCode varchar(10)='AMART', 
@UserCode varchar(10)='Admin', 
@UserName varchar(50)='Administrator', 
@UserPW varchar(50)='123456', 
@UserCell varchar(50)='01748919303', 
@UserEmail varchar(100)='admin@amarmis.com', 
@UserPCIP varchar(100)='192.168.1.239', 
@UserPCName varchar(100)='Arafat-PC',
@UserMac varchar(100)='fe80::a5c8:da90:1e14:d3f3%13', 
@UserStatus varchar(10)='Active',
@UserRemarks varchar(250)=''
as
BEGIN
if @Action='FCompGroup'
BEGIN
select CGCode,CGName from tblCompGroup order by CGName
END
if @Action='FCGRef'
BEGIN
select CGRef,CGName,CGCode from tblCompGroup order by CGName
END
if @Action='FCompany'
BEGIN
select CPCode,CPName from tblCompany order by CPName
END
if @Action='FCPRef'
BEGIN
select CPRef,CPName,CPCode from tblCompany order by CPName
END
if @Action='FStatus'
BEGIN
select ItemCode, ItemName from tblItemMaster where TCode='Status'
END
if @Action='Select'
BEGIN
--select * from tblUsers
SELECT UserRef, UserCGRef, UserCGCode, UserCPRef, UserCPCode, UserCode, UserName, UserPW, 
UserCell, UserEmail, UserDate, UserPCIP, UserPCName,UserMac, UserStatus, UserRemarks FROM tblUsers
END
if @Action='Insert'
BEGIN
Insert into tblUsers(UserRef, UserCGRef, UserCGCode, UserCPRef, UserCPCode, UserCode, UserName, UserPW,UserCell, UserEmail, UserDate, UserPCIP, UserPCName,UserMac, UserStatus, UserRemarks)
VALUES(NEWID(), @UserCGRef, @UserCGCode, @UserCPRef, @UserCPCode, @UserCode, @UserName, @UserPW,@UserCell, @UserEmail, GETDATE(), @UserPCIP, @UserPCName,@UserMac, @UserStatus, @UserRemarks)
END
if @Action='Update'
BEGIN
update tblUsers set UserCGRef=@UserCGRef, UserCGCode=@UserCGCode, UserCPRef=@UserCPRef, UserCPCode=@UserCPCode, UserCode=@UserCode, UserName=@UserName, 
UserPW=@UserPW,UserCell=@UserCell,UserEmail=@UserEmail, UserDate=GETDATE(), UserPCIP=@UserPCIP, UserPCName=@UserPCName,UserMac=@UserMac, 
UserStatus=@UserStatus, UserRemarks=@UserRemarks where UserCode=@UserCode
END
if @Action='Delete'
BEGIN
delete from tblUsers where UserCode=@UserCode
END
END
GO
