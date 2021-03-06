USE [CSMR]
GO
/****** Object:  Table [dbo].[LogQueryAdd]    Script Date: 14.05.2021 14:57:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogQueryAdd](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AgentId] [int] NOT NULL,
	[QueryCount] [int] NOT NULL,
	[AddDate] [datetime] NOT NULL,
	[FileBite] [nvarchar](max) NULL,
	[FileName] [nvarchar](200) NULL,
	[FileType] [nvarchar](200) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
