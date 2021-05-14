USE [CurrencyRates]
GO
/****** Object:  Table [dbo].[Logs]    Script Date: 14.05.2021 15:00:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Logs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Log] [nvarchar](max) NOT NULL,
	[InsertDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Logs] ADD  DEFAULT (getdate()) FOR [InsertDate]
GO
