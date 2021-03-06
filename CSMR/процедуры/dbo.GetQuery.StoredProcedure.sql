USE [CSMR]
GO
/****** Object:  StoredProcedure [dbo].[GetQuery]    Script Date: 14.05.2021 14:57:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[GetQuery]
@agentId int,
@from DateTime,
@to DateTime
as
begin
	select 
	loa.Id,
	loa.AgentId,
	a.Name as AgentName,
	loa.QueryCount,
	loa.AddDate,
	loa.FileBite,
	loa.FileName,
	loa.FileType
	
	from LogQueryAdd as loa(nolock)
	inner join Agents as a(nolock)
		on a.Id=loa.AgentId
	Where 
	loa.AddDate>=@from and loa.AddDate<=@to and
	loa.AgentId= CASE WHEN @agentId!=0 then @agentId else loa.AgentId end
end
GO
