DROP PROCEDURE IF EXISTS UpdateClientCustomer
go
CREATE PROCEDURE UpdateClientCustomer(
@customer_id			INT,
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

	UPDATE client_customers SET
	customer_id_external = @customer_id_external, client_id = @client_id, 
	customer_name = @customer_name, customer_user_name = @customer_user_name, 
	customer_cnic = @customer_cnic, cusotmer_mobilenum = @cusotmer_mobilenum, 
	customer_address = @customer_address, package_id = @package_id, 
	customer_due_day = @customer_due_day, join_date = @join_date, 
	customer_status = @customer_status
	WHERE
	customer_id = @customer_id and client_id = @client_id;
	
	
	SELECT customer_id,customer_id_external, client_id, customer_name, customer_user_name, customer_cnic, cusotmer_mobilenum, 
				customer_address, package_id, customer_due_day, join_date, customer_status
	FROM client_customers
	WHERE customer_id = @customer_id and client_id = @client_id;

END
GO