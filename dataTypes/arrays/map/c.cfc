<cfcomponent>

	<cfset variables.a = listToArray("alpha,bravo,charlie,delta,echo,foxtrot")>
	
	<cffunction name="getA">
		<cfreturn variables.a>
	</cffunction>
	
</cfcomponent>