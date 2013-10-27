<cfoutput>
#new mxunit.runner.DirectoryTestSuite().run(
	directory		= getDirectoryFromPath(getCurrentTemplatePath()),
	componentpath	= "" 
).getResultsOutput("html")#
</cfoutput>