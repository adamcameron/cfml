<cfset oCv = createObject("java", "ClassViewer")>
<cfset oCf = createObject("component", "shadomx.util.cfml")>
<pre>
<cfoutput>#oCv.viewObject(oCf)#</cfoutput>
</pre>
