<cfscript>
//testSimple.cfm

echo("testSimple.cfm, before creating someService<br>")
someService = application.wirebox.getInstance("api.SomeService")	

echo("testSimple.cfm, after creating someService<br>")

dump(var=structKeyExists(someService.getVariables(), "someDao"), label="Test the someDao object is in there")
</cfscript>