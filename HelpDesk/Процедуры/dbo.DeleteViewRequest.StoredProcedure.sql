USE [HelpDesk]
GO
/****** Object:  StoredProcedure [dbo].[DeleteViewRequest]    Script Date: 14.05.2021 14:59:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  create procedure [dbo].[DeleteViewRequest]
  @id int
  as
  begin
	delete from ViewRequest
	where id=@id
  end
GO
