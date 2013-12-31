<!--- runTests.cfm --->
<cfoutput>
#new mxunit.runner.DirectoryTestSuite().run(
	directory		= getDirectoryFromPath(getCurrentTemplatePath()),
	componentPath	= "testApp._test",
	recurse			= true
).getResultsOutput("simple")#
</cfoutput>