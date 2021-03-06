USE [CurrencyRates]
GO
/****** Object:  StoredProcedure [dbo].[GetLogExchangeRates]    Script Date: 14.05.2021 15:00:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetLogExchangeRates]
@from DateTime,
@to DateTime
as
begin
select * from Logs (nolock)
where InsertDate>= @from and InsertDate<=DATEADD(SECOND,59,DATEADD(MINUTE,59,DATEADD(HOUR,23,@to)))
end

GO
