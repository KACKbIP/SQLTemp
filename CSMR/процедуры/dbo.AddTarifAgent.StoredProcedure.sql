USE [CSMR]
GO
/****** Object:  StoredProcedure [dbo].[AddTarifAgent]    Script Date: 14.05.2021 14:57:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[AddTarifAgent]
@agentId int,
@tarifId int,
@tarifSum int
as
begin
if not exists(select * from TarifAgent as ta(nolock) where ta.AgentId=@agentId and ta.TarifId=@tarifId)
begin
insert into TarifAgent(AgentId,TarifId,TarifSum)
values(@agentId,@tarifId,@tarifSum)
end
else
begin
update TarifAgent
set TarifSum=@tarifSum
where AgentId=@agentId and TarifId=@tarifId
end
select 1
end
GO
