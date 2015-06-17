<cfset oCv	= createObject("java", "ClassViewer")>
<cfset oRd	= createObject("java", "RecursiveDir").init()>
<cfoutput>
<pre>
#oCv.viewObject(oRd)#
</pre>

</cfoutput>