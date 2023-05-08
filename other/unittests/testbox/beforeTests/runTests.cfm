<!--- runTests.cfm --->
<cfoutput>
	#createObject("mxunit.runner.DirectoryTestSuite").run(
		directory		= getDirectoryFromPath(getCurrentTemplatePath()),
		componentPath	= "unittests.testbox.beforeTests",
		recurse			= false
	).getResultsOutput("simple")#
</cfoutput>