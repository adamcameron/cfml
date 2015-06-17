<!---testCfCv.cfm --->
<cfset objToInspect = []>

<cfset cv = new ClassViewer()>

<pre>
<cfoutput>#cv.viewObject(objToInspect)#</cfoutput>	
</pre>