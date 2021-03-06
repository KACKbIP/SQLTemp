USE [HelpDesk]
GO
/****** Object:  StoredProcedure [dbo].[GetPersons]    Script Date: 14.05.2021 14:59:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetPersons]
as
begin
	select  
	p.Id,
	p.Name,
	p.Surname,
	po.Name as Position
	from Profile as p(nolock)
	left join Position as po(nolock)
		on p.PositionId = po.Id
end
GO
