<!--- runTests.cfm --->
<cfoutput>
	#createObject("mxunit.runner.DirectoryTestSuite").run(
		directory		= request.thisDirPath,
		componentPath	= request.thisDir,
		recurse			= false
	).getResultsOutput("simple")#
</cfoutput>