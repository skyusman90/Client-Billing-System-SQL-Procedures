DROP PROCEDURE IF EXISTS InsertCustomerPayment
go
CREATE PROCEDURE InsertCustomerPayment(
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

	INSERT INTO customer_payments
			(
				 customer_id ,client_id,package_id , payment_title
				, payment_due_date, payment_amount, payment_status
				, received_by , generation_date, sms_sent
			)
	
	SELECT		@customer_id ,@client_id, @package_id , @payment_title
				, @payment_due_date, @payment_amount, @payment_status
				, @received_by , GETDATE(), @sms_sent	
			
	
	SELECT SCOPE_IDENTITY()

END
GO