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
<h2>getPageContext()</h2>
<pre>
#cv.viewObject(o)#
</pre>
<hr />
<h2>getPageContext().getFusionContext()</h2>
<pre>
#cv.viewObject(o.getFusionContext())#
</pre>
<hr />
<h2>o.getFusionContext()</h2>
<cfdump var="#o.getFusionContext()#">
<cfset o2 = o.getFusionContext()>
<cfoutput>#o2.getParent()#</cfoutput>
<hr />
<h2>getPageContext().getResponse()</h2>
<pre>
#cv.viewObject(o.getResponse())#
</pre>


</cfoutput>