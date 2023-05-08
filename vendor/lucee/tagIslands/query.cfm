<cfscript>
query name="getData" {
    ```
    <cfsavecontent variable="sql">
        SELECT * FROM test WHERE id =
    </cfsavecontent>
    ```
    writeOutput(sql)
    ```
    <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="101">
    ```
}
```<cfdump var="#getData#">```
</cfscript>
