USE [CSMR]
GO
/****** Object:  StoredProcedure [dbo].[NotCompleteWMIdentity]    Script Date: 14.05.2021 14:57:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE procedure [dbo].[NotCompleteWMIdentity]  
  @id int,
  @cause nvarchar(max)
	as
	begin
	update WebMoneyIdentity
	set isConfim=0, Cause=@cause
	where id=@id
	end
GO
