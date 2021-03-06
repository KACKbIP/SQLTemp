USE [CSMR]
GO
/****** Object:  StoredProcedure [dbo].[GetValidateApi]    Script Date: 14.05.2021 14:57:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[GetValidateApi]
@login nvarchar(200),
@password nvarchar(200),
@token nvarchar(500)
as
begin
if exists (select * from Agents where Login=@login and Password=@password and Token=@token)
begin select 1 as isValid end
else begin select 0 as isValid end
end
GO
