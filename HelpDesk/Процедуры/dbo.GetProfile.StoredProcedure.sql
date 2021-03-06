USE [HelpDesk]
GO
/****** Object:  StoredProcedure [dbo].[GetProfile]    Script Date: 14.05.2021 14:59:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetProfile]
@profileId int
as 
begin
	select p.*,po.Name as PositionName, po.Token as PositionToken from Profile as p(nolock)
	inner join Position as po(nolock)
		on po.Id=p.PositionId
	where p.Id=@profileId
end
GO
