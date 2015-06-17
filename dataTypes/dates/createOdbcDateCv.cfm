<cfset oCv = createObject("java", "ClassViewer")>

<cfset d = createOdbcDate(now())>
<cfset dt = createOdbcDateTime(now())>

<cfoutput>
d: #d# #d.toString()#<br />
dt: #dt# #dt.toString()#<br />
</cfoutput>

<pre>
<cfoutput>#oCv.viewObject(d)#</cfoutput>
<hr />
<cfoutput>#oCv.viewObject(dt)#</cfoutput>
</pre>
