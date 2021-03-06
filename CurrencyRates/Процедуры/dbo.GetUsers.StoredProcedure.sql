USE [CurrencyRates]
GO
/****** Object:  StoredProcedure [dbo].[GetUsers]    Script Date: 14.05.2021 15:00:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  create procedure [dbo].[GetUsers]
  as
  begin

	select u.*,r.Id as roleId from Users as u(nolock)
	inner join UserRoles as ur(nolock)
	on ur.UserId=u.Id
	inner join Roles as r(nolock)
	on r.Id=ur.RoleId
	end
GO
