DROP PROCEDURE IF EXISTS SelectClient
go
CREATE PROCEDURE SelectClient(
@client_id			INT
AS
BEGIN 

	SELECT client_name, client_username, client_password, client_mobilenum, client_status
	FROM clients
	WHERE client_id = @client_id;

END
GO