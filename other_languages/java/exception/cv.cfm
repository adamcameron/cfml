<cfscript>
	oCv = createObject("java", "ClassViewer");
	oException = createObject("java","java.lang.Exception").init();
</cfscript>
<cfdump var="#oException#">

<pre>
<cfoutput>
#oCv.viewObject(oException)#
</cfoutput>
</pre>