DROP PROCEDURE IF EXISTS SelectClientCustomer
go
CREATE PROCEDURE SelectClientCustomer(
@customer_id	INT,
@client_id		INT
)
AS
BEGIN 

	SELECT customer_id,customer_id_external, client_id, customer_name, customer_user_name, customer_cnic, cusotmer_mobilenum, 
		customer_address, package_id, customer_due_day, join_date, customer_status, 
		(SELECT ISNULL(SUM(payment_amount),0) from customer_payments(nolock) cp WHERE cp.customer_id =  @customer_id and cp.client_id = @client_id AND payment_status = 'N') as TotalPaymentDue
	FROM client_customers(nolock)
	WHERE customer_id = @customer_id AND client_id = @client_id;

END
GO