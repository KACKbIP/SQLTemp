USE [CSMR]
GO
/****** Object:  Table [dbo].[Agents]    Script Date: 14.05.2021 14:57:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Agents](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NOT NULL,
	[Login] [nvarchar](200) NOT NULL,
	[Password] [nvarchar](200) NOT NULL,
	[Token] [nvarchar](500) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsTest] [bit] NOT NULL
) ON [PRIMARY]
GO
