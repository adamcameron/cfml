<cfsetting requesttimeout="180">
<cfoutput>
#createObject("mxunit.runner.DirectoryTestSuite").run(
	directory		= getDirectoryFromPath(getCurrentTemplatePath()),   
	recurse			= true,
	componentpath	= "shared.CF.cflib"
).getResultsOutput("html")#
</cfoutput>