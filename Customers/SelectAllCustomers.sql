USE [Billing_Information]
GO
/****** Object:  StoredProcedure [dbo].[SelectAllCustomers]    Script Date: 29/02/2024 4:39:59 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[SelectAllCustomers](
@client_id INT
)
As
Begin
	select customer_id, customer_id_external, client_id, customer_name, customer_user_name, customer_cnic, cusotmer_mobilenum
	, customer_address, package_id, customer_due_day, CONVERT(varchar(10), join_date, 20)as join_date, customer_status
	from client_customers
	where client_id = @client_id
End