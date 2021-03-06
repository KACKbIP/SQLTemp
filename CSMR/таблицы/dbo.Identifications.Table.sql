USE [CSMR]
GO
/****** Object:  Table [dbo].[Identifications]    Script Date: 14.05.2021 14:57:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Identifications](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AgentId] [int] NOT NULL,
	[IIN] [nvarchar](14) NOT NULL,
	[Result] [decimal](18, 4) NULL,
	[Response] [nvarchar](max) NULL,
	[SendDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
