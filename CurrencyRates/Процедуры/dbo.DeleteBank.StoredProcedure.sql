USE [CurrencyRates]
GO
/****** Object:  StoredProcedure [dbo].[DeleteBank]    Script Date: 14.05.2021 15:00:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[DeleteBank]
  @id int
  as
  begin

delete from Banks where id=@id

  end


 
GO
