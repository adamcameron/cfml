<cfparam name="URL.output" default="html">
<cfscript>

	dir			= expandPath(".");
	baseDir 	= expandPath("/");
	relativeDir	= replaceNoCase(replaceNoCase(dir, baseDir, ""), "\", "/", "ALL");
	cfcPath = replace(relativeDir, "/", ".", "ALL");

	writeOutput("<h1>#relativeDir#</h1>");

	dts = createObject("component", "mxunit.runner.DirectoryTestSuite");

	results = dts.run(
		directory		= dir,
		recurse			= true,
		componentpath	= cfcPath
	);
</cfscript>
<cfif not structIsEmpty(dts.getCatastrophicErrors())>
	<cfdump var="#DTS.getCatastrophicErrors()#" expand="false" label="#StructCount(DTS.getCatastrophicErrors())# Catastrophic Errors">
</cfif>
<cfoutput>#results.getResultsOutput(URL.output)#</cfoutput>
