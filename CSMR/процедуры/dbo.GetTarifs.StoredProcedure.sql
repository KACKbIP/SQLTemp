USE [CSMR]
GO
/****** Object:  StoredProcedure [dbo].[GetTarifs]    Script Date: 14.05.2021 14:57:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[GetTarifs]
as
begin
	select * from Tarif as t(nolocK)
	where t.IsActive=1
end
GO
