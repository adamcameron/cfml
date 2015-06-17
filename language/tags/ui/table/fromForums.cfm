<cfscript>
	get_customers = queryNew("cus_code,cus_lname,cus_fname,cus_initial,cus_areacode");
	for (i=1; i <= 5; i++){
		queryAddRow(get_customers);
		querySetCell(get_customers, "cus_code", "cus_code#i#");
		querySetCell(get_customers, "cus_lname", "lname#i#");
		querySetCell(get_customers, "cus_fname", "fname#i#");
		querySetCell(get_customers, "cus_initial", "initial#i#");
		querySetCell(get_customers, "cus_areacode", "areacode#i#");
	}
</cfscript>

<html>
<head>
<title>customer list</title>
</head>

<body>

<h1>customer list</h1>

<cfoutput>
your query returned #get_customers.recordcount# records
</cfoutput>
<tr>
<cftable query="get_customers" colheaders="true" htmltable="true">
<cfcol header="<b>code</b>" width="8" text="#cus_code#">
<cfcol header="<b>last_name</b>" width="15" text="#cus_lname#">
<cfcol header="<b>first_name</b>" width="15" text="#cus_fname#">
<cfcol header="<b>initial</b>" width="8" text="#cus_initial#">
<cfcol header="<b>area_code</b>" width="10" text="#cus_areacode#">
</cftable>
</tr>
</body>
</html>