USE [HelpDesk]
GO
/****** Object:  StoredProcedure [dbo].[SaveSubject]    Script Date: 14.05.2021 14:59:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  create procedure [dbo].[SaveSubject]
  @viewRequestId int,
  @question nvarchar(max),
  @answer nvarchar(max)
  as
  begin
  insert into Subject(Question,Answer,ViewRequestId)
  values(@question,@answer,@viewRequestId)
  end
GO
