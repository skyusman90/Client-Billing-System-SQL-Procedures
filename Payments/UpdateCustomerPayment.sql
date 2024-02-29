DROP PROCEDURE IF EXISTS UpdateCustomerPayment
go
CREATE PROCEDURE UpdateCustomerPayment(
@payment_id			int,
@customer_id		int,
@client_id			int,
@package_id			int,
@payment_title		varchar(100),
@payment_due_date	date,
@payment_amount		decimal,
@payment_status		char(1) = 'N'
@received_by		int,
@generation_date	date,
@sms_sent			char = 'N'
)
AS
BEGIN 

	UPDATE customer_payments SET 
	 customer_id       = @customer_id
	,client_id         = @client_id
	,package_id        = @package_id
	,payment_title     = @payment_title
	,payment_due_date  = @payment_due_date
	,payment_amount    = @payment_amount
	,payment_status    = @payment_status
	,received_by       = @received_by
	,generation_date   = @generation_date
	,sms_sent          = @sms_sent
	
	WHERE payment_id = @payment_id AND client_id = @client_id;
	
	SELECT cp.payment_id, cp.customer_id, cp.client_id, cp.package_id, cp.payment_title, cp.payment_due_date,  
			cp.payment_amount, cp.payment_status, cp.received_by, cp.generation_date, cp.sms_sent, cc.customer_name	, cps.package_name
	FROM customer_payments cp JOIN client_customers cc on cp.customer_id = cc.customer_id
	JOIN client_packages cps on cp.package_id = cps.package_id
	
	WHERE payment_id = @payment_id AND client_id = @client_id;


END
GO