USE [CurrencyRates]
GO
/****** Object:  StoredProcedure [dbo].[ChangeRoleUser]    Script Date: 14.05.2021 15:00:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ChangeRoleUser]
  @userId int,
  @roleId int
  as
  begin
	  update UserRoles
	  set RoleId=@roleId
	  where UserId=@userId
  end
GO
