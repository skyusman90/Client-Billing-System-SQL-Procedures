USE [Billing_Information]
GO
/****** Object:  StoredProcedure [dbo].[SelectAllPaymentsDisplay]    Script Date: 29/02/2024 4:55:15 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[SelectAllPaymentsDisplay](
@client_id INT
)
As
Begin
	select payment_id, customer_id, client_id, package_id, payment_title, CONVERT(varchar(20),payment_due_date,20) as payment_due_date,  
							payment_amount, payment_status, received_by, CONVERT(varchar(20),generation_date,20) as generation_date, sms_sent
				FROM customer_payments
				where client_id = @client_id
End