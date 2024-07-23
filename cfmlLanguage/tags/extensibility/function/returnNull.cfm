<cffunction name="f" returntype="string">
	<cfargument name="doit" type="boolean">
	<cfif arguments.doit>
		<cfreturn "Done it">
	</cfif>
</cffunction>
<cfset s1 = f(doit=true)>
<cfset s2 = f(doit=false)>

<cfoutput>
	f(doit=true): [#s1#]<br />
	f(doit=false): [#s2#]<br />
</cfoutput>