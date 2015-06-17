<cfscript>
	q = querynew("id,person");

	queryAddRow(q); querySetCell(q, "id", 1); querySetCell(q, "person", "Andrew");
	queryAddRow(q); querySetCell(q, "id", 2); querySetCell(q, "person", "Barbara");
	queryAddRow(q); querySetCell(q, "id", 3); //querySetCell(q, "person", "Charlie");
	queryAddRow(q); querySetCell(q, "id", 4); querySetCell(q, "person", "Debbie");

	testArray(array=q["person"].toArray());
	testArray(array=listToArray(valueList(q.person)));
</cfscript>


<cffunction name="testArray" output="true" returntype="void" access="public" hint="Takes a query column and loops over it as an array">
	<cfargument name="array" type="array" required="true" hint="Pass this a query column and see what happens.">

	<cfscript>
		var i = 0;

		for (i=1; i le arrayLen(arguments.array); i=i+1){
			writeoutput("[#i#][#arguments.array[i]#]<br />");
		}
		return;
	</cfscript>
</cffunction>