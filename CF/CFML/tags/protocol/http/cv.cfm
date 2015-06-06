<cfset oHttp = createObject("java", "coldfusion.tagext.net.HttpTag").init()>
<cfset oCv = createObject("java", "ClassViewer")>
<cftry>
<pre>
	<cfoutput>#oCv.viewObject(oHttp)#</cfoutput>
</pre>
<cfcatch>
	<cfdump var="#oHttp#">
	<cfdump var="#cfcatch#" expand="false">
</cfcatch>
</cftry>