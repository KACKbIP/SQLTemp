USE [CSMR]
GO
/****** Object:  StoredProcedure [dbo].[GetAccount]    Script Date: 14.05.2021 14:57:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[GetAccount]
@login nvarchar(200),
@password nvarchar(200)
as
begin
	select a.Login,a.Token from Agents as a(nolock) where Login=@login and Password=@password
end
GO
