USE [HelpDesk]
GO
/****** Object:  StoredProcedure [dbo].[GetPositions]    Script Date: 14.05.2021 14:59:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

  create procedure [dbo].[GetPositions]
  as
  begin
	select * from Position as p(nolock)
  end
GO
