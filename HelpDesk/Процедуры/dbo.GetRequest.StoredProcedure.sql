USE [HelpDesk]
GO
/****** Object:  StoredProcedure [dbo].[GetRequest]    Script Date: 14.05.2021 14:59:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetRequest]
@requestId int
as
begin
	select 

	r.*, 
	s.Question as SubjectQuestion, 
	s.Answer as SubjectAnswer,
	vr.Name as RequestName, 
	p.Name,p.Surname,
	po.Name as PositionName, 
	c.Id as ClientId, 
	c.Name as ClientName, 
	c.Surname as ClientSurname, 
	c.Phone as ClientPhone, 
	c.Email as ClientEmail

	from Request as r(nolock)
	inner join ViewRequest as vr(nolock)
		on vr.Id=r.ViewRequestId
	left join Subject as s(nolock)
		on s.Id=r.SubjectId
	inner join Profile as p(nolock)
		on p.Id=r.ProfileId
	inner join Position as po(nolock)
		on po.Id=p.PositionId
	inner join Client as c(nolock)
		on c.Id=r.ClientId
	where r.Id=@requestId

end
GO
