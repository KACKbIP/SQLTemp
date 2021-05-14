USE [CurrencyRates]
GO
/****** Object:  StoredProcedure [dbo].[ChangePassword]    Script Date: 14.05.2021 15:00:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ChangePassword]

@password nvarchar(max),
@userName nvarchar(100)
 as
 begin
	update Users 
	set [Password] = @password
	where UserName=@userName
 end

GO
