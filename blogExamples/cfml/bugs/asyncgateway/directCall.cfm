<cfscript>
	fileName = getFileFromPath(getCurrentTemplatePath());
	new AsyncProxy().onIncomingMessage({data={fileName=fileName}});
</cfscript>
