USE [uds]
GO

/****** Object:  Table [dbo].[UDS_BulletinAttachment]    Script Date: 05/21/2013 00:38:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[UDS_BulletinAttachment](
	[attachmentid] [int] IDENTITY(1,1) NOT NULL,
	[bulletinid] [int] NOT NULL,
	[attachmentname] [nvarchar](254) NOT NULL,
	[attachmentpath] [nvarchar](254) NOT NULL,
 CONSTRAINT [PK_UDS_BulletinAttachment] PRIMARY KEY CLUSTERED 
(
	[attachmentid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

