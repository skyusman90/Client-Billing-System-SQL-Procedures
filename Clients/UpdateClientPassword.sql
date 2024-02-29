DROP PROCEDURE IF EXISTS UpdateClientPassword
go
CREATE PROCEDURE UpdateClientPassword(
@client_id				INT,
@client_username		varchar(20),
@client_new_password	varchar(15),
@client_old_password	varchar(15)
)
AS
BEGIN 

	UPDATE clients SET   
	client_password   = @client_new_password 
	WHERE client_id = @client_id
	AND client_username = @client_username AND client_password = @client_old_password;
	
	
	SELECT client_name, client_username, client_password, client_mobilenum, client_status
	FROM clients
	WHERE client_id = @client_id;

END
GO