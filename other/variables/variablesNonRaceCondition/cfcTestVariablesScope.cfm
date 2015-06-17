<!---cfcTestVariablesScope.cfm --->
<cfflush interval="16">
<cfscript>
	param name="URL.id" default="1";
	
	o = new CfcTest();
	
	o.msg("Begin request");
	o.msg("Before call to foo()");
	o.foo();
	o.msg("After call to foo(), variables.foo: [#o.getFoo()#]");
</cfscript>