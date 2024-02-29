DROP PROCEDURE IF EXISTS SelectAllClientExpenditures
go
CREATE PROCEDURE SelectAllClientExpenditures(
@client_id		INT,
@exp_title		varchar(100) = '',
@PaidUnPaid		char(1) = 'A',
@orderBy		varchar(20) = 'Name',
@ascOrDesc		varchar(4) = 'ASC',
@StartDate		DATE = NULL,
@EndDate		DATE = NULL
)
AS
BEGIN 

	DECLARE @sql nvarchar(max) = ''
	DECLARE @params NVARCHAR(4000) = N'@client_id INT, @PaidUnPaid char(1),@exp_title varchar(100), @StartDate DATE, @EndDate DATE'

	SET @sql = 'SELECT expenditure_id, client_id ,expenditure_title ,expenditure_details ,expenditure_type ,
						expenditure_amount ,expenditure_date ,expenditure_status
				FROM client_expenditures 
				WHERE 1 = 1				
				AND client_id = @client_id'
				
	IF @PaidUnPaid IS NOT NULL and @PaidUnPaid IN ('N','Y')
		SET @sql = @sql + ' AND expenditure_status = @PaidUnPaid';
	
	IF @exp_title IS NOT NULL and LEN(@exp_title) > 0
		SET @sql = @sql + ' AND expenditure_title LIKE ''%'' + @exp_title + ''%'' ';

				
	IF @StartDate IS NOT NULL AND @EndDate IS NOT NULL 
			SET @sql = @sql + ' AND expenditure_date between @StartDate AND @EndDate ';


				
	SET @sql = @sql + ' ORDER BY ' + CASE
				WHEN @OrderBy = 'Name' 		THEN 'expenditure_title '
				WHEN @OrderBy = 'Id'   		THEN 'expenditure_id '
				WHEN @OrderBy = 'Type'		THEN 'expenditure_type '
				WHEN @OrderBy = 'date' 		THEN 'expenditure_date '
				WHEN @OrderBy = 'Amount' 	THEN 'expenditure_amount '
				ELSE 'expenditure_id ' END + CASE WHEN @ascOrDesc IN ('asc','desc') THEN @ascOrDesc ELSE 'ASC' END


	print @sql
	--EXEC(@sql)
	exec sp_executesql @sql, @params, 
			@client_id = @client_id, @exp_title = @exp_title, @PaidUnPaid = @PaidUnPaid, @StartDate = @StartDate, @EndDate = @EndDate

END