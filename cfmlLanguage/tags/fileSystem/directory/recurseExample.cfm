<cfset deleteDir(dir="C:\temp\deleteme2")>

<!--- this code is not tested, and I banged it in in about 3min, so treat
it like pseudo-code --->
<cffunction name="deleteDir">
	<cfargument name="dir">

	<cfset var qDir = false>
	<cfset var sPath = "">

	<cfdirectory action="list" directory="#arguments.dir#" name="qDir">
	<cfloop query="qDir">
		<cfset sPath = arguments.dir & "/" & name><!--- one probably should horsearound a bit here to make sure the slashes aren't duplicated --->

		<cfif type eq "dir">
			<!--- this will get rid of all subdirs and their contents --->
			<cfset deleteDir(dir=sPath)>
		<cfelse>
			<cffile action="delete" file="#sPath#">
		</cfif>
		<!--- all child files/dirs are gone.  Delete self. --->
	</cfloop>
	<cfdirectory action="delete" directory="#arguments.dir#">
</cffunction>