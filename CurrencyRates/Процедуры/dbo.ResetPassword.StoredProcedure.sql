USE [CurrencyRates]
GO
/****** Object:  StoredProcedure [dbo].[ResetPassword]    Script Date: 14.05.2021 15:00:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  create procedure [dbo].[ResetPassword]
  @userId int,
  @password nvarchar(500)
  as
  begin
  update Users
  set Password=@password
  where Id=@userId
	end
GO
