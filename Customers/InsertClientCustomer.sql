DROP PROCEDURE IF EXISTS InsertClientCustomer
go
CREATE PROCEDURE InsertClientCustomer(
@customer_id_external	INT, 
@client_id				INT, 
@customer_name			VARCHAR(60),
@customer_user_name		VARCHAR(20),
@customer_cnic			VARCHAR(15), 
@cusotmer_mobilenum		VARCHAR(12),
@customer_address		VARCHAR(100),
@package_id				INT,
@customer_due_day		INT,
@join_date				DATE,
@customer_status		char(1)
)
AS
BEGIN 

	INSERT INTO client_customers(customer_id_external, client_id, customer_name, customer_user_name, customer_cnic, cusotmer_mobilenum, 
			customer_address, package_id, customer_due_day, join_date, customer_status)
	
	SELECT @customer_id_external, @client_id, @customer_name, @customer_user_name , @customer_cnic, @cusotmer_mobilenum, 
			@customer_address,@package_id, @customer_due_day, @join_date, @customer_status
	
	SELECT SCOPE_IDENTITY()

END
GO