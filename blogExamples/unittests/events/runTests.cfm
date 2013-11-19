<!--- runTests.cfm --->
<cfoutput>
#new mxunit.runner.DirectoryTestSuite().run(
	directory		= getDirectoryFromPath(getCurrentTemplatePath()),
	componentPath	= "testCreateEventObject"
).getResultsOutput("html")#
</cfoutput>