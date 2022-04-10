<cfset oCv = createObject("java", "me.adamcameron.miscellany.ClassViewer")>
<cfset o = getPageContext()>


<style>
div, pre {
	font-family	: verdana;
	font-size	: 10pt;
}

</style>


<cfoutput>
<pre>
	#oCv.viewObject(o.getResponse())#
</pre>
</cfoutput>
