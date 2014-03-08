<cfflush interval="16">
<cffunction name="deleteDirectoryContents" access="public" returntype="array" output="true" hint="Empties the file contents of a desired directory.">
	<cfargument name="dirPath" type="string" required="true" hint="An aboslute path that does not include a filename. Example: #exapandPath("./myfiles")#" />
	<cfargument name="dirFilter" type="string" required="false" default="" hint="File extension filter applied to returned names. Example: *.* for all files (no subdirectories), or *.cfm for all files with the cfm extension. Apply multiple patterns using a pipe '|'.  Example: *thisname*|*.txt" />
	<cfargument name="bRecurse" type="boolean" required="false" default="false" hint="Delete all subdirectory content as well (leaving the subdirectories empty). Note: Will automatically be false if bDeleteSubDirectories is true." />
	<cfargument name="bDeleteSubDirectories" type="boolean" required="false" default="false" hint="Deletes subdirectories (not just their contents)." />
	<cfset var qFiles = "" />
	<cfset var qSubDirectoriesOneLevelDeep = "" />
	<cfset var aReturn = [] />
	<cfset var dirPathForwardSlashes = replace(arguments.dirPath, "\", "/", "all") />
	<cfset var dirPathBackwardSlashes = replace(arguments.dirPath, "/", "\", "all") />

	<cfif arguments.bDeleteSubDirectories is true>
		<cfset arguments.bRecurse = false />
	</cfif>

	<cfdirectory action="list" directory="#arguments.dirPath#" filter="#arguments.dirFilter#" name="qFiles" recurse="#arguments.bRecurse#" />
	<cfloop query="qFiles">
		<cfif qFiles.type eq "file">
			<cffile action="delete" file="#qFiles.directory & "/" & qFiles.name#" mode="777" />
			<cfset arrayAppend(aReturn, {data=qFiles.directory & "/" & qFiles.name,type="file"}) />
		</cfif>
	</cfloop>
	<cfif arguments.bDeleteSubDirectories is true>
		<cfquery name="qSubDirectoriesOneLevelDeep" dbtype="query">
			select directory, name, type
			from qFiles
			where lower(type) = 'dir'
				and (directory = '#dirPathForwardSlashes#' or directory = '#dirPathBackwardSlashes#');
		</cfquery>
		<cfloop query="qSubDirectoriesOneLevelDeep">
			<cfdirectory action="delete" directory="#qSubDirectoriesOneLevelDeep.directory & "/" & qSubDirectoriesOneLevelDeep.name#" recurse="true" />
			<cfset arrayAppend(aReturn, {data=qSubDirectoriesOneLevelDeep.directory & "/" & qSubDirectoriesOneLevelDeep.name,type="dir"}) />
		</cfloop>
	</cfif>

	<cfreturn aReturn />
</cffunction>

<cfset dir = expandPath("./test/")>
<cfoutput>#dir#</cfoutput>
<cfset result = deleteDirectoryContents(dirPath=dir, bDeleteSubDirectories=true)>
<cfdump var="#result#">