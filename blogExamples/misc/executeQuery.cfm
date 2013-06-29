<cfscript>
resultStruct = {};

recordset = executeQuery(
    sql                = "SELECT * FROM TABLE WHERE col1 = :param1 AND col2 = :param2",
    dsn                = "myDsn",
    maxrows            = 1,
    cachedwithin    = createTimespan(1,2,3,4),
    params            = [
        {name="param1", value="val1", type="varchar"},
        {name="param3", value=2, type="integer"}
    ],
    result            = resultStruct // passed by ref, so this will work
    // etc
);

recordset = executeQuery(
    sql                = "SELECT * FROM query1 UNION SELECT * FROM query2",
    dbtype            = "query",
    queries            = {query1=q1, query2=q2}
);

</cfscript>