USE [HelpDesk]
GO
/****** Object:  StoredProcedure [dbo].[UpdateProfile]    Script Date: 14.05.2021 14:59:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[UpdateProfile]
@email nvarchar(200),
@phone nvarchar(20),
@firstName nvarchar(200),
@lastName nvarchar(200),
@profileId int
as 
begin
	update Profile
	set Name=@lastName, Surname=@firstName, Phone=@phone, Email=@email
	where Id=@profileId
end
GO
