DROP PROCEDURE IF EXISTS UpdateClientCustomer
go
CREATE PROCEDURE UpdateClientCustomer(
@package_id		INT,
@package_name	VARCHAR(40),
@package_price	decimal,
@package_status	CHAR(1) = 'Y',
@client_id		INT,
)
AS
BEGIN 

	UPDATE client_packages SET 
	package_name = @package_name ,package_price = @package_price,
	package_status = @package_status,client_id = @client_id
	WHERE package_id = @package_id and client_id = @client_id;
	
	
	SELECT package_id,package_name,package_price,package_status,client_id
	FROM client_packages WHERE package_id = @package_id and client_id = @client_id;

END
GO