USE [CSMR]
GO
/****** Object:  StoredProcedure [dbo].[DeleteTarif]    Script Date: 14.05.2021 14:57:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[DeleteTarif]
@id int
as
begin
	update Tarif
	set IsActive=0, Name='Delete' + Name
	where Id=@id
end
GO
