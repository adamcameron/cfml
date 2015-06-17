<cftransaction>
<cfset o1 = createObject("java", "coldfusion.tagext.sql.TransactionTag")>
<cfset t = o1.getCurrent()>
<cfdump var="#variables#">
<cfabort>
	<cfdump var="#getPageContext()#" expand="false">
	<cfquery name="users" datasource="scratch_mysql" result="st">
		SELECT * FROM t_users
	</cfquery>
	<cfdump var="#getMetadata(users)#">
	<cfdump var="#st#">
</cftransaction>
