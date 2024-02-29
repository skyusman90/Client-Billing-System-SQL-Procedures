DROP PROCEDURE IF EXISTS UpdatePaymentStatusById
GO

CREATE PROCEDURE UpdatePaymentStatusById(
@ListOfPayment_ids	VARCHAR(2000),
@payment_status		char(1) = 'Y',
@client_id			INT
)
AS
BEGIN 

	UPDATE customer_payments SET
	payment_status = @payment_status
	WHERE
	payment_id IN (
	
		SELECT CAST(a.value as INT) as payment_id from string_split(@ListOfPayment_ids,',') a
	
	)
	and client_id = @client_id
	;
	
	SELECT cp.payment_id, cp.customer_id, cp.client_id, cp.package_id, cp.payment_title, cp.payment_due_date,  
			cp.payment_amount, cp.payment_status, cp.received_by, cp.generation_date, cp.sms_sent, cc.customer_name	, cps.package_name
	FROM customer_payments cp JOIN client_customers cc on cp.customer_id = cc.customer_id
	JOIN client_packages cps on cp.package_id = cps.package_id
	
	WHERE payment_id IN (
	
		SELECT CAST(a.value as INT) as payment_id from string_split(@ListOfPayment_ids,',') a
	
	)
	and client_id = @client_id
	;

END