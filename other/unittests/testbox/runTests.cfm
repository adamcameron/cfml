<!--- runTests.cfm --->
<cfoutput>
	#createObject("mxunit.runner.DirectoryTestSuite").run(
		directory		= getDirectoryFromPath(getCurrentTemplatePath()),
		componentPath	= "unittests",
		recurse			= false
	).getResultsOutput("simple")#
</cfoutput>