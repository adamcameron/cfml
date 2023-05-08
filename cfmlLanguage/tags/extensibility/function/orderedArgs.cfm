<cffunction name="f" output="true">
	<cfset var key = "">
	<cfloop collection="#arguments#" item="key">
		<cfoutput>arguments[#key#] = #arguments[key]#<br /></cfoutput>
	</cfloop>
</cffunction>

<cfset f("Adam", "Cameron", 123, true)>