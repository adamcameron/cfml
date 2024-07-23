<cfset dsn = "scratch_mssql">

<cfif structKeyExists(form, "btnSubmit")>
	<cfif form.btnSubmit EQ "ADD">
		<cfinsert tablename="tbl_test" datasource="#dsn#" formfields="tst_data">
	<cfelseif form.btnSubmit EQ "UPDATE">
		<cfupdate tablename="tbl_test" datasource="#dsn#" formfields="tst_id,tst_data">
	</cfif>
</cfif>
<cfquery name="q" datasource="#dsn#">
	SELECT		tst_id, tst_data 
	FROM		tbl_test
	ORDER BY	tst_id
</cfquery>

<!--- ADD A NEW ONE --->
<form method="post">
	<input type="text" name="tst_data" value="" />
	<input type="submit" name="btnSubmit" value="Add" />
</form>
<hr />
<!---UDPATE THE EXISTING ONES --->
<cfloop query="q">
	<form method="post">
		<cfoutput>
			<input type="hidden" name="tst_id" value="#tst_id#" />
			<input type="text" name="tst_data" value="#tst_data#" />
		</cfoutput>
		<input type="submit" name="btnSubmit" value="Update" />
	</form>
	<hr />	
</cfloop>
