USE [CSMR]
GO
/****** Object:  StoredProcedure [dbo].[GetValidateLoginPassword]    Script Date: 14.05.2021 14:57:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[GetValidateLoginPassword]
@login nvarchar(200),
@password nvarchar(200)
as
begin
if exists (select * from Agents where Login=@login and Password=@password)
begin select 1 as isValid end
else begin select 0 as isValid end
end
GO
