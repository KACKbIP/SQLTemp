USE [CSMR]
GO
/****** Object:  Table [dbo].[TarifAgent]    Script Date: 14.05.2021 14:57:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TarifAgent](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TarifId] [int] NOT NULL,
	[AgentId] [int] NOT NULL,
	[TarifSum] [int] NOT NULL
) ON [PRIMARY]
GO
