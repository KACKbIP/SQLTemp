USE [CSMR]
GO
/****** Object:  StoredProcedure [dbo].[UpdateResultWMIdentity]    Script Date: 14.05.2021 14:57:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE procedure [dbo].[UpdateResultWMIdentity] 
  @id int,
  @result decimal(18,4)
	as
	begin
	update WebMoneyIdentity
	set KiscResult=@result
	where id=@id
	end
GO
