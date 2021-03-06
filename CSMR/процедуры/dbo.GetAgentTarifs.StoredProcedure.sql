USE [CSMR]
GO
/****** Object:  StoredProcedure [dbo].[GetAgentTarifs]    Script Date: 14.05.2021 14:57:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[GetAgentTarifs]
as
begin
	select 
	ta.Id,
	ta.TarifId,
	t.Name as TarifName,
	ta.TarifSum,
	ta.AgentId,
	a.Name as AgentName
	
	
	from TarifAgent as ta(nolock)
	inner join Agents as a(nolock)
		on ta.AgentId = a.Id
	inner join Tarif as t(nolock)
		on ta.TarifId = t.id
	where t.IsActive=1
end
GO
