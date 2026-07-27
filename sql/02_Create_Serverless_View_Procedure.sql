USE gold_db;
GO

CREATE OR ALTER PROC CreateSQLServerlessView_gold
    @ViewName NVARCHAR(100)
AS
BEGIN

    DECLARE @statement NVARCHAR(MAX);

    SET @statement = N'
    CREATE OR ALTER VIEW ' + QUOTENAME(@ViewName) + N' AS
    SELECT *
    FROM OPENROWSET(
        BULK ''https://projectadlsgen2demo0506.dfs.core.windows.net/gold/' + @ViewName + ''',
        FORMAT = ''DELTA''
    ) AS [result];
    ';

    EXEC sp_executesql @statement;

END;
GO
