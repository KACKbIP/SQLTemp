USE [CSMR]
GO
/****** Object:  StoredProcedure [dbo].[GetReportByAgent]    Script Date: 14.05.2021 14:57:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[GetReportByAgent]
@agentId int,
@from Datetime,
@to DateTime
as
begin
select 
a.Id as AgentId,
a.Name as AgentName,
i.IIN,
i.Result,
i.SendDate

from Agents as a(nolock)
inner join Identifications as i(nolock)
on i.AgentId=a.Id
where i.SendDate>=@from and i.SendDate<=@to and
a.Id = CASE WHEN @agentId!=0 then @agentId else a.Id end

end
GO
