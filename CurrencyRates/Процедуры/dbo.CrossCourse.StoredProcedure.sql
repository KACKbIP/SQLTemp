USE [CurrencyRates]
GO
/****** Object:  StoredProcedure [dbo].[CrossCourse]    Script Date: 14.05.2021 15:00:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[CrossCourse]
 as
 begin
	update er
	set er.SellingRate=cast(erIn.SellingRate/erOut.PurchanseRate AS DECIMAL(38,4)),
		er.PurchanseRate=cast(erIn.PurchanseRate/erOut.SellingRate AS DECIMAL(38,4)),
		er.IsUpdateAuto=1,
		er.UpdateDate=GETDATE(),
		er.UserFIO='Автообновление'
	from ExchangeRates as er(nolock)
	inner join ExchangeRates as erIn(nolock)
	on erIn.CurrencyInId=er.CurrencyInId and erIn.CurrencyOutId=1 and er.BankId=erIn.BankId
	inner join ExchangeRates as erOut(nolock)
	on erOut.CurrencyInId=er.CurrencyOutId and erOut.CurrencyOutId=1 and er.BankId=erOut.BankId
	where er.CurrencyInId in (2,3,4,8,9) and er.IsManualInput=0

	insert into Logs([Log],InsertDate)
					 values((
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
					inner join ExchangeRates as erIn(nolock)
	on erIn.CurrencyInId=er.CurrencyInId and erIn.CurrencyOutId=1 and er.BankId=erIn.BankId
	inner join ExchangeRates as erOut(nolock)
	on erOut.CurrencyInId=er.CurrencyOutId and erOut.CurrencyOutId=1 and er.BankId=erOut.BankId
					 where er.CurrencyInId in (2,3,4) and er.IsManualInput=0
					 FOR JSON AUTO),GETDATE())

 end


GO
