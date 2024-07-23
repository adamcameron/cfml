<cfscript>
	// mock-up some data
	q = queryNew("id,firstName,lastName");
	queryAddRow(q);	querySetCell(q, "id", 1); querySetCell(q, "firstName", "Adam");  querySetCell(q, "lastName", "Cameron");
	queryAddRow(q);	querySetCell(q, "id", 2); querySetCell(q, "firstName", "Jane");  querySetCell(q, "lastName", "Smith");
	queryAddRow(q);	querySetCell(q, "id", 3); querySetCell(q, "firstName", "Bob");  querySetCell(q, "lastName", "Brown");
	queryAddRow(q);	querySetCell(q, "id", 3); querySetCell(q, "firstName", "Sarah");  querySetCell(q, "lastName", "Williams");
</cfscript>

<cfform method="post" action="#CGI.script_name#" format="flash">
	<cfformgroup type="tabnavigator">
		<cfformgroup type="page" label="Grid Tab">
			<cfgrid name="myGrid" format="Flash" query="q" selectmode="edit"/>
		</cfformgroup>
		<cfformgroup type="page" label="Another Tab">
			<cfinput type="text" name="someText" />
		</cfformgroup>
	</cfformgroup>

	<cfinput type="submit" name="submit" value="Submit" />
</cfform>

<cfif structKeyExists(form, "fieldNames")>
	<cfdump var="#form#">
</cfif>
