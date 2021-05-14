USE [CSMR]
GO
/****** Object:  StoredProcedure [dbo].[AddQuery]    Script Date: 14.05.2021 14:57:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[AddQuery]
@agentId int,
@queryCount int,
@fileBite nvarchar(max) = null,
@fileName nvarchar(200) = null,
@fileType nvarchar(200) = null
as
begin

Insert into LogQueryAdd(AgentId,QueryCount,AddDate,FileBite,FileName,FileType)
values(@agentId,@queryCount,GETDATE(),@fileBite,@fileName,@fileType)

select 1


end
GO
