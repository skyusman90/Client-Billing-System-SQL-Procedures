DROP PROCEDURE IF EXISTS UpdateClientStatus
go
CREATE PROCEDURE UpdateClientStatus(
@ListOfclient_ids	VARCHAR(2000),
@client_status	char(1) = 'Y'
)
AS
BEGIN 

	UPDATE clients SET
	client_status = @client_status
	WHERE
	client_id IN (
	
		SELECT CAST(a.value as INT) as client_id from string_split(@ListOfclient_ids,',') a
	
	);
	
	SELECT client_name, client_username, client_password, client_mobilenum, client_status
	FROM clients
	WHERE client_id IN (
	
		SELECT CAST(a.value as INT) as client_id from string_split(@ListOfclient_ids,',') a
	
	);

END
GO