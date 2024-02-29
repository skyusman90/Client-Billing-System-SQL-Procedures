DROP PROCEDURE IF EXISTS UpdateCustomersStatus
go
CREATE PROCEDURE UpdatePackageStatus(
@ListOfPackage_ids	VARCHAR(2000),
@package_status		char(1) = 'Y',
@client_id			INT
)
AS
BEGIN 

	UPDATE client_packages SET
	package_status = @package_status
	WHERE
	package_id IN (
	
		SELECT CAST(a.value as INT) as package_id from string_split(@ListOfPackage_ids,',') a
	
	) and client_id = @client_id;
	
	SELECT package_id,package_name,package_price,package_status,client_id
	FROM client_packages
	WHERE package_id IN (
	
		SELECT CAST(a.value as INT) as package_id from string_split(@ListOfPackage_ids,',') a
	
	)
	and client_id = @client_id
	;

END
GO