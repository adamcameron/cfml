<cffunction name="renameDirectory" access="remote" output="false" returntype="void">
	<cfargument name="oldDir" type="string" required="true"/>
	<cfargument name="newDir" type="string" required="true"/>
    <cfscript>
        var src = createObject("java","java.io.File").init(trim(arguments.oldDir));
        var dest = createObject("java","java.io.File").init(trim(arguments.newDir));
        src.renameTo(dest);
    </cfscript>
</cffunction>


<cfset renameDirectory(oldDir="C:\LOWERCASE\",newDir="C:\lowercase\")>