<cfscript>
// testWithNoDi.cfm

someService = new api.SomeService(someDao=new api.SomeDao())

dump(someService)

</cfscript>
