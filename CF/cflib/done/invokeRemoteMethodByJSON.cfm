<cfscript>
function invokeRemoteMethodByJSON(required string url, required string method, struct args){
	var httpService = new http(url=url, method="post");

	httpService.addParam(type="formfield", name="method", value=method);
	httpService.addParam(type="formfield", name="returnformat", value="json");
	httpService.addParam(type="formfield", name="argumentCollection", value=serializeJSON(args));
	
	var result = httpService.send().GetPrefix();
	
	if (len(result.fileContent)) {
		if (!isJson(result.fileContent)){
			throw(message="Non-json string returned", detail=result.fileContent);
		}
			
		return deserializeJSON(result.fileContent);
	}
}


result = invokeRemoteMethodByJSON(
	url="http://localhost:8500/shared/CF/cflib/InvokeRemoteMethodByJSON.cfc",
	method="f",
	args={arg1="newStruct", arg2={key="value"}}
);
writeDump(result);
</cfscript>
