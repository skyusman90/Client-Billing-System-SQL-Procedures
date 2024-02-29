DROP PROCEDURE IF EXISTS InsertClientPackages
go
CREATE PROCEDURE InsertClientPackages(
@package_name	VARCHAR(40),
@package_price	decimal,
@package_status	CHAR(1) = 'Y',
@client_id		INT,
)
AS
BEGIN 

	INSERT INTO client_packages(package_name,package_price,package_status,client_id)
	SELECT @package_name,@package_price,@package_status,@client_id
	
	SELECT SCOPE_IDENTITY()

END
GO