<cfscript>
	oHttp = new http();
	oHttp.setAttributes(url="http://www.cricket.org", method="get");
	oHttp.send();
	dump(var=oHttp.getResult().fileContent);
	dump(var=oHttp);
	oCv = createObject("java", "me.adamcameron.miscellany.ClassViewer");
</cfscript>
<cfoutput>
<pre>
#oCv.viewObject(new http())#
</pre>
</cfoutput>
