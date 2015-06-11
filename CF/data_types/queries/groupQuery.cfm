<cfscript>
	// make a test query

	q = queryNew("person,food");
	queryAddRow(q);	querySetCell(q, "person", "Adam"); querySetCell(q, "food", "Beer");
	queryAddRow(q);	querySetCell(q, "person", "Adam"); querySetCell(q, "food", "Pies");
	queryAddRow(q);	querySetCell(q, "person", "Adam"); querySetCell(q, "food", "Chips");

	// Paris is topical for me today (never mind why.  But it's not sordid)
	queryAddRow(q);	querySetCell(q, "person", "Paris Hilton"); querySetCell(q, "food", "Celery");
	queryAddRow(q);	querySetCell(q, "person", "Paris Hilton"); querySetCell(q, "food", "Mineral Water");
	queryAddRow(q);	querySetCell(q, "person", "Paris Hilton"); querySetCell(q, "food", "Sausages");	// ahem
</cfscript>

<cfoutput query="q" group="person">
	<!--- this will get hit for every change of the 'person' column --->
	Person: #person#<br />
	Favourite Food:
	<cfoutput>
		<!--- this will get hit for every record  --->
		#food#, 
	</cfoutput>
	<!--- this will get hit for every change of the 'person' column --->
	<br /><hr />
</cfoutput>