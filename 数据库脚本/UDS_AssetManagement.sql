USE [uds]
GO

/****** Object:  Table [dbo].[uds_assetmanagement]    Script Date: 06/25/2013 23:17:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[uds_assetmanagement](
	[name] [nvarchar](100) NOT NULL,
	[code] [nvarchar](50) NOT NULL,
	[Specification] [nvarchar](100) NOT NULL,
	[number] [int] NOT NULL,
	[totalprice] [numeric](18, 2) NOT NULL,
	[taxrate] [numeric](18, 2) NOT NULL,
	[location] [nvarchar](100) NULL,
	[startusingtime] [datetime] NOT NULL,
	[buyingtime] [datetime] NOT NULL,
	[status] [int] NOT NULL,
	[usingman] [nvarchar](50) NULL,
	[remark] [nvarchar](100) NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_uds_assetmanagement] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO