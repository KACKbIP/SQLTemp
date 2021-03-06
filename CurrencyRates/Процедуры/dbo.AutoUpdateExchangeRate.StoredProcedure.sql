USE [CurrencyRates]
GO
/****** Object:  StoredProcedure [dbo].[AutoUpdateExchangeRate]    Script Date: 14.05.2021 15:00:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AutoUpdateExchangeRate]
@bankId int,
@table as ExchangeRate readonly
 as
 begin


	Update ex
	set ex.SellingRate=t.SellingRate,ex.PurchanseRate=t.PurchanseRate,ex.IsUpdateAuto=1,ex.UpdateDate=GETDATE(),ex.UserFIO='Автообновление'
	from ExchangeRates as ex
	inner join Currencies as c(nolock)
	on c.Id=ex.CurrencyInId
	inner join Currencies as c1(nolock)
	on c1.Id=ex.CurrencyOutId
	inner join @table as t	on 
	t.CurrencyInISO=c.ISO and t.CurrencyOutISO=c1.ISO and ex.BankId=@bankId and ex.IsManualInput=0
	or t.CurrencyInISO = 'USD' and c.ISO = 'CYT' and t.CurrencyOutISO=c1.ISO and ex.BankId=@bankId and ex.IsManualInput=0
	or t.CurrencyInISO=c.ISO and t.CurrencyOutISO='USD' and c.ISO='CYT' and ex.BankId=@bankId and ex.IsManualInput=0


	
	if exists(select ex.* from ExchangeRates as ex(nolock)
					 inner join Currencies as c(nolock)
					on c.Id=ex.CurrencyInId
					inner join Currencies as c1(nolock)
					on c1.Id=ex.CurrencyOutId
					 inner join @table as t
					 on t.CurrencyInISO=c.ISO and t.CurrencyOutISO=c1.ISO and ex.BankId=@bankId and ex.IsManualInput=0)
					 begin
		insert into Logs([Log],InsertDate)
					 values((
					 select 
					 er.Id,
					er.BankId,
					b.Name as BankName,
					er.CurrencyInId,
					c.Name as CurrencyInName,
					c.ISO as CurrencyInISO,
					er.CurrencyOutId,
					c1.Name as CurrencyOutName,
					c1.ISO as CurrencyOutISO,
					er.SellingRate,
					er.PurchanseRate,
					er.IsManualInput,
					er.IsUpdateAuto,
					er.UpdateDate,
					er.UserFIO
					 from ExchangeRates as er(nolock)
					 inner join Currencies as c(nolock)
					on c.Id=er.CurrencyInId
					inner join Banks as b(nolock)
					on b.Id=er.BankId
					inner join Currencies as c1(nolock)
					on c1.Id=er.CurrencyOutId
					 inner join @table as t
					 on t.CurrencyInISO=c.ISO and t.CurrencyOutISO=c1.ISO and er.BankId=@bankId and er.IsManualInput=0
					 FOR JSON AUTO),GETDATE())
					 end
 end

GO
