USE [CSMR]
GO
/****** Object:  Table [dbo].[WebMoneyIdentityMinor]    Script Date: 14.05.2021 14:57:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebMoneyIdentityMinor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[WMIId] [int] NOT NULL,
	[Consent] [nvarchar](max) NULL,
	[ConsentType] [nvarchar](200) NULL,
	[FrontIdentity] [nvarchar](max) NULL,
	[FrontIdentityType] [nvarchar](200) NULL,
	[BackIdentity] [nvarchar](max) NULL,
	[BackIdentityType] [nvarchar](200) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
