USE [CurrencyRates]
GO
/****** Object:  StoredProcedure [dbo].[GetBank]    Script Date: 14.05.2021 15:00:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE procedure [dbo].[GetBank]
  @id int
  as
  begin

	select * from Banks (nolock) where id=@id

	end
GO
