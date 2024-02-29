USE [Billing_Information]
GO
/****** Object:  StoredProcedure [dbo].[SelectAllExpendituresDisplay]    Script Date: 29/02/2024 4:44:34 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[SelectAllExpendituresDisplay](
@client_id INT
)
as
begin
	SELECT expenditure_id, client_id ,expenditure_title ,expenditure_details ,expenditure_type ,
						expenditure_amount ,CONVERT(varchar(20), expenditure_date, 20) as expenditure_date ,expenditure_status
	FROM client_expenditures
	where client_id = @client_id
end