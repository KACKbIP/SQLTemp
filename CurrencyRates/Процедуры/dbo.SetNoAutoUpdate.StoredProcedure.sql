USE [CurrencyRates]
GO
/****** Object:  StoredProcedure [dbo].[SetNoAutoUpdate]    Script Date: 14.05.2021 15:00:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SetNoAutoUpdate]
@bankId int
 as
 begin
	update ExchangeRates
	set IsUpdateAuto=0
	where BankId=@bankId and IsManualInput=0
 end

GO
