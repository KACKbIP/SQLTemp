USE [CSMR]
GO
/****** Object:  StoredProcedure [dbo].[GetIdentificationId]    Script Date: 14.05.2021 14:57:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetIdentificationId]
  @IIN nvarchar(13),
  @login nvarchar(200)
  as

  begin
  if((select a.IsTest from Agents as a(nolock) where a.Login=@login) = 1)
  begin
	select 0
	end
	else
	begin

	insert into Identifications(AgentId,IIN,Result,Response,SendDate)
	select a.Id,@IIN,null,null,GETDATE() from Agents as a(nolock)
	where a.Login=@login
	select SCOPE_IDENTITY()
	end
  end
GO
