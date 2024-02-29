USE [Billing_Information]
GO
/****** Object:  StoredProcedure [dbo].[SelectClientCustomer2]    Script Date: 29/02/2024 4:41:38 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectClientCustomer2](
@customer_id	INT,
@client_id		INT
)
AS
BEGIN 

	SELECT customer_id,customer_id_external, client_id, customer_name, customer_user_name, customer_cnic, cusotmer_mobilenum, 
		customer_address, package_id, customer_due_day, CONVERT(varchar(10), join_date, 20)as join_date, customer_status
	FROM client_customers(nolock)
	WHERE customer_id = @customer_id AND client_id = @client_id;

END