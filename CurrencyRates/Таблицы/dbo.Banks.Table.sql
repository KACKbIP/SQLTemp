USE [CurrencyRates]
GO
/****** Object:  Table [dbo].[Banks]    Script Date: 14.05.2021 15:00:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Banks](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[ProcessingId] [int] NULL,
	[IsActive] [bit] NOT NULL
) ON [PRIMARY]
GO
