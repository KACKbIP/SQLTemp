USE [CurrencyRates]
GO
/****** Object:  StoredProcedure [dbo].[GetBanks]    Script Date: 14.05.2021 15:00:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE procedure [dbo].[GetBanks]
  as
  begin

	select * from Banks (nolock)
	end
GO
