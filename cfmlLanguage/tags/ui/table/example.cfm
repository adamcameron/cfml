<style type="text/css">
	table {
		border: 1px solid black;
	}
</style>

<cfscript>
	q = queryNew("firstName,lastName,address,phone");
	queryAddRow(q);
	q.firstName[1] = "Adam";
	q.lastName[1] = "Cameron";
	q.address[1] = "London";
	q.phone[1] = "020 75551234";

	queryAddRow(q);
	q.firstName[2] = "Someone";
	q.lastName[2] = "Else";
	q.address[2] = "Auckland";
	q.phone[2] = "09 5551234";
</cfscript>

<cftable query="q" colHeaders="true" htmlTable="true">
<cfcol header="Column 1" text="#firstName#">
<cfcol header="Column 2" text="#lastName#">
<cfcol header="Column 3" text="#address#">
<cfcol header="Column 4" text="#phone#">
</cftable>