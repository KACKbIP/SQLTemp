USE [HelpDesk]
GO
/****** Object:  StoredProcedure [dbo].[GetValidateLogin]    Script Date: 14.05.2021 14:59:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetValidateLogin]
@login nvarchar(200),
@password nvarchar(200)
as 
begin
	select p.*,po.Name as PositionName, po.Token as PositionToken from Profile as p(nolock)
	inner join Position as po(nolock)
		on po.Id=p.PositionId
	where Login=@login and Password=@password
end
GO
