<cfscript>
	function f(){
		return true;
	}
	cv = createObject("java", "me.adamcameron.miscellany.ClassViewer");
</cfscript>
<pre>
<cfoutput>
#cv.viewObject(f)#
</cfoutput>
</pre>

<cfoutput>#f.toString()#</cfoutput>
<cfdump var="#f.getMetadata()#">