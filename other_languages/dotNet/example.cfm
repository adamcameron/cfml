<cffunction name = "DotNetDirectory" returntype="any">
<cfargument name="directory" required="true" type="string">
<cfargument name="filter" required="false" type="string" default="*">
<cfargument name="recurse" required="false" type="boolean" default="false">
<cfargument name="type" required="false" type="string" default="all">
<cfset var responseQuery = queryNew('datecreated,datelastaccessed,datelastwritten,
name,size,readonly,pathname,directory') />
<!--- try to connect to the .NET object as it might already exist, otherwise create it--->
<cftry>    <cfobject type=".NET" class= "System.IO.DirectoryInfo"    name="objIO" action="connect">
<cfobject type=".NET" class= "System.IO.SearchOption" name="objSO" action="connect">
<cfcatch type="any">
<cfobject type=".NET" class= "System.IO.DirectoryInfo"    name="objIO" action="create">
<cfobject type=".NET" class= "System.IO.SearchOption" name="objSO" action="create">
</cfcatch>
</cftry>

<!--- load the directory specified to the DirectoryInfo Object--->
<cfset myDir = objIO.init(arguments.directory) /><!--- make sure the sepcified directory exists, otherwise throw an error--->
<cfif myDir.get_Exists() >

<!--- if recurse is true, tell .NET to list all directories recursively
else list the TopDirectory Only--->
<cfif arguments.recurse>
<cfset directoryDepth = objSO.AllDirectories />
<cfelse>
<cfset directoryDepth = objSO.TopDirectoryOnly />
</cfif> <!--- if type is file then do GetFiles(), else do GetDirectories()--->
<cfif arguments.type EQ 'file'>
<!--- GetFiles() takes 2 parameters, searchPatterna and SearchOption Object--->
<cfset listFiles = myDir.GetFiles(arguments.filter , directoryDepth ) />
<cfloop from="1" to="#arraylen(listFiles)#" index="thisFile">
<cfset queryAddRow(responseQuery) />
<cfset querySetCell(responseQuery,"datecreated", listFiles[thisFile].Get_CreationTime() )>
<cfset querySetCell(responseQuery,"datelastaccessed", listFiles[thisFile].Get_LastAccessTime() )>
<cfset querySetCell(responseQuery,"datelastwritten", listFiles[thisFile].Get_LastWriteTime() )>
<cfset querySetCell(responseQuery,"name", listFiles[thisFile].Get_Name() )>
<cfset querySetCell(responseQuery,"size", listFiles[thisFile].Get_Length() )>
<cfset querySetCell(responseQuery,"pathname", listFiles[thisFile].Get_FullName() )>
<cfset querySetCell(responseQuery,"directory", listFiles[thisFile].Get_DirectoryName() )>
<cfset querySetCell(responseQuery,"readonly", listFiles[thisFile].Get_IsReadOnly() )>
</cfloop>
</cfif>

<!--- if list directories --->     <cfif arguments.type EQ 'dir'>

<cfset listDirs = myDir.GetDirectories(arguments.filter , directoryDepth ) />
<cfloop from="1" to="#arraylen(listDirs)#" index="thisDir">
<cfset queryAddRow(responseQuery) />
<cfset querySetCell(responseQuery,"datecreated", listDirs[thisDir].Get_CreationTime() )>
<cfset querySetCell(responseQuery,"datelastaccessed", listDirs[thisDir].Get_LastAccessTime() )>
<cfset querySetCell(responseQuery,"datelastwritten", listDirs[thisDir].Get_LastWriteTime() )>
<cfset querySetCell(responseQuery,"name", listDirs[thisDir].Get_Name() )>
<cfset querySetCell(responseQuery,"size",  "")>
<cfset querySetCell(responseQuery,"pathname", listDirs[thisDir].Get_FullName() )>
<cfset querySetCell(responseQuery,"directory",listDirs[thisDir].Get_Name() )>
<cfset querySetCell(responseQuery,"readonly", "" )>
</cfloop>
</cfif>
<cfelse>
<cfreturn "#arguments.directory# does not exist" />    </cfif>
<cfreturn responseQuery />
</cffunction>


<cfscript>
stargs = structNew();
stargs.directory = expandPath("../");
stargs.recurse = "yes";
stargs.filter = "*.*";
stargs.type = "dir";
dir = DotNetDirectory(argumentCollection = stargs);
</cfscript>
<cfdump var = "#dir#">