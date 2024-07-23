<cfscript>
param name="URL.sourceFile";
param name="URL.destinationFile";

if (!fileExists(URL.sourceFile)){
	throw(type="FileNotFoundException", message="Source file not found", detail="The source file - #URL.sourceFile# - was not found");
}
httpResponse = new Http(
	URL			= "http://javascript-minifier.com/raw",
	method		= "POST",
	parameters	= [{type="formfield", name="input", value=fileRead(URL.sourceFile, "UTF-8")}]
).send().getPrefix();

if (httpResponse.statusCode != "200 OK"){
	throw(type="FailedRequestException", message="The web service request failed", detail="The request failed with a response of #httpResponse.statusCode#");
}

fileWrite(URL.destinationFile, httpResponse.fileContent, "UTF-8");
writeOutput("#URL.sourceFile# minified and written to #URL.destinationFile#");
</cfscript>