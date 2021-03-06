USE [CSMR]
GO
/****** Object:  StoredProcedure [dbo].[CheckWmKIdentity]    Script Date: 14.05.2021 14:57:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE procedure [dbo].[CheckWmKIdentity]  
  @id int
	as
	begin
	select 
	wmi.*, 
	wmim.Consent, 
	wmim.ConsentType, 
	wmim.FrontIdentity as FrontIdentityGuardian,
	wmim.FrontIdentityType as FrontIdentityGuardianType,
	wmim.BackIdentity as BackIdentityGuardian,
	wmim.BackIdentityType as BackIdentityGuardianType
	from WebMoneyIdentity as wmi(nolock)
	left join WebMoneyIdentityMinor as wmim(nolock)
	on wmim.WMIId = wmi.Id
	where wmi.Id=@id
	end
GO
