USE [CurrencyRates]
GO
/****** Object:  StoredProcedure [dbo].[UpdateExchangeRates]    Script Date: 14.05.2021 15:00:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[UpdateExchangeRates]
@id int,
@sell float,
@purch float,
@isManualInput bit,
@user nvarchar(500)
 as
 begin
	declare @response nvarchar(10);

	 
		 declare @oldSell float = (select er.SellingRate from ExchangeRates as er(nolock) where er.Id=@id)
		 declare @oldpurch float = (select er.PurchanseRate from ExchangeRates as er(nolock) where er.Id=@id)
			 if(
			 (@sell*100/@oldSell<15 or @purch*100/@oldpurch<15)
									or
				(@sell*100/@oldSell>115 or @purch*100/@oldpurch>115)
			 )
				 begin
					select 'Слишком большая разница курсов'
				 end			
			 else
				 begin
					 update ExchangeRates
					 set SellingRate=@sell, PurchanseRate=@purch, IsManualInput=@isManualInput, IsUpdateAuto=0, UpdateDate=GetDATE(), UserFIO=@user
					 where Id=@id

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
					 where er.Id=@id
					 FOR JSON AUTO),GETDATE())
			 
					 select 'true'
				end
		 

 end

GO
