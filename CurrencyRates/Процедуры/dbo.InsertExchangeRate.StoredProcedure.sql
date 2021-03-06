USE [CurrencyRates]
GO
/****** Object:  StoredProcedure [dbo].[InsertExchangeRate]    Script Date: 14.05.2021 15:00:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsertExchangeRate]
@bankId int,
@currencyInId int,
@currencyOutId int,
@sell float,
@purch float,
@user nvarchar(500)
 as
 begin
	if not exists (select * from ExchangeRates (nolock) where BankId=@bankId and CurrencyInId=@currencyInId and CurrencyOutId=@currencyOutId)
	begin
		insert into ExchangeRates(BankId,CurrencyInId,CurrencyOutId,SellingRate,PurchanseRate,IsManualInput,IsUpdateAuto,UpdateDate,UserFIO)
		values(@bankId,@currencyInId,@currencyOutId,@sell,@purch,1,0,GETDATE(),@user)

		if exists (select * from ExchangeRates (nolock)
					 where BankId=@bankId and CurrencyInId=@currencyInId and CurrencyOutId=@currencyOutId)
		begin
		insert into Logs([Log],InsertDate)
					 values((select 
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
					 inner join Banks as b(nolock)
					on b.Id=er.BankId
					inner join Currencies as c(nolock)
					on c.Id=er.CurrencyInId
					inner join Currencies as c1(nolock)
					on c1.Id=er.CurrencyOutId
					 where er.BankId=@bankId and er.CurrencyInId=@currencyInId and er.CurrencyOutId=@currencyOutId
					 FOR JSON AUTO),GETDATE())
		end
		select 'true'
	end
	else
	begin
		select 'Указанный курс валюты уже существует'
	end
 end

GO
