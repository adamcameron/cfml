<cfscript>
	param name="URL.output" default="html";
	
dir			= expandPath(".");
baseDir 	= expandPath("/");
relativeDir	= replace(replace(dir, baseDir, ""), "\", "/", "ALL");
cfcPath = replace(relativeDir, "/", ".", "ALL");

	writeOutput("<h1>#relativeDir#</h1>");
	
	dts = new mxunit.runner.DirectoryTestSuite();

	results = dts.run(
		directory		= dir,
		recurse			= true,
		componentpath	= cfcPath
	);
	
	if (!structIsEmpty(dts.getCatastrophicErrors())){
		writeDump(var=DTS.getCatastrophicErrors(), expand=false, label="#StructCount(DTS.getCatastrophicErrors())# Catastrophic Errors");
	}
	
	writeOutput(results.getResultsOutput(URL.output));
</cfscript>