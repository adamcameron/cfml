<cfscript>
	fileName = getFileFromPath(getCurrentTemplatePath());
	sendGatewayMessage("AsyncCfmlProxy", {fileName=fileName});
</cfscript>