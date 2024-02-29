USE [Billing_Information]
GO
/****** Object:  StoredProcedure [dbo].[LoginClient]    Script Date: 29/02/2024 4:54:33 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[LoginClient](
@Username varchar(100),
@Password varchar(100)
)
AS
BEGIN
	SELECT * from clients where client_username = @Username and client_password = @Password
END