USE [CSMR]
GO
/****** Object:  StoredProcedure [dbo].[GetNotCompletedWmIdIdentity]    Script Date: 14.05.2021 14:57:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetNotCompletedWmIdIdentity]  
	as
	begin
	select wmi.Id, wmi.WmId, wmi.DateSet, wmi.KiscResult, wmi.Amount, wmi.Cause from WebMoneyIdentity as wmi(nolock)
	where
	(wmi.IsPay=1 and wmi.IsConfim=0)
	order by wmi.Id desc
	end
GO
