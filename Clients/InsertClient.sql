DROP PROCEDURE IF EXISTS InsertClient
GO

CREATE PROCEDURE InsertClient
(
	@client_name		varchar(60),
	@client_username	varchar(20),
	@client_password	varchar(15),
	@client_mobilenum	varchar(15),
	@client_status		char(1)
)
AS
BEGIN 

	INSERT INTO clients(client_name, client_username, client_password, client_mobilenum, client_status)
	SELECT 	 @client_name
			,@client_username
			,@client_password
			,@client_mobilenum
			,@client_status

	
	SELECT SCOPE_IDENTITY()

END