<cfcomponent>

	<cffunction name="doQ">
		<cfset var q = queryNew("")>
		<cfquery name="q" datasource="gbc_straker">
			select	*
			from	circuits
			<cfset qp()>
		</cfquery>
		<cfreturn q>
	</cffunction>
	
	<cffunction name="qp">
		where circuit_title like <cfqueryparam value="%a%">
	</cffunction>

</cfcomponent>