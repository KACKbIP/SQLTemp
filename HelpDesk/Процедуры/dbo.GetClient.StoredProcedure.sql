USE [HelpDesk]
GO
/****** Object:  StoredProcedure [dbo].[GetClient]    Script Date: 14.05.2021 14:59:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetClient]
@phone nvarchar(20)
as
begin
	select * from Client as c(nolock)
		where c.Phone = @phone
end
GO
