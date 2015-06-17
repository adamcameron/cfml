<cfscript>
	q = queryNew("letter");
	for (i=1; i le 10; i=i+1){
		queryAddRow(q);
		querySetCell(q, "letter", chr(64+i));
	}
</cfscript>
<cfset done = 1>
<cfoutput query="q">
	<cfif letter eq "E" and done le 3>
		duplicating 'E'<br />
		<cfset q.previous()>
		<cfset done=done+1>
		<cfif done eq 3>
			<cfset q.next()>
		</cfif>
	<cfelse>
		#letter#<br />
	</cfif>
</cfoutput>
