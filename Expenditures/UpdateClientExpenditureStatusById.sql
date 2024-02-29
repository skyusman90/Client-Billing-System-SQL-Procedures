DROP PROCEDURE IF EXISTS UpdatePaymentStatusById
GO

CREATE PROCEDURE UpdatePaymentStatusById(
@ListOfexpenditure_ids	VARCHAR(2000),
@expenditure_status		char(1) = 'Y',
@client_id				INT
)
AS
BEGIN 

	UPDATE client_expenditures SET
	expenditure_status = @expenditure_status
	WHERE
	expenditure_id IN (
	
		SELECT CAST(a.value as INT) as expenditure_id from string_split(@ListOfexpenditure_ids,',') a
	
	)
	and client_id = @client_id
	;
	
	SELECT expenditure_id, client_id ,expenditure_title ,expenditure_details ,expenditure_type ,
			expenditure_amount ,expenditure_date ,expenditure_status
	FROM client_expenditures
	
	WHERE expenditure_id IN (
	
		SELECT CAST(a.value as INT) as expenditure_id from string_split(@ListOfexpenditure_ids,',') a
	
	)
	and client_id = @client_id
	;

END