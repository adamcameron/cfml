<cfparam name="url.file" default="">
<cfset sFile = "C:\webroots\shared\cf\cfml\directory\scanPerformance\#url.file#">

<cf_timeit>
<cfset stFile = createObject("java", "java.io.File").init(sFile)>
</cf_timeit>
<cfdump var="#stFile#">


<cf_timeit>
<cfdirectory action="list" name="qFile" directory="#getDirectoryFromPath(sFile)#" filter="#getFileFromPath(sFile)#">
</cf_timeit>
<cfdump var="#qFile#">
