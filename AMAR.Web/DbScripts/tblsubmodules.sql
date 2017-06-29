USE [AMIS]
GO

/****** Object:  Table [dbo].[tblSubModules]    Script Date: 06/30/17 1:50:24 AM ******/
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
	[MSUrl] [nvarchar](100) NULL,
 CONSTRAINT [PK_tblSubModules] PRIMARY KEY CLUSTERED 
(
	[MSCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


