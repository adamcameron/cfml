<cfscript>
// testRunner.cfm
runner = new testbox.system.TestBox(directory="shared.git.blogExamples.cfml.closure.case")
echo(runner.run())
</cfscript>