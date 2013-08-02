<cfscript>
	mockbox = new mockbox.system.testing.Mockbox();

	writeOutput("<h1>#mockbox.getVersion()#</h1>");

	c = new C();

	mockbox.prepareMock(c);

	c.$("mockMe", {mocked=true});

writeOutput("BEFORE<br>");
	result = c.mockMe(func=f);
writeOutput("AFTER<br>");
	writeDump(result);

	function f(){

	}
</cfscript>