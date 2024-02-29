DROP PROCEDURE IF EXISTS SelectAllPayments
go
CREATE PROCEDURE SelectAllPayments(
@client_id		INT,
@PaymentTitle	varchar(100) = '',
@PaidUnPaid		char(1) = 'A',
@orderBy		varchar(20) = 'Name',
@ascOrDesc		varchar(4) = 'ASC',
@StartDate		DATE = NULL,
@EndDate		DATE = NULL,
@customer_id	INT	 = NULL
)
AS
BEGIN 

	DECLARE @sql nvarchar(max) = ''
	DECLARE @params NVARCHAR(4000) = N'@client_id INT, @PaidUnPaid char(1),@PaymentTitle varchar(100), @StartDate DATE, @EndDate DATE, @customer_id INT'

	SET @sql = 'SELECT cp.payment_id, cp.customer_id, cp.client_id, cp.package_id, cp.payment_title, cp.payment_due_date,  
							cp.payment_amount, cp.payment_status, cp.received_by, cp.generation_date, cp.sms_sent, cc.customer_name	, cps.package_name
				FROM customer_payments cp JOIN client_customers cc on cp.customer_id = cc.customer_id
				JOIN client_packages cps on cp.package_id = cps.package_id
				WHERE 1 = 1				
				AND cp.client_id = @client_id'
				
	IF @PaidUnPaid IS NOT NULL and @PaidUnPaid IN ('N','Y')
		SET @sql = @sql + ' AND payment_status = @PaidUnPaid';
	
	IF @PaymentTitle IS NOT NULL and LEN(@PaymentTitle) > 0
		SET @sql = @sql + ' AND payment_title LIKE ''%'' + @PaymentTitle + ''%'' ';

				
	IF @StartDate IS NOT NULL AND @EndDate IS NOT NULL 
			SET @sql = @sql + ' AND cp.payment_due_date between @StartDate AND @EndDate ';

	IF @customer_id IS NOT NULL AND @customer_id > 0 
			SET @sql = @sql + ' AND cp.customer_id = @customer_id';

				
	SET @sql = @sql + ' ORDER BY ' + CASE
				WHEN @OrderBy = 'Name' 		THEN 'cp.payment_title '
				WHEN @OrderBy = 'Id'   		THEN 'cp.payment_id '
				WHEN @OrderBy = 'CustName'	THEN 'cc.customer_name '
				WHEN @OrderBy = 'date' 		THEN 'cp.payment_due_date '
				WHEN @OrderBy = 'Amount' 	THEN 'cp.payment_amount '
				ELSE 'cp.payment_id ' END + CASE WHEN @ascOrDesc IN ('asc','desc') THEN @ascOrDesc ELSE 'ASC' END


	print @sql
	--EXEC(@sql)
	exec sp_executesql @sql, @params, 
			@client_id = @client_id, @PaymentTitle = @PaymentTitle, @PaidUnPaid = @PaidUnPaid, @StartDate = @StartDate, @EndDate = @EndDate , @customer_id = @customer_id

END