<cfset sDir = "C:\webroots\shado6\bmalyan\dms">
&lt;cfdirectory&gt; single dir
<cf_timeit>
<cfdirectory action="list" directory="#sDir#" name="qDirs" recurse="false">
</cf_timeit>
<cfoutput>#qDirs.recordCount#</cfoutput><br />

listFiles() single dir
<cf_timeit>
<cfset aDirs = createObject("java", "java.io.File").init(sDir).listFiles()>
</cf_timeit>
<cfoutput>#arrayLen(aDirs)#</cfoutput><br />

<cfset sDir = "C:\webroots\dev\shadomx\">
&lt;cfdirectory&gt; recursive
<cf_timeit>
<cfdirectory action="list" directory="#sDir#" name="qDirs" recurse="true">
</cf_timeit>
<cfoutput>#qDirs.recordCount#</cfoutput><br />

listFiles() single dir
<cf_timeit>
<cfset fDir = createObject("java", "java.io.File").init(sDir)>
<cfset aDirs = createObject("java", "RecursiveDir").init().parseFile(fDir)>
</cf_timeit>
<cfoutput>#arrayLen(aDirs)#</cfoutput><br />

