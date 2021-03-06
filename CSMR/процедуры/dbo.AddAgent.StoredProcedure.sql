USE [CSMR]
GO
/****** Object:  StoredProcedure [dbo].[AddAgent]    Script Date: 14.05.2021 14:57:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[AddAgent]
@login nvarchar(200),
@password nvarchar(200),
@name nvarchar(200),
@token nvarchar(500),
@isTest bit
as
begin
	if not exists (select * from Agents where Login=@login)
	begin
		insert into Agents(Login,Password,Name,Token,IsActive,IsTest)
		values (@login,@password,@name,@token,1,@isTest)

		select 1
	end
	else
	begin
		select 0
	end
end
GO
