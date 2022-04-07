<cfset sDir = "C:\base\parent\child\">
<cfoutput>
	[getDirectoryFromPath("#sDir#")]: [#getDirectoryFromPath(sDir)#]<br />

	[createObject("java", "java.io.File").init("#sDir#").getParent()]: [#createObject("java", "java.io.File").init(sDir).getParent()#]<br />

</cfoutput>