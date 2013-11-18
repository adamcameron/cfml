<!--- runTests.cfm --->
<cfoutput>
#new mxunit.runner.DirectoryTestSuite().run(
	directory		= getDirectoryFromPath(getCurrentTemplatePath()),
	componentPath	= "shared.git.blogExamples.unittests.events"
).getResultsOutput("html")#
</cfoutput>