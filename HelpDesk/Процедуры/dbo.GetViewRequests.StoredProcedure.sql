USE [HelpDesk]
GO
/****** Object:  StoredProcedure [dbo].[GetViewRequests]    Script Date: 14.05.2021 14:59:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  create procedure [dbo].[GetViewRequests]
  as
  begin
  select * from ViewRequest as vr(nolock)
  end
GO
