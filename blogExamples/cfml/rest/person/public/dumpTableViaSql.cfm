<!--- dumpTableViaSql.cfm --->
	
<cfdbinfo type="columns" table="person" name="personTable">
<cfscript>
writeDump(var=personTable);
people = queryExecute("SELECT * FROM person");
writeDump(var=people);
</cfscript>