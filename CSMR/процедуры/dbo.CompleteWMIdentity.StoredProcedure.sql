USE [CSMR]
GO
/****** Object:  StoredProcedure [dbo].[CompleteWMIdentity]    Script Date: 14.05.2021 14:57:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  create procedure [dbo].[CompleteWMIdentity]  
  @id int
	as
	begin
	update WebMoneyIdentity
	set isConfim=1
	where id=@id
	end
GO
