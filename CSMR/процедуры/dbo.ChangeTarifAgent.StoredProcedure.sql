USE [CSMR]
GO
/****** Object:  StoredProcedure [dbo].[ChangeTarifAgent]    Script Date: 14.05.2021 14:57:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ChangeTarifAgent]
@id int,
@tarifSum int
as
begin
update TarifAgent
set TarifSum=@tarifSum
where Id=@id
select 1
end
GO
