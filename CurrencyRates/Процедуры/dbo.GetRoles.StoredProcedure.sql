USE [CurrencyRates]
GO
/****** Object:  StoredProcedure [dbo].[GetRoles]    Script Date: 14.05.2021 15:00:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  create procedure [dbo].[GetRoles]
  as
  begin

	select * from Roles (nolock)
	end
GO
