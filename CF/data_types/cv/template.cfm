<cfset cv = createObject("java", "ClassViewer")>
<pre>
<cfoutput>#cv.viewObject([insertCFObjectHere])#</cfoutput><!--- where the insertCFObjectHere could be any object: queryNew(""); structNew(), "", 1, etc --->
</pre>
