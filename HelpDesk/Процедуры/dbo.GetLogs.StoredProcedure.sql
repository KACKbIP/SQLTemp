USE [HelpDesk]
GO
/****** Object:  StoredProcedure [dbo].[GetLogs]    Script Date: 14.05.2021 14:59:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE procedure [dbo].[GetLogs]
  @requestId int
  as
  begin
  select lr.Id,lr.Command,lr.ProfileId,lr.LogTime,p.Surname,p.Name
  from LogRequest as lr(nolock)
  inner join Profile as p(nolock)
	on p.Id=lr.ProfileId
where lr.RequestId=@requestId
order by LogTime desc
end
GO
