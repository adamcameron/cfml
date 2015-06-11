<cfset cv = createObject("java", "ClassViewer")>

<pre>
<cfoutput>#cv.viewObject(now())#</cfoutput>
</pre>
<hr />
<pre>
<cfoutput>#cv.viewObject(createOdbcDate(now()))#</cfoutput>
</pre>
<hr />
<cfset d = now()>
<cfoutput>#d.getClass()#<br /></cfoutput>
<cfset d = createOdbcDate(now())>
<cfoutput>#d.getClass()#<br /></cfoutput>