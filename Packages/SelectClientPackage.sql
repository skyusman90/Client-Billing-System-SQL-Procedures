DROP PROCEDURE IF EXISTS SelectClientPackage
go
CREATE PROCEDURE SelectClientPackage(
@package_id		INT,
@client_id		INT,
)
AS
BEGIN 

	
	SELECT package_id,package_name,package_price,package_status,client_id
	FROM client_packages WHERE package_id = @package_id and client_id = @client_id;
	
END
GO