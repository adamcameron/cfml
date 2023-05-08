<cfform method="post" action="#CGI.script_name#">
	<cfinput type="text" name="myDate" validate="date" value="" />
	<cfinput type="submit" name="btnSubmit" value="Submit" />
</cfform>

<cfif structKeyExists(form, "fieldNames")>
	<cfdump var="#form#">

	<cfoutput>
	isDate("#form.myDate#"): #isDate("#form.myDate#")#<br />
	parseDateTime("#form.myDate#"): #parseDateTime("#form.myDate#")#<br />
	</cfoutput>
</cfif>