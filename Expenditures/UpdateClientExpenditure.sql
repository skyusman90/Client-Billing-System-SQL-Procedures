DROP PROCEDURE IF EXISTS UpdateClientExpenditure
go
CREATE PROCEDURE UpdateClientExpenditure(
@expenditure_id		 INT,
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

	UPDATE client_expenditures SET 
	expenditure_title   = @expenditure_title  ,
	expenditure_details = @expenditure_details,
	expenditure_type    = @expenditure_type   ,
	expenditure_amount  = @expenditure_amount ,
	expenditure_date    = @expenditure_date   ,
	expenditure_status  = @expenditure_status 
	
	WHERE expenditure_id = @expenditure_id AND client_id = @client_id;
	
	SELECT expenditure_id, client_id ,expenditure_title ,expenditure_details ,expenditure_type ,
			expenditure_amount ,expenditure_date ,expenditure_status
	FROM client_expenditures 
	WHERE expenditure_id = @expenditure_id AND client_id = @client_id;


END
GO