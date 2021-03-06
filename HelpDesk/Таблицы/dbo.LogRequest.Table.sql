USE [HelpDesk]
GO
/****** Object:  Table [dbo].[LogRequest]    Script Date: 14.05.2021 14:58:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogRequest](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RequestId] [int] NOT NULL,
	[Command] [nvarchar](max) NOT NULL,
	[ProfileId] [int] NOT NULL,
	[LogTime] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
