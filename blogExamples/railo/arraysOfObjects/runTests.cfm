<!--- runTests.cfm --->
<cfoutput>
#new mxunit.runner.DirectoryTestSuite().run(
	directory		= getDirectoryFromPath(getCurrentTemplatePath()),
	componentPath	= "railo"
).getResultsOutput("html")#
</cfoutput>