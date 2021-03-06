USE [CSMR]
GO
/****** Object:  StoredProcedure [dbo].[AddTarif]    Script Date: 14.05.2021 14:57:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AddTarif]
@name nvarchar(200),
@queryCount int
as
begin
if not exists(select * from Tarif as t(nolock) where t.Name=@name)
begin
insert into Tarif(Name,QueryCount,IsActive)
values(@name,@queryCount,1)
select 1
end
else
begin
select 0
end

end
GO
