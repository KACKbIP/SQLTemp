USE [CSMR]
GO
/****** Object:  StoredProcedure [dbo].[SetWmIdIdentity]    Script Date: 14.05.2021 14:57:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create procedure [dbo].[SetWmIdIdentity]
  @id int,
  @wmId nvarchar(200)
	as
	begin
	update WebMoneyIdentity
	set WmId=@wmId
	where Id=@id
	end
GO
