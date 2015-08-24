<cfscript>
    bar = QueryNew( 'a' );
    QueryAddRow( bar );
    QuerySetCell( bar , 'a' , 'b' );
</cfscript>
<cfquery dbtype="query" name="foo">
    SELECT
        <cfqueryparam cfsqltype="cf_sql_numeric" value="20150817112756892"> AS num,
        20150817112756892 AS inline
    FROM bar
</cfquery>
<cfdump var="#foo#">