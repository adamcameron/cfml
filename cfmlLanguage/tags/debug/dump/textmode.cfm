<cfscript>
	q = queryNew("col1,col2");
	queryAddRow(q);
	querySetCell(q, "col1", "value1");
	querySetCell(q, "col2", "value2");
	
	st = {
		simple	= "simple",
		struct1	= {
			simple1	= "value1",
			simple2	= "value2",
			struct2	= {
				simple4	= "value4"
			}
		},
		array	= ["one", "two", "three"],
		query	= q
	};
</cfscript>


<cfdump var="#st#">
<hr />
<cfdump var="#st#" format="text">
<hr />
	

