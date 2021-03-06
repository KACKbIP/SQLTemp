USE [CSMR]
GO
/****** Object:  StoredProcedure [dbo].[UpdateIdentification]    Script Date: 14.05.2021 14:57:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[UpdateIdentification]
  @key int,
  @result nvarchar(200),
  @keyCSMR nvarchar(200)
  as

  begin
	update Identifications
	set Result=CONVERT(DECIMAL(18,4),@result), Response=@keyCSMR
	where Id=@key
  end
GO
