USE [CSMR]
GO
/****** Object:  Table [dbo].[Tarif]    Script Date: 14.05.2021 14:57:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tarif](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[QueryCount] [int] NOT NULL,
	[IsActive] [bit] NOT NULL
) ON [PRIMARY]
GO
