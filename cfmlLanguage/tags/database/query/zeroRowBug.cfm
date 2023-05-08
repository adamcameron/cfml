<cfset dsn = "scratch">
<!---
<!--- Set up a test table --->
<cfquery name="createTestTable" datasource="#dsn#">
     CREATE TABLE test_numbers(number INTEGER, otherNumber INTEGER);
</cfquery>
<!--- Add some test data --->
<cfquery name="addTestData" datasource="#dsn#">
     INSERT INTO test_numbers VALUES (<cfqueryparam value="1" cfsqltype="cf_sql_integer">, <cfqueryparam null="true">);
</cfquery>
--->
<!--- This is the dodgy query --->
<cfquery result="st" datasource="#dsn#" name="dodgyQuery">
     SELECT number AS dummy
     FROM test_numbers
     GROUP BY number
     HAVING COUNT(otherNumber) = 1
</cfquery>

<cftry>
	<cfdump var="#dodgyQuery#" label="dodgyQuery">
	<cfcatch>
		<cfdump var="#st#" label="st">
		<cfdump var="#cfcatch#" label="cfcatch">
	</cfcatch>
</cftry>