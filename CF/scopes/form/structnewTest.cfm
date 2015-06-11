<cfif structKeyExists(form, "fieldNames")>
	<cfdump var="#form#" label="Before">
	<cftry>
		<cfset form = structNew()>
		<cfdump var="#form#" label="After structNew()">
		<cfdump var="#variables#" label="Variables after structNew()">
		<cftry>
			<cfset structClear(form)>
			<cfdump var="#form#" label="After structClear()">
			
			<cfcatch>
				Error with structnew() <cfoutput>[#cfcatch.message#][#cfcatch.detail#]</cfoutput><br />
			</cfcatch>
		</cftry>
		<cfcatch>
			Error with structnew() <cfoutput>[#cfcatch.message#][#cfcatch.detail#]</cfoutput><br />
		</cfcatch>
	</cftry>
</cfif>

<form method="post">
	<input type="text" name="txt1" value="" />
	<input type="submit" name="btnSubmit" value="Submit &raquo;" />
</form>
