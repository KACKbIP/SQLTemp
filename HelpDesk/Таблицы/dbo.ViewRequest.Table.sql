USE [HelpDesk]
GO
/****** Object:  Table [dbo].[ViewRequest]    Script Date: 14.05.2021 14:58:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ViewRequest](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL
) ON [PRIMARY]
GO
