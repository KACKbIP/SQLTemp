USE [HelpDesk]
GO
/****** Object:  StoredProcedure [dbo].[DeleteSubject]    Script Date: 14.05.2021 14:59:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  create procedure [dbo].[DeleteSubject]
  @id int
  as
  begin
  delete from Subject
  where id=@id
  end
GO
