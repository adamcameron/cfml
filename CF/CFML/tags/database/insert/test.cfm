<form method="post">
	<input type="text" name="tst_data" value="" />
	<input type="submit" name="btnSubmit" value="Insert" />
</form>
	
<cfif structKeyExists(form, "tst_data")>
	<!---chuck it into the DB --->
	<cfinsert tablename="tbl_test" datasource="scratch_mysql" formfields="tst_data">
	
	<!--- make sure it went in --->
	<cfquery name="q" datasource="scratch_mysql">
		SELECT		*
		FROM		tbl_test
		ORDER BY	tst_id DESC
		LIMIT		1
	</cfquery>
	<cfdump var="#q#">
</cfif>