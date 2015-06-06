<cffunction name="directoryCopy" output="false" returntype="void">
	<cfargument name="source" required="true" type="string">
	<cfargument name="destination" required="true" type="string">
	<cfargument name="ignore" required="false" type="string" default="">

	<cfset var contents = "">
	
	<cfif not(directoryExists(arguments.destination))>
		<cfdirectory action="create" directory="#arguments.destination#">
	</cfif>
	
	<cfdirectory action="list" directory="#arguments.source#" name="contents">

	<cfif len(arguments.ignore)>
		<cfquery dbtype="query" name="contents">
		select * from contents where name not in(#ListQualify(arguments.ignore, "'")#)
		</cfquery>
	</cfif>
	
	<cfloop query="contents">
		<cfif contents.type eq "file">
			<cffile action="copy" source="#arguments.source#/#name#" destination="#arguments.destination#/#name#">
		<cfelseif contents.type eq "dir">
			<cfset directoryCopy(arguments.source & "/" & name, arguments.destination & "/" & name)>
		</cfif>
	</cfloop>
</cffunction>

<cfset dir = getDirectoryFromPath(getCurrentTemplatePath())>
<cfset source = dir & "directoryCopySrc">
<cfset dest = dir & "directoryCopyDest">
<cfset directoryCopy2(source, dest, "", "makeunique")>