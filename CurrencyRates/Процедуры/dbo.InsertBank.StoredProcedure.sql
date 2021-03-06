USE [CurrencyRates]
GO
/****** Object:  StoredProcedure [dbo].[InsertBank]    Script Date: 14.05.2021 15:00:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsertBank]
  @name nvarchar(500),
  @processingId int
  as
  begin
	  if not exists (select * from Banks (nolock) where ProcessingId=@processingId)
	  begin

		if not exists (select * from Banks (nolock) where Name=@name)
		begin
		  insert into Banks(Name,ProcessingId,IsActive)
		  values(@name,@processingId,1)

		  select 'true'
		end
		else
		begin
			select 'Под таким именем уже заведен банк'
		end
	  end
	  else
	  begin
		select 'Под таким процессинг ID уже заведен банк' 
	  end
  end
GO
