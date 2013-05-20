USE [uds]
GO

/****** Object:  Table [dbo].[UDS_Bulletin]    Script Date: 05/21/2013 00:38:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[UDS_Bulletin](
	[bulletinid] [int] IDENTITY(1,1) NOT NULL,
	[subject] [nvarchar](50) NOT NULL,
	[contents] [nvarchar](500) NULL,
	[createtime] [datetime] NOT NULL,
	[sendtime] [datetime] NULL,
 CONSTRAINT [PK_UDS_Bulletin] PRIMARY KEY CLUSTERED 
(
	[bulletinid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

