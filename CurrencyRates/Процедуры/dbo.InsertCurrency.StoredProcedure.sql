USE [CurrencyRates]
GO
/****** Object:  StoredProcedure [dbo].[InsertCurrency]    Script Date: 14.05.2021 15:00:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsertCurrency]
  @name nvarchar(500),
  @iso nvarchar(5)
  as
  begin
	  if not exists (select * from Currencies (nolock) where ISO=@iso)
	  begin
		if not exists (select * from Currencies (nolock) where Name=@name)
		begin
		  insert into Currencies(Name,ISO)
		  values( @name,@iso)

		  select 'true'
		end
		else
		begin
			select 'Под таким названием уже существует валюта' 
		end
	  end
	  else
	  begin
		select 'Под таким ISO уже существует валюта' 
	  end
  end
GO
