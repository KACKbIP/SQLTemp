USE [CSMR]
GO
/****** Object:  StoredProcedure [dbo].[GetQueryForAgent]    Script Date: 14.05.2021 14:57:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[GetQueryForAgent]
@login nvarchar(200),
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
	a.Login = @login
end
GO
