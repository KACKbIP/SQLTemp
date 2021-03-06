USE [CSMR]
GO
/****** Object:  Table [dbo].[WebMoneyIdentity]    Script Date: 14.05.2021 14:57:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebMoneyIdentity](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[WmId] [nvarchar](30) NULL,
	[Email] [nvarchar](200) NULL,
	[IIN] [nvarchar](13) NULL,
	[Photo] [nvarchar](max) NULL,
	[PhotoType] [nvarchar](200) NULL,
	[FrontIdentity] [nvarchar](max) NULL,
	[FrontIdentityType] [nvarchar](200) NULL,
	[BackIdentity] [nvarchar](max) NULL,
	[BackIdentityType] [nvarchar](200) NULL,
	[KiscResult] [decimal](18, 4) NULL,
	[IsConfim] [bit] NULL,
	[IsPay] [bit] NULL,
	[Amount] [decimal](18, 4) NULL,
	[DateSet] [datetime] NULL,
	[Cause] [nvarchar](max) NULL,
	[IsMinor] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[WebMoneyIdentity] ADD  DEFAULT (getdate()) FOR [DateSet]
GO
