USE [HelpDesk]
GO
/****** Object:  StoredProcedure [dbo].[AddUser]    Script Date: 14.05.2021 14:59:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AddUser]
@login nvarchar(200),
@password nvarchar(200),
@email nvarchar(200)=null,
@phone nvarchar(20),
@firstName nvarchar(200),
@lastName nvarchar(200),
@positionId int
as
begin
	if not exists (select * from Profile as p(nolock) where p.Login=@login)
	begin
	insert into Profile(login,Password,Name,Surname,Phone,Email,PositionId)
	values(@login,@password,@lastName,@firstName,@phone,@email,@positionId)
	select 'true'
	end
	else
	begin
	select 'Пользователь с таким логином уже существует'
	end
end
GO
