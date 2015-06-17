<cfscript>
//foo = new Foo()
//foo.username = "user"
//foo.password = "pass"
//dumpFooInfo("using this scope")


foo = new foo(username:"user",password:"pass")
dumpFooInfo("using init()")
exit;


foo = new foo()
foo.setUsername("user")
foo.setpassword("pass")
dumpFooInfo("using explicit setters");


function dumpFooInfo(string message=""){
	dump(var=foo, label="foo: #message#");
	//dump(var=foo.returnVariables(), label="variables: #message#");
	//dump(var=foo.returnMetadata(), label="metadata: #message#");
}
</cfscript>