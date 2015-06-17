<cfscript>
	f = fileOpen(getCurrentTemplatePath());
	oCv = createObject("java", "ClassViewer");
</cfscript>

<cfoutput>
<pre>
#oCv.viewObject(f)#
</pre>
</cfoutput>