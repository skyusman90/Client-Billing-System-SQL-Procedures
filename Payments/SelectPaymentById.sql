DROP PROCEDURE IF EXISTS SelectPaymentById
go
CREATE PROCEDURE SelectPaymentById(
@payment_id INT,
@client_id  INT
)
BEGIN 

	SELECT	
	payment_id, customer_id, client_id, package_id, payment_title, payment_due_date, 
	payment_amount, payment_status, received_by, generation_date, sms_sent	
		
	FROM customer_payments
	WHERE payment_id = @payment_id AND client_id = @client_id;


END