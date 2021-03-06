USE [CurrencyRates]
GO
/****** Object:  StoredProcedure [dbo].[GetCurrencyRates]    Script Date: 14.05.2021 15:00:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetCurrencyRates]
 as
 begin
	select distinct b.ProcessingId, cIn.ISO as CurrencyInISO, cOut.ISO as CurrencyOutISO, ex.SellingRate, ex.PurchanseRate from ExchangeRates as ex(nolock)
	inner join Banks as b(nolock)
	on b.Id=ex.BankId and b.IsActive=1
	inner join Currencies as cIn(nolock)
	on ex.CurrencyInId=cIn.Id
	inner join Currencies as cOut(nolock)
	on ex.CurrencyOutId=cOut.Id
 end
GO
