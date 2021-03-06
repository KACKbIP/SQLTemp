USE [HelpDesk]
GO
/****** Object:  StoredProcedure [dbo].[UpdateUser]    Script Date: 14.05.2021 14:59:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[UpdateUser]
@firstName nvarchar(200),
@lastName nvarchar(200),
@email nvarchar(200) = null,
@positionId int,
@phone nvarchar(20),
@profileId int
as
begin
	update Profile
	set Surname=@firstName, Name=@lastName, Phone=@phone, Email=@email,PositionId=@positionId
	where Id=@profileId
end
GO
