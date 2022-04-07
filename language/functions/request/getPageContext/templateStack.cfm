<cfset cv = createObject("java", "me.adamcameron.miscellany.ClassViewer")>
<cfset o = getPageContext()>


<cfoutput>
<style>
div, pre {
	font-family	: verdana;
	font-size	: 10pt;
}

</style>
<div>
<!--- <h2>getPageContext()</h2>
<pre>
#cv.viewObject(o)#
</pre>
<hr /> --->
<h2>getPageContext().getFusionContext()</h2>
<pre>
#cv.viewObject(o.getFusionContext())#
</pre>
</cfoutput>