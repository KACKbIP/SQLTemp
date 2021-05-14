USE [CSMR]
GO
/****** Object:  StoredProcedure [dbo].[GetWmIdIdentity]    Script Date: 14.05.2021 14:57:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE procedure [dbo].[GetWmIdIdentity]  
	as
	begin
	select wmi.Id, wmi.WmId, wmi.DateSet, wmi.KiscResult, wmi.Amount from WebMoneyIdentity as wmi(nolock)
	where
	(wmi.IsPay=1 and wmi.IsConfim is null)
	end
GO
