<cffunction name="listContainsAnyOf" access="public" output="false" returntype="boolean"
	hint="This method will look into the items in 2 lists to see if they have at least one value in common.">
	<cfargument name="list1" required="true" />
	<cfargument name="list2" required="true" />

	<cfset var atLeastOneMatch = false />
	<cfset var index = 0 />

	<cfloop list="#arguments.list1#" index="index">
		<cfif ListFindNoCase(arguments.list2, index)>
			<cfset atLeastOneMatch = true />
			<cfbreak />
		</cfif>
	</cfloop>
	<cfreturn atLeastOneMatch />
</cffunction>

<cfset mySiblings = "John,Mary,James,Mark" />
<cfset yourSiblings = "Stacy,Sue,Adam,Matthew,Mary" />

<cfif listContainsAnyOf(mySiblings, yourSiblings)>
Yup, at least one of our siblings has the same name.
</cfif>