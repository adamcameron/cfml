<cfscript>
	aFileList = createObject("java","java.io.File").init("C:\webroots\shado76\test761\fms\images\").listFiles();
</cfscript>
<cfdump var="#aFileList#">