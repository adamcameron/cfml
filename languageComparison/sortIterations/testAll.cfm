<cfscript>
param name="URL.maxMagnitude" default=0;
param name="URL.iterations" default=0;

basePath	= getDirectoryFromPath(getCurrentTemplatePath());

thisUrlDirectory = listDeleteAt(CGI.script_name, listLen(CGI.script_name, "/"), "/") & "/";
baseUrl		= CGi.http_host & thisUrlDirectory;

languages = {
	"cfml" 		= "http",
	"groovy"	= "shell",
	"ruby"		= "shell"
};

codeTemplates = {};
results = {};
for (language in languages){
	codeTemplates[language] = {
		code		= fileRead(basePath & language & ".template"),
		executeVia	= languages[language]
	};

	results[language] = {};
}



for (magnitude=0; magnitude <= URL.maxMagnitude; magnitude++){
	maxSizeForIteration = 10^magnitude;
	writeOutput("maxSizeForIteration: #maxSizeForIteration#<br>");
	for (thisRound=magnitude; thisRound >= 1; thisRound--){
		sizeForThisRound = maxSizeForIteration \ thisRound;
		writeOutput("sizeForThisRound: #sizeForThisRound#<br>");
		for (testIteration=1; testIteration <= URL.iterations;testIteration++){
			testArray = [];
			for (element=1; element <= sizeForThisRound; element++){
				arrayAppend(testArray, randRange(1, maxSizeForIteration));
			}
			arrayLiteral = '[#arrayToList(testArray)#]';
			for (language in languages){
				sourceCodeFileName = "sort." & language;
				sourceCodeFilePath = basePath & sourceCodeFileName;
				code = replace(codeTemplates[language].code, "{{ARRAY_LITERAL}}", arrayLiteral, "ONE");

				fileWrite(sourceCodeFilePath, code);

				if (codeTemplates[language].executeVia ==  "HTTP"){
					rawResult = new HTTP(
						URL		= baseUrl & sourceCodeFileName,
						method	= "get"
					).send().getPrefix().fileContent;
				}else{
					if (language == "ruby"){
						rawResult = execute(language, sourceCodeFilePath);
					}else{
						continue;
					}
				}
				try {
					result = deserializeJson(rawResult);
					
				}catch (any e){
					writeDump(rawResult);
					rethrow;
				}
				if (!structKeyExists(results[language], sizeForThisRound)){
					results[language][sizeForThisRound] = {
						total		= 0,
						mean		= 0,
						iterations	= 0
					};
				}
				results[language][sizeForThisRound].iterations++;
				results[language][sizeForThisRound].total += result.iterations;
				results[language][sizeForThisRound].mean = results[language][sizeForThisRound].total \ results[language][sizeForThisRound].iterations;

			}

		}
	}
}	
writeDump(results);
</cfscript>
<cffunction name="execute">
	<cfargument name="language">
	<cfargument name="file">
	<cfexecute name="#arguments.language#" arguments="#arguments.file#" variable="local.result" timeout="1000" />
	<cfreturn local.result>
</cffunction>