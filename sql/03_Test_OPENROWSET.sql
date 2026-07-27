SELECT TOP 10 *
FROM OPENROWSET(
    BULK 'https://projectadlsgen2demo0506.dfs.core.windows.net/gold/Product/',
    FORMAT='DELTA'
) AS rows;
