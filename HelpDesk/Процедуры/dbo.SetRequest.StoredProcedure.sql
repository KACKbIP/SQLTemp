USE [HelpDesk]
GO
/****** Object:  StoredProcedure [dbo].[SetRequest]    Script Date: 14.05.2021 14:59:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SetRequest]
@theme nvarchar(200),
@vrId int,
@email nvarchar(200) = null,
@phone nvarchar(20),
@firstName nvarchar(200),
@lastName nvarchar(200),
@subject int,
@extraSubject nvarchar(max) = null,
@description nvarchar(max) = null,
@profileId int,
@isResolved bit,
@personId int
as
begin
declare @id int
if not exists(select * from Client as c(nolock) where c.Phone =@phone)
begin
	insert into Client
	values(@lastName,@firstName,@phone,@email)
end
else
begin
	if not exists(select * from Client as c(nolock) where c.Phone = @phone and c.Name=@lastName and c.Surname=@firstName and c.Email=@email)
	begin
		update Client
		set Name = @lastName, Surname = @firstName, Email = @email
		where Phone = @phone
	end
end

insert into Request(Theme,ViewRequestId,SubjectId,Question,ClientId,Description,ProfileId,IsResolved,RequestDate)
select @theme,@vrId,@subject,@extraSubject,c.Id,@description,@personId,@isResolved,GETDATE() from Client as c(nolock)
where c.Phone=@phone

set @id=SCOPE_IDENTITY()

insert into LogRequest(RequestId,Command,ProfileId,LogTime)
values(@id,'Зарегистрировано заявление',@profileId,GETDATE())

select @id

end
GO
