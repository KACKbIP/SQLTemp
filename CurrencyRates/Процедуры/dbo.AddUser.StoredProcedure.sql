USE [CurrencyRates]
GO
/****** Object:  StoredProcedure [dbo].[AddUser]    Script Date: 14.05.2021 15:00:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[AddUser]
@name nvarchar(500),
@roleId int,
@password nvarchar(max),
@login nvarchar(100)
 as
 begin
	if not exists (select * from Users (nolock) where UserName=@login)
	begin
		insert into Users (Name,UserName,Password)
		values (@name,@login,@password)

		insert into UserRoles(UserId,RoleId)
		select u.Id,@roleId from Users as u(nolock)
		where u.UserName=@login

		select 'true'
	end
	else
	begin
		select 'Указанный логин уже существует'
	end
 end

GO
