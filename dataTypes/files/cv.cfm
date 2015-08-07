<cfscript>
	f = fileOpen(getCurrentTemplatePath());
	oCv = createObject("java", "me.adamcameron.miscellany.ClassViewer");
</cfscript>

<cfoutput>
<pre>
#oCv.viewObject(f)#
</pre>
</cfoutput>