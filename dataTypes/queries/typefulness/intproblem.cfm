<cfapplication name="shado">
<cfset q = application.dtr_test.dms.get.value>
<cfset cv = createObject("java", "me.adamcameron.miscellany.ClassViewer")>
<pre>
<cfoutput>
#cv.viewObject(q)#	<!--- where o is a string, struct, query, getPageContext() (which is a good one), whatever --->
</cfoutput>
</pre>
<cfdump var="#q.getColumnList()#">
<cfdump var="#q.getMetadata()#">
<pre>
<cfoutput>
#cv.viewObject(q.getMetadata())#	<!--- where o is a string, struct, query, getPageContext() (which is a good one), whatever --->
</cfoutput>
</pre>