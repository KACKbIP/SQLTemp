USE [HelpDesk]
GO
/****** Object:  StoredProcedure [dbo].[GetAnswer]    Script Date: 14.05.2021 14:59:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  create procedure [dbo].[GetAnswer]
  @subjectId int
  as
  begin
	select s.Answer from Subject as s(nolock)
		where s.Id=@subjectId
  end
GO
