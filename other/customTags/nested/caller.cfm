<cfscript>
	q = queryNew("");
	queryAddColumn(q, "id", listToArray("1,2,3,4"));
	queryAddColumn(q, "english", listToArray("one,two,three,four"));
	queryAddColumn(q, "maori", listToArray("tahi,rua,toru,wha"));
</cfscript>

<cf_outer query="#q#" index="i">
	<cf_inner column="id" />
	<cf_inner column="english" />
	<cf_inner column="maori" />
</cf_outer>
