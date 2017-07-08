USE [AMIS]
GO

/****** Object:  Table [dbo].[tblUserPer]    Script Date: 7/8/2017 10:09:49 PM ******/
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
	[CDate] [datetime] NULL,
	[CStatus] [varchar](10) NULL,
	[CRemarks] [varchar](250) NULL,
	[Insert] [varchar](5) NULL,
	[Update] [varchar](5) NULL,
	[Delete] [varchar](5) NULL,
	[Select] [varchar](5) NULL,
	[Import] [varchar](5) NULL,
	[Export] [varchar](5) NULL,
	[Date] [datetime] NULL,
	[SMRef] [uniqueidentifier] NULL,
	[MMRef] [uniqueidentifier] NULL,
	[CPCGRef] [uniqueidentifier] NULL,
 CONSTRAINT [PK_tblUserPer] PRIMARY KEY CLUSTERED 
(
	[RefNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


