<cffunction name="safeDomainName" access="remote" returntype="string" hint="I accept a string and return a safe NT Folder or File name.">
	<cfargument name="inString" required="Yes" type="string" />
	<cfargument name="allowSpaceChar" default="false" required="No" />
	
	<!--- if the first character is numeric, prepend with an underscore --->
	<cfif ISNUMERIC(MID(arguments.inString,1,1))>
		<cfset arguments.inString = "_"&arguments.inString />
	</cfif>
	
	<cfif arguments.allowSpaceChar>
		<cfreturn REReplace(arguments.inString,"[^_0-9A-Za-z ]","","all") />
	</cfif>
	
	<cfreturn REReplace(arguments.inString,"[^_0-9A-Za-z]","","all") />
</cffunction>

<cfoutput>
	#safeDomainName("!£$%&()")#
</cfoutput>