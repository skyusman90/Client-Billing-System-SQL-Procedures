USE [Billing_Information]
GO
/****** Object:  StoredProcedure [dbo].[SelectAllClientCustomer]    Script Date: 29/02/2024 4:37:46 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectAllClientCustomer](
@client_id			INT,
@CustomerNameSearch	varchar(50) = '',
@activeInactive		char(1) = 'A',
@orderBy			varchar(20) = 'Name',
@ascOrDesc			varchar(4) = 'ASC'
)
AS
BEGIN 

	DECLARE @sql nvarchar(max) = ''
	DECLARE @params NVARCHAR(4000) = N'@client_id INT, @activeInactive char(1),@CustomerNameSearch varchar(50)'

	SET @sql = 'SELECT customer_id,customer_id_external, client_id, customer_name, customer_user_name, customer_cnic, cusotmer_mobilenum, 
							customer_address, package_id, customer_due_day, CONVERT(varchar(10), join_date, 20)as join_date, customer_status,
							(SELECT ISNULL(SUM(payment_amount),0) from customer_payments(nolock) cp WHERE cp.customer_id =  client_customers.customer_id and cp.client_id = @client_id AND payment_status = ''N'') as TotalPaymentDue
				FROM client_customers
				WHERE 1 = 1
				AND client_id = @client_id'

	IF @activeInactive IS NOT NULL and @activeInactive IN ('N','Y')
		SET @sql = @sql + ' AND customer_status = @activeInactive';
	
	IF @CustomerNameSearch IS NOT NULL and LEN(@CustomerNameSearch) > 0
		SET @sql = @sql + ' AND customer_name LIKE ''%'' + @CustomerNameSearch + ''%'' ';

	IF @ascOrDesc = 'DESC'
		BEGIN
				SET @sql = @sql + ' ORDER BY ' + CASE
							WHEN @OrderBy = 'Name' THEN 'customer_name'
							WHEN @OrderBy = 'Id'   THEN 'customer_id'
							WHEN @OrderBy = 'date' THEN 'join_date'
							ELSE 'customer_id' END + ' desc'
		END
	ELSE
		BEGIN
				SET @sql = @sql + ' ORDER BY ' + CASE
							WHEN @OrderBy = 'Name' THEN 'customer_name'
							WHEN @OrderBy = 'Id'   THEN 'customer_id'
							WHEN @OrderBy = 'date' THEN 'join_date'
							ELSE 'customer_id' END + ' asc'
		END 
	END

	--EXEC(@sql)
	exec sp_executesql @sql, @params, @client_id = @client_id, @activeInactive = @activeInactive, @CustomerNameSearch = @CustomerNameSearch


