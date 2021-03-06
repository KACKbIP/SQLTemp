USE [HelpDesk]
GO
/****** Object:  Table [dbo].[Request]    Script Date: 14.05.2021 14:58:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Request](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Theme] [nvarchar](200) NOT NULL,
	[ViewRequestId] [int] NOT NULL,
	[SubjectId] [int] NOT NULL,
	[Question] [nvarchar](max) NULL,
	[ClientId] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[ProfileId] [int] NOT NULL,
	[IsResolved] [bit] NOT NULL,
	[RequestDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
