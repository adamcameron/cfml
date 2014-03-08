<!--- runTests.cfm --->
<cfoutput>
#new mxunit.runner.DirectoryTestSuite().run(
	directory		= request.baseDirPath,
	componentPath	= request.baseDirName
).getResultsOutput("simple")#
</cfoutput>