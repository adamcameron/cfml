<cfsetting showdebugoutput="no">
<cfscript>
	function structBuild(){
		return arguments;
	}
	o = createObject("component", "cfml");
	q = queryNew("simple,struct,query,cfc,xml");
	for (i=1; i le 1; i=i+1){
		queryAddRow(q);
		querySetCell(q, "simple",i);
		querySetCell(q, "struct", structBuild(foo=i, bar="geln"));
		querySetCell(q, "query", queryNew("col1,col2,col3"));
		querySetCell(q, "cfc", o);
	}

</cfscript>
<cfdump var="#valueList(q.struct)#"><br /><br />
<cfdump var="#valueList(q.query)#"><br /><br />
<cfdump var="#valueList(q.cfc)#"><br /><br />

<cfdump var="#q#" expand="no"> 
