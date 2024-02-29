USE [Billing_Information]
GO
/****** Object:  StoredProcedure [dbo].[SelectAllPackagesDisplay]    Script Date: 29/02/2024 4:51:45 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER procedure [dbo].[SelectAllPackagesDisplay](
@client_id INT
)
As
Begin
	select * from client_packages where client_id = @client_id
End