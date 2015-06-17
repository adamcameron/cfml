<cfscript>
param name="URL.threads" type="integer" default=1;

request.x = xmlParse(expandPath('./test.xml'));
nodes = xmlSearch(request.x, "//ddd");
maxId = nodes[arrayLen(nodes)].xmlAttributes["id"];

request.results = [];
threads = [];
for (i=1; i <=URL.threads; i++){
	threadName = "t#i#";
	arrayAppend(threads, threadName);
	thread name="#threadName#" action="run" max="#maxId#" {
		for (i=1; i <=attributes.max; i++){
			try {
				xpath = '//*[@id="#i#"]';
				result = xmlSearch(request.x, xpath);
				arrayAppend(request.results, {
					thread	=thread.name,
					index	= i,
					resultID= result[1].xmlAttributes["id"]
				});
			}
			catch (any e){
				writeLog(file="xmlSearchBug", text="#thread.name# #i# #xpath# #e.type# #e.message# #e.detail#");
				abort;
			}
		}
	}
}
thread action="join" name="#arrayToList(threads)#";
writeOutput("Processing complete<br>");
writeOutput("Validating&hellip;<br>");

if (arrayLen(request.results) != URL.threads * maxId){
	writeOutput("Processing did not complete<br>");
}


for (result in request.results){
	if (result.index != result.resultId){
		writeDump(result);
		break;
	}
}
writeOutput("Validation complete<br>");
</cfscript>