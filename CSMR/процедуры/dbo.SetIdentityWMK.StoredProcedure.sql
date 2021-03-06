USE [CSMR]
GO
/****** Object:  StoredProcedure [dbo].[SetIdentityWMK]    Script Date: 14.05.2021 14:57:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SetIdentityWMK]
@wmid nvarchar(200),
  @email nvarchar(200),
  @iin nvarchar(13),
  @photo nvarchar(max),
  @photoType nvarchar(200),
  @frontIdentity nvarchar(max),
  @frontIdentityType nvarchar(200),
  @backIdentity nvarchar(max),
  @backIdentityType nvarchar(200),
  @consent nvarchar(max)=null,
  @consentType nvarchar(200)=null,
  @frontIdentityGuardian nvarchar(max)=null,
  @frontIdentityGuardianType nvarchar(200)=null,
  @backIdentityGuardian nvarchar(max)=null,
  @backIdentityGuardianType nvarchar(200)=null
	as
	begin
	declare @id int
	insert into WebMoneyIdentity(WmId,Email,IIN,Photo,PhotoType,FrontIdentity,FrontIdentityType,BackIdentity,BackIdentityType)
	values(@wmid,@email,@iin,@photo,@photoType,@frontIdentity,@frontIdentityType,@backIdentity,@backIdentityType)

	set @id=(select SCOPE_IDENTITY())
	if(@consent is not null)
	begin
		insert into WebMoneyIdentityMinor(WMIId,Consent,ConsentType,FrontIdentity,FrontIdentityType,BackIdentity,BackIdentityType)
		values(@id,@consent,@consentType,@frontIdentityGuardian,@frontIdentityGuardianType,@backIdentityGuardian,@backIdentityGuardianType)

		update WebMoneyIdentity
		set IsMinor = 1
		where id=@id
	end

	select @id
	end
GO
