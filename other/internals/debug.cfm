<cffunction name="originalMethodName">
	<cfset var oCv = createObject("java", "me.adamcameron.miscellany.ClassViewer")>
	<cfset var o = createObject("java", "coldfusion.debug.Debugger").init()>
	<cfdump var="#o#">

	<pre>
	<cfoutput>
	#oCv.viewObject(o)#
	</cfoutput>
	</pre>
</cffunction>


<cfset originalMethodName()>