USE [HelpDesk]
GO
/****** Object:  StoredProcedure [dbo].[AddViewRequest]    Script Date: 14.05.2021 14:59:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  create procedure [dbo].[AddViewRequest]
  @name nvarchar(200)
  as
  begin
	insert into ViewRequest
	values(@name)
  end
GO
