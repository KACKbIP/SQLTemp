USE [CurrencyRates]
GO
/****** Object:  StoredProcedure [dbo].[UpdateBank]    Script Date: 14.05.2021 15:00:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[UpdateBank]
  @id int,
  @isActive bit
  as
  begin

 update Banks
 set IsActive=@isActive
 where Id=@id

  end


 
GO
