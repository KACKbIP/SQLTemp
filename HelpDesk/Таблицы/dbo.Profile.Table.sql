USE [HelpDesk]
GO
/****** Object:  Table [dbo].[Profile]    Script Date: 14.05.2021 14:58:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Profile](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Login] [nvarchar](200) NOT NULL,
	[Password] [nvarchar](200) NOT NULL,
	[Name] [nvarchar](200) NULL,
	[Surname] [nvarchar](200) NULL,
	[Phone] [nvarchar](200) NULL,
	[Email] [nvarchar](200) NULL,
	[PositionId] [int] NOT NULL
) ON [PRIMARY]
GO
