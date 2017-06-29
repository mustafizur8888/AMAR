USE [AMIS]
GO

/****** Object:  Table [dbo].[tblModules]    Script Date: 6/29/2017 6:24:14 PM ******/
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


