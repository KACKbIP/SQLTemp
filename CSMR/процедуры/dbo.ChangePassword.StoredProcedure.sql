USE [CSMR]
GO
/****** Object:  StoredProcedure [dbo].[ChangePassword]    Script Date: 14.05.2021 14:57:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ChangePassword]
@login nvarchar(200),
@newPassword nvarchar(200)
as
begin
update Agents
set Password=@newPassword
where Login=@login
end
GO
