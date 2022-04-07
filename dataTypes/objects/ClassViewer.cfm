<cfset oCv = createObject("java", "me.adamcameron.miscellany.ClassViewer")>
<cfset oCf = createObject("component", "shadomx.util.cfml")>
<pre>
<cfoutput>#oCv.viewObject(oCf)#</cfoutput>
</pre>
