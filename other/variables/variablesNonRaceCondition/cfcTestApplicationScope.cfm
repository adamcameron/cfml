<!---cfcTestApplicationScope.cfm--->
<cfflush interval="16">
<cfscript>
	param name="URL.id" default="1";
	
	if (!structKeyExists(application, "o")){
		application.o = createObject("CfcTest");
	}
	
	application.o.msg("Begin request");
	application.o.msg("Before call to foo()");
	application.o.foo();
	application.o.msg("After call to foo(), variables.foo: [#application.o.getFoo()#]");
</cfscript>