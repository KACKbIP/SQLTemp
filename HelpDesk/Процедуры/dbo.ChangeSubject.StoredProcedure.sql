USE [HelpDesk]
GO
/****** Object:  StoredProcedure [dbo].[ChangeSubject]    Script Date: 14.05.2021 14:59:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  create procedure [dbo].[ChangeSubject]
  @id int,
  @question nvarchar(max),
  @answer nvarchar(max)
  as
  begin
  update Subject
  set Question=@question, Answer=@answer
  where id=@id
  end
GO
