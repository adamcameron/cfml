<cfsavecontent variable="sqlStatement">
	select	*
	from	tbl_seuss
	where	col1	= '##col1Var##'
	and		col2	= '##col2Var##'
</cfsavecontent>

<cfscript>
	tbl_seuss = queryNew("col1,col2");
	queryAddRow(tbl_seuss); querySetCell(tbl_seuss, "col1", "one"); querySetCell(tbl_seuss, "col1", "fish");
	queryAddRow(tbl_seuss); querySetCell(tbl_seuss, "col1", "two"); querySetCell(tbl_seuss, "col1", "fish");
	queryAddRow(tbl_seuss); querySetCell(tbl_seuss, "col1", "red"); querySetCell(tbl_seuss, "col1", "fish");
	queryAddRow(tbl_seuss); querySetCell(tbl_seuss, "col1", "blue"); querySetCell(tbl_seuss, "col1", "fish");
</cfscript>


<cfset col1Var = "one">
<cfset col2Var = "fish">

<cfset sqlStatement = evaluate(DE(sqlStatement))>
<cfquery name="q" result="st" dbtype="query">
	#preserveSingleQuotes(sqlStatement)#
</cfquery>
<cfdump var="#q#">
<cfdump var="#st#">
