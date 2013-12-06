<!--- runTests.cfm --->
<cfset thisDirectory = getDirectoryFromPath(getCurrentTemplatePath())>
<cfoutput>
#new mxunit.runner.DirectoryTestSuite().run(
	directory		= thisDirectory,
	componentPath	= listLast(thisDirectory, "/\")
).getResultsOutput("html")#
</cfoutput>