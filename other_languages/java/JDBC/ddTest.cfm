<cfset oCv = createObject("java", "ClassViewer")>
<cfset oJdbc = createObject("java", "macromedia.jdbc.sqlserver.SQLServerDriver").init()>

<cftry>
<cfoutput>
<pre>
#oCv.viewObject(oJdbc)#
</pre>
</cfoutput>
<cfcatch>
<cfdump var="#oJdbc#">
</cfcatch>
</cftry>
<hr />

