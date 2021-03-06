USE [CSMR]
GO
/****** Object:  StoredProcedure [dbo].[SetPayWMIdentity]    Script Date: 14.05.2021 14:57:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE procedure [dbo].[SetPayWMIdentity]  
  @wmid nvarchar(200),
  @amount decimal(18,4)
	as
	begin
	update WebMoneyIdentity
	set IsPay=1, Amount=@amount
	where Id=(select top 1 wmi.Id from WebMoneyIdentity as wmi(nolock) where wmi.WmId=@wmid order by wmi.Id desc)
	end
GO
