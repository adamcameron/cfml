<cfscript>
	function f(){
		return true;
	}
	cv = createObject("java", "ClassViewer");
</cfscript>
<pre>
<cfoutput>
#cv.viewObject(f)#
</cfoutput>
</pre>

<cfoutput>#f.toString()#</cfoutput>
<cfdump var="#f.getMetadata()#">