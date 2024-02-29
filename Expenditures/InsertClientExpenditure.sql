DROP PROCEDURE IF EXISTS InsertClientExpenditure
go
CREATE PROCEDURE InsertClientExpenditure(
@client_id           INT,
@expenditure_title   VARCHAR(100),
@expenditure_details VARCHAR(1000),
@expenditure_type    VARCHAR(20),
@expenditure_amount  decimal,
@expenditure_date    DATE,
@expenditure_status  CHAR(1)
)
AS
BEGIN 

	INSERT INTO client_expenditures
			(
				client_id ,expenditure_title ,expenditure_details ,expenditure_type ,
				expenditure_amount ,expenditure_date ,expenditure_status
			)
	
	SELECT @client_id ,@expenditure_title ,@expenditure_details ,@expenditure_type ,
			@expenditure_amount ,@expenditure_date ,@expenditure_status
			
	
	SELECT SCOPE_IDENTITY()

END
GO