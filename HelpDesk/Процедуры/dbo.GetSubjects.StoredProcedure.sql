USE [HelpDesk]
GO
/****** Object:  StoredProcedure [dbo].[GetSubjects]    Script Date: 14.05.2021 14:59:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetSubjects]
@viewRequestId int
as
begin
	select * from Subject as s(nolock)
	where s.ViewRequestId = @viewRequestId
end
GO
