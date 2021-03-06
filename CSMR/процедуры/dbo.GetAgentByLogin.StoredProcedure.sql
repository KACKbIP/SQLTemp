USE [CSMR]
GO
/****** Object:  StoredProcedure [dbo].[GetAgentByLogin]    Script Date: 14.05.2021 14:57:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[GetAgentByLogin]
@login nvarchar(200)
as
begin
select 
	a.Id,
	a.Name,
	a.Login,
	Count(i.Id) as QueryCount,
	a.IsActive,
	a.IsTest
	into #temp
	from Agents as a(nolock)
	left join Identifications as i(nolock)
		on i.AgentId=a.Id and i.Result is not null and i.Result!=0
	
	where a.Login=@login
	group by 
	a.Id,
	a.Name,
	a.Login,
	a.IsActive,
	a.IsTest

	select 
	a.Id,
	a.Name,
	a.Login,
	Sum(lqa.QueryCount) as Query,
	a.IsActive,
	a.IsTest
	into #temp1
	from Agents as a(nolock)
	left join LogQueryAdd as lqa(nolock)
		on lqa.AgentId=a.Id
	
	where a.Login=@login
	group by 
	a.Id,
	a.Name,
	a.Login,
	a.IsActive,
	a.IsTest

	select 
	t.Id,
	t.Name,
	t.Login,
	t.QueryCount,
	t1.Query - t.QueryCount as Query,
	t.IsActive,
	t.IsTest
	from #temp as t
	inner join #temp1 as t1
	 on t1.Id=t.Id

	 drop table #temp
	 drop table #temp1
end
GO
