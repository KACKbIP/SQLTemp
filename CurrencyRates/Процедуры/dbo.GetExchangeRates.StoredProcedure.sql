USE [CurrencyRates]
GO
/****** Object:  StoredProcedure [dbo].[GetExchangeRates]    Script Date: 14.05.2021 15:00:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetExchangeRates]
@currencyInId int = 0,
@currencyOutId int = 0
as
begin
select 

er.Id,
er.BankId,
b.Name as BankName,
er.CurrencyInId,
cIn.Name as CurrencyInName,
cIn.ISO as CurrencyInISO,
er.CurrencyOutId,
cOut.Name as CurrencyOutName,
cOut.ISO as CurrencyOutISO,
er.SellingRate,
er.PurchanseRate,
er.IsManualInput,
er.IsUpdateAuto,
er.UpdateDate,
er.UserFIO

from ExchangeRates as er(nolock)
	inner join Banks as b(nolock)
		on b.Id=er.BankId and b.IsActive=1
	inner join Currencies as cIn(nolock)
		on cIn.Id=er.CurrencyInId
	inner join Currencies as cOut(nolock)
		on cOut.Id=er.CurrencyOutId
where 
(@currencyInId = 0 and @currencyOutId = 0) 
or (er.CurrencyInId=@currencyInId and er.CurrencyOutId=@currencyOutId) 
or (er.CurrencyInId=@currencyInId and @currencyOutId = 0) 
or (@currencyInId = 0 and er.CurrencyOutId=@currencyOutId) 

order by er.BankId,er.CurrencyInId,er.CurrencyOutId
end
GO
