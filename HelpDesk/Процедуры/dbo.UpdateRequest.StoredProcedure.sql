USE [HelpDesk]
GO
/****** Object:  StoredProcedure [dbo].[UpdateRequest]    Script Date: 14.05.2021 14:59:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[UpdateRequest]
@requestId int,
@profileId int,
@personId int,
@description nvarchar(max) = null,
@isResolved bit
as
begin
	if not exists(select * from Request where Id=@requestId and ProfileId=@personId)
	begin
		insert into LogRequest(RequestId,Command,ProfileId,LogTime)
		values (@requestId,'Изменен исполнитель',@profileId,GETDATE())
	end
	if not exists(select * from Request where Id=@requestId and Description=@description)
	begin
		insert into LogRequest(RequestId,Command,ProfileId,LogTime)
		values (@requestId,'Изменено описание',@profileId,GETDATE())
	end
	if not exists(select * from Request where Id=@requestId and IsResolved=@isResolved)
	begin
		insert into LogRequest(RequestId,Command,ProfileId,LogTime)
		values (@requestId,'Изменен статус заявления',@profileId,GETDATE())
	end
	update Request
	set ProfileId=@personId, Description=@description, IsResolved=@isResolved
	where id=@requestId
end
GO
