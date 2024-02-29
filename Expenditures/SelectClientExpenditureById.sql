DROP PROCEDURE IF EXISTS SelectClientExpenditureById
go
CREATE PROCEDURE SelectClientExpenditureById(
@expenditure_id INT,
@client_id  	INT
)
BEGIN 

	SELECT expenditure_id, client_id ,expenditure_title ,expenditure_details ,expenditure_type ,
			expenditure_amount ,expenditure_date ,expenditure_status
	FROM client_expenditures 
	WHERE expenditure_id = @expenditure_id AND client_id = @client_id;


END