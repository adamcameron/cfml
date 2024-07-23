<cfscript>
	stOriginal	= request.getRuntimeProperties();

	writeDump(var=stOriginal, label="Before");

	stArgs = {};
	lKeys = "EnablePerAppSettings,HTTPStatusCodes,Whitespace,CFCTypeCheck,GlobalScriptProtect,AllowExtraAttributes";	/*DisableServiceFactory,*/
	for (i=1; i <= listLen(lKeys); i++){
		sKey = listgetAt(lKeys, i);
		stArgs[sKey] = stOriginal[skey] == ""?true:false;
	}
	request.setRuntimeProperties(argumentCollection=stArgs);

	stNew = request.getRuntimeProperties();
	writeDump(var=stNew, label="After");
</cfscript>