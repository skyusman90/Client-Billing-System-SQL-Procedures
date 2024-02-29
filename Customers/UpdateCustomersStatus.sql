DROP PROCEDURE IF EXISTS UpdateCustomersStatus
go
CREATE PROCEDURE UpdateCustomersStatus(
@ListOfcustomer_ids	VARCHAR(2000),
@customer_status	char(1) = 'Y',
@client_id			INT
)
AS
BEGIN 

	UPDATE client_customers SET
	customer_status = @customer_status
	WHERE
	customer_id IN (
	
		SELECT CAST(a.value as INT) as customer_id from string_split(@ListOfcustomer_ids,',') a
	
	)
	and client_id = @client_id
	;
	
	SELECT customer_id,customer_id_external, client_id, customer_name, customer_user_name, customer_cnic, cusotmer_mobilenum, 
				customer_address, package_id, customer_due_day, join_date, customer_status
	FROM client_customers
	WHERE customer_id IN (
	
		SELECT CAST(a.value as INT) as customer_id from string_split(@ListOfcustomer_ids,',') a
	
	)
	and client_id = @client_id
	;

END
GO