USE [CurrencyRates]
GO
/****** Object:  StoredProcedure [dbo].[GetCurrencies]    Script Date: 14.05.2021 15:00:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create procedure [dbo].[GetCurrencies]
 as
 begin
 select * from Currencies (nolock)
 end
GO
