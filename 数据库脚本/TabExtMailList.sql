USE [uds]
GO

/****** Object:  Table [dbo].[TabExtMailList]    Script Date: 08/01/2013 01:36:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

drop table TabExtMailList

GO

CREATE TABLE [dbo].[TabExtMailList](
	[MailID] [nvarchar](200) NULL,
	[Username] [nvarchar](20) NULL,
	[Email] [nvarchar](128) NULL,
	[ReadFlag] [bit] NULL,
	[FolderID] [int] NULL,
	[HeadersText] [text] NULL,
	[Subject] [varchar](200) NULL,
	[TextContent] [text] NULL,
	[HtmlContent] [text] NULL,
	[FromName] [varchar](50) NULL,
	[FromEmail] [varchar](128) NULL,
	[CcTo] [varchar](200) NULL,
	[BccTo] [varchar](200) NULL,
	[Replyto] [varchar](100) NULL,
	[SendDate] [datetime] NULL,
	[BodySize] [varchar](50) NULL,
	[Size] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


