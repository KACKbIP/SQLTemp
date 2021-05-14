USE [CSMR]
GO
/****** Object:  StoredProcedure [dbo].[UpdateAgent]    Script Date: 14.05.2021 14:57:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[UpdateAgent]
@id int,
@check bit,
@isActive bit

as
begin
	if(@isActive=1)
	begin
		update Agents
		set IsActive=@check
		where id=@id
	end
	else
	begin
		update Agents
		set IsTest=@check
		where id=@id
	end
end
GO
