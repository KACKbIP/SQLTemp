USE [CurrencyRates]
GO
/****** Object:  Table [dbo].[ExchangeRates]    Script Date: 14.05.2021 15:00:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExchangeRates](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BankId] [int] NOT NULL,
	[CurrencyInId] [int] NOT NULL,
	[CurrencyOutId] [int] NOT NULL,
	[SellingRate] [float] NOT NULL,
	[PurchanseRate] [float] NOT NULL,
	[IsManualInput] [bit] NOT NULL,
	[IsUpdateAuto] [bit] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
	[UserFIO] [nvarchar](200) NULL
) ON [PRIMARY]
GO
