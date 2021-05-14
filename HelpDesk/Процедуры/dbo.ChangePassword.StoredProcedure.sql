USE [HelpDesk]
GO
/****** Object:  StoredProcedure [dbo].[ChangePassword]    Script Date: 14.05.2021 14:59:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ChangePassword]
@profileId int,
@password nvarchar(200)
as
begin
	update Profile
	set Password=@password
	where id=@profileId
end
GO
