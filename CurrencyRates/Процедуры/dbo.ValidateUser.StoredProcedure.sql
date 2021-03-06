USE [CurrencyRates]
GO
/****** Object:  StoredProcedure [dbo].[ValidateUser]    Script Date: 14.05.2021 15:00:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ValidateUser]
@userName nvarchar(200),
@password nvarchar(max)
as
begin
	select 
	u.Id, 
	u.Name, 
	u.UserName,
	r.Id as RoleId,
	r.Name as RoleName,
	r.GUID as RoleGUID
	from Users as u(nolock)
	inner join UserRoles as ur(nolock)
	on ur.UserId=u.Id
	inner join Roles as r(nolock)
	on r.Id=ur.RoleId
	where u.UserName=@userName and u.Password=@password
end
GO
