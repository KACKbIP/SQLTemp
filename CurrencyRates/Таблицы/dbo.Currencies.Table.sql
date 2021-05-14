USE [CurrencyRates]
GO
/****** Object:  Table [dbo].[Currencies]    Script Date: 14.05.2021 15:00:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Currencies](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[ISO] [nvarchar](10) NOT NULL
) ON [PRIMARY]
GO
