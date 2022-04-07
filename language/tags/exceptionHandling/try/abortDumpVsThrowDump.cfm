<cftry>
	<cfthrow message="message only">
	<cfcatch>
		<cfdump var="#cfcatch#" label="#cfcatch.getClass().getName()#">
	</cfcatch>
</cftry>
<hr />
<cftry>
	<cfthrow message="message: message and detail" detail="detail: message and detail">
	<cfcatch>
		<cfdump var="#cfcatch#" label="#cfcatch.getClass().getName()#">
	</cfcatch>
</cftry>
<hr />
<cftry>
	<cfthrow message="message: message, detail and type" detail="detail: message, detail and type" type="throwType">
	<cfcatch>
		<cfdump var="#cfcatch#" label="#cfcatch.getClass().getName()#">
	</cfcatch>
</cftry>
<hr />
<cftry>
	<cfthrow message="message: message, detail, type and errorcode" detail="detail: message, detail, type and errorcode" type="throwType" errorcode="throwErrorCode">
	<cfcatch>
		<cfdump var="#cfcatch#" label="#cfcatch.getClass().getName()#">
	</cfcatch>
</cftry>
<hr />
<cftry>
	<cfthrow message="message: message, detail, type, errorcode and extendedinfo" detail="detail: message, detail, type, errorcode and extendedinfo" type="throwType" errorcode="throwErrorCode" extendedinfo="throwExtendedInfo">
	<cfcatch>
		<cfdump var="#cfcatch#" label="#cfcatch.getClass().getName()#">
	</cfcatch>
</cftry>
<hr />
<cftry>
	<cfabort showerror="abort showerror">
	<cfcatch>
		<cfdump var="#cfcatch#" label="#cfcatch.getClass().getName()#">
	</cfcatch>
</cftry>
<hr />
<cftry>
	<cfset oE = createObject("java", "java.lang.Exception").init()>
	<cfthrow object="#oE#">
	<cfcatch>
		<cfdump var="#cfcatch#" label="#cfcatch.getClass().getName()#">
	</cfcatch>
</cftry>
<hr />