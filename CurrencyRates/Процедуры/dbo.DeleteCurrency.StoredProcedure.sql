USE [CurrencyRates]
GO
/****** Object:  StoredProcedure [dbo].[DeleteCurrency]    Script Date: 14.05.2021 15:00:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[DeleteCurrency]
  @id int
  as
  begin

delete from Currencies where id=@id

  end


 
GO
