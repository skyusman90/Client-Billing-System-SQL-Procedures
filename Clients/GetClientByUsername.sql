USE [Billing_Information]
GO
/****** Object:  StoredProcedure [dbo].[GetClientByUsername]    Script Date: 06/06/2024 2:36:21 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[GetClientByUsername](
@Username nvarchar(100)
)
As
Begin
	Select * from clients where client_username = @Username;
End