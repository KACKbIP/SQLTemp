USE [CSMR]
GO
/****** Object:  StoredProcedure [dbo].[GetReportByLogin]    Script Date: 14.05.2021 14:57:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[GetReportByLogin]
@login nvarchar(200),
@dateBegin Datetime,
@dateTo DateTime
as
begin
select 
i.IIN,
i.Result,
i.SendDate

from Agents as a(nolock)
inner join Identifications as i(nolock)
on i.AgentId=a.Id
where i.SendDate>@dateBegin and i.SendDate<@dateTo and a.Login=@login
end
GO
