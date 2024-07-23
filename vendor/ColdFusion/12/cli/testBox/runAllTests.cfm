<cfscript>
if (isDefined("CLI")){
	testPath = expandPath("/../../");
	basePath = expandPath("/../../../../");
}else{
	testPath = expandPath("../../");
	basePath = expandPath("/");
}

cfcFiles = directoryList(testPath, true, "array", "*.cfc", "directory,name").reduce(function(cfcs, file){
	var cfcPath = file.replace(basePath, "").reReplace("[\\/]",".","all").reReplace("\.cfc$", "");
	var o = false;
	try {
		silencer(function(){
			o = createObject(cfcPath);
		});
		if (isInstanceOf(o, "testbox.system.BaseSpec")){
			cfcs.append(cfcPath);
		}
 	}catch(any ignore){
	}
	return cfcs;
},[]);

silencer(function(){
	results = new testbox.system.TestBox().run(cfcFiles);
});
writeOutput(results);
</cfscript>
<cffunction name="silencer">
	<cfargument name="task">
	<cfsilent><cfset task()></cfsilent>
</cffunction>