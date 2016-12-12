<cfscript>
codeDir = expandPath("./code");
fileName = createUuid();
fileExtension = ".cfm";
fullFileName = "#fileName#.#fileExtension#"; 
codeUrlPath = CGI.script_name.listDeleteAt(CGI.script_name.listLen("/"), "/") & "/code";
codeFullUrl = "http://#CGI.http_host##codeUrlPath#/#fullFileName#";

fileWrite("#codeDir#/#fullFileName#", form.code);

httpResponse = new Http(url=codeFullUrl, method="get").send().getPrefix();

fileDelete("#codeDir#/#fullFileName#");

writeOutput(httpResponse.fileContent);
</cfscript>