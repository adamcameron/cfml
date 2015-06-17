<!--- runTests.cfm --->
<cfoutput>
#new mxunit.runner.DirectoryTestSuite().run(
	directory		= getDirectoryFromPath(getCurrentTemplatePath()),
	componentPath	= "shared.git.blogExamples.cfml.functions.outputsuppression"
).getResultsOutput("html")#
</cfoutput>