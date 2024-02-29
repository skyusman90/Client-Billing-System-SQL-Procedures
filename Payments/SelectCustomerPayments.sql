DROP PROCEDURE IF EXISTS SelectCustomerPayments
go
CREATE PROCEDURE SelectCustomerPayments(
@customer_id 	INT,
@client_id  	INT,
@ordBy			INT = 1
)
BEGIN 

	IF @ordBy = 1 THEN 
		SELECT cp.payment_id, cp.customer_id, cp.client_id, cp.package_id, cp.payment_title, cp.payment_due_date,  
					cp.payment_amount, cp.payment_status, cp.received_by, cp.generation_date, cp.sms_sent, cc.customer_name	, cps.package_name
		FROM customer_payments cp JOIN client_customers cc on cp.customer_id = cc.customer_id
		JOIN client_packages cps on cp.package_id = cps.package_id
		WHERE 1 = 1
		AND cp.customer_id = @customer_id AND client_id = @client_id ORDER BY payment_due_date desc;
	ELSE
		SELECT cp.payment_id, cp.customer_id, cp.client_id, cp.package_id, cp.payment_title, cp.payment_due_date,  
					cp.payment_amount, cp.payment_status, cp.received_by, cp.generation_date, cp.sms_sent, cc.customer_name	, cps.package_name
		FROM customer_payments cp JOIN client_customers cc on cp.customer_id = cc.customer_id
		JOIN client_packages cps on cp.package_id = cps.package_id
		WHERE 1 = 1
		AND cp.customer_id = @customer_id AND client_id = @client_id ORDER BY payment_due_date asc;

END