USE [CurrencyRates]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 14.05.2021 15:00:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[UserName] [nvarchar](200) NOT NULL,
	[Password] [nvarchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
