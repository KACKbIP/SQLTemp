USE [HelpDesk]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 14.05.2021 14:58:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NULL,
	[Surname] [nvarchar](200) NULL,
	[Phone] [nvarchar](20) NULL,
	[Email] [nvarchar](200) NULL
) ON [PRIMARY]
GO
