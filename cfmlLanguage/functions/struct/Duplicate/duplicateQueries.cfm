<cfscript>
	function structBuild() {return arguments;}
	s = structBuild(first="Adam", last="Cameron");
	
	q1 = queryNew("structData,stringData");
	queryAddRow(q1);
	querySetCell(q1, "structData", s);
	querySetCell(q1, "stringData", "Fat");
	
	q2 = duplicate(q1);
	q2.structData[1].first = "Dave";
	q2.structData[1].last = "Lobb";
	querySetCell(q2, "stringData", "Ordinary");
</cfscript>
<cfdump var="#q1#">