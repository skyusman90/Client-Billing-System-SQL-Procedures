DROP PROCEDURE IF EXISTS UpdateClient
go
CREATE PROCEDURE UpdateClient(
@client_id			INT,
@client_name		varchar(60),
@client_username	varchar(20),
@client_password	varchar(15),
@client_mobilenum	varchar(15),
@client_status		char(1)
)
AS
BEGIN 

	UPDATE clients SET
	client_name       = @client_name     
	client_username   = @client_username 
	client_password   = @client_password 
	client_mobilenum  = @client_mobilenum
	client_status     = @client_status   
	WHERE client_id = @client_id;
	
	
	SELECT client_name, client_username, client_password, client_mobilenum, client_status
	FROM clients
	WHERE client_id = @client_id;

END
GO