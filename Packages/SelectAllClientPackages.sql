DROP PROCEDURE IF EXISTS SelectAllClientPackages
go
CREATE PROCEDURE SelectAllClientPackages(
@client_id			INT,
@PackageNameSearch	varchar(20) = '',
@activeInactive		char(1) = 'A',
@orderBy			varchar(20) = 'Name',
@ascOrDesc			varchar(4) = 'ASC'
)
AS
BEGIN 

DECLARE @sql varchar(max) = ''

SET @sql = 'SELECT package_id,package_name,package_price,package_status,client_id
			FROM client_packages
			WHERE 1 = 1
			AND package_status = ' + CASE WHEN @activeInactive = 'N' THEN '''N''' WHEN @activeInactive = 'Y' THEN '''Y''' ELSE 'package_status' END + '
			AND package_name LIKE ''%' + @CustomerNameSearch + '%''
			AND client_id = ' + cast(@client_id as varchar)

IF @ascOrDesc = 'DESC'
	BEGIN
			SET @sql = @sql + ' ORDER BY ' + CASE
						WHEN @OrderBy = 'Name' THEN 'package_name'
						WHEN @OrderBy = 'Id'   THEN 'package_id'
						WHEN @OrderBy = 'Price' THEN 'package_price'
						ELSE 'package_id' END + ' desc'
	END
ELSE
	BEGIN
			SET @sql = @sql + ' ORDER BY ' + CASE
						WHEN @OrderBy = 'Name' THEN 'package_name'
						WHEN @OrderBy = 'Id'   THEN 'package_id'
						WHEN @OrderBy = 'Price' THEN 'package_price'
						ELSE 'package_id' END + ' asc'
	END 
END

	EXEC(@sql)

GO