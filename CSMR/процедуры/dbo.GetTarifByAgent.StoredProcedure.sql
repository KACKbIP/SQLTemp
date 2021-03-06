USE [CSMR]
GO
/****** Object:  StoredProcedure [dbo].[GetTarifByAgent]    Script Date: 14.05.2021 14:57:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetTarifByAgent]
@login nvarchar(200)
as
begin
select t.Id, t.Name, t.QueryCount, ta.TarifSum as Sum 
from Tarif as t(nolock)
inner join TarifAgent as ta(nolock)
	on ta.TarifId=t.Id
inner join Agents as a(nolock)
	on a.Id=ta.AgentId and a.Login=@login
where t.IsActive=1
end
GO
