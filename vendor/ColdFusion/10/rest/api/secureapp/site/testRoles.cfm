<cfoutput>
Current User: #getAuthUser()#<br />
Current Roles: #getUserRoles()#<br />
<hr />
<cfset o = new shared.CF10.rest.secureapp.api.SecureTest()>
	
<cftry>
	Executing needsAdminAccess(): #o.needsAdminAccess()#<br />
	<cfcatch>
		Exception:<br />
		#cfcatch.message#<br />
		#cfcatch.detail#<br />
	</cfcatch>
</cftry>
<hr />
	
<cftry>
	Executing needsWriteAccess(): #o.needsWriteAccess()#<br />
	<cfcatch>
		Exception:<br />
		#cfcatch.message#<br />
		#cfcatch.detail#<br />
	</cfcatch>
</cftry>
<hr />
	
<cftry>
	Executing needsReadAccess(): #o.needsReadAccess()#<br />
	<cfcatch>
		Exception:<br />
		#cfcatch.message#<br />
		#cfcatch.detail#<br />
	</cfcatch>
</cftry>
<hr />
	
<cftry>
	Executing doesNotNeedAccess(): #o.doesNotNeedAccess()#<br />
	<cfcatch>
		Exception:<br />
		#cfcatch.message#<br />
		#cfcatch.detail#<br />
	</cfcatch>
</cftry>
<hr />

</cfoutput>