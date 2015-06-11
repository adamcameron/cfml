<cfscript>
	qOptions = queryNew("optId,optName","Integer,VarChar");
	queryAddRow(qOptions);	querySetCell(qOptions, "optId", 1); querySetCell(qOptions, "optName", "Red");
	queryAddRow(qOptions);	querySetCell(qOptions, "optId", 2); querySetCell(qOptions, "optName", "Green");
	queryAddRow(qOptions);	querySetCell(qOptions, "optId", 3); querySetCell(qOptions, "optName", "Blue");
</cfscript>

<cfform action="#cgi.script_name#" method="post" format="flash" name="frm1">
	<cfformgroup type="repeater" query="qOptions">
	 	<cfinput type="radio" name="options" value="{qOptions.currentItem.optId}" label="{qOptions.currentItem.optName}" /> 
	</cfformgroup>
</cfform>