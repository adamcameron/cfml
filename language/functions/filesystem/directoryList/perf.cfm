<cfflush interval="16">
<cfset sDir = "C:\webroots\shared\">

directoryList()<br />
<cf_timeit>
<cfset aDir = directoryList(sDir, true, "path")>
</cf_timeit>
<cfoutput>Array: [#arrayLen(aDir)#]<br /></cfoutput>

<cf_timeit>
<cfset qDir = directoryList(sDir, true, "query")>
</cf_timeit>
<cfoutput>Query: [#qDir.recordCount#]<br /></cfoutput>

<br />
&lt;cfdirectory&gt;<br />
<cf_timeit>
<cfdirectory action="list" recurse="true" directory="#sDir#" name="qDir" listinfo="path">
</cf_timeit>
<cfoutput>Path: [#qDir.recordCount#]<br /></cfoutput>

<cf_timeit>
<cfdirectory action="list" recurse="true" directory="#sDir#" name="qDir">
</cf_timeit>
<cfoutput>Query: [#qDir.recordCount#]<br /></cfoutput>