<cfscript>
mockedImpl 	= new Impl();
structClear(mockedImpl);
public string function otherFunction(){
	return "";
}
mockedImpl.otherFunction = otherFunction;
// so functionToMock() is missing from mockedImpl now

writeOutput('isInstanceOf(mockedImpl, "I"): ' & isInstanceOf(mockedImpl, "I") & "<br>");
writeOutput('isInstanceOf(mockedImpl, "Impl"): ' & isInstanceOf(mockedImpl, "Impl") & "<br>");

try {
	function testOtherFunction(required I impl){
		 impl.otherFunction(s="");
	}
	testOtherFunction(impl=mockedImpl);
	writeOutput("Mocked object worked<br>");
}
catch (any e){
	writeOutput("Mocked object failed:<br>#e.type#<br>#e.message#<br>#e.detail#<br>#e.tagcontext[1].raw_trace#<br>");
}
</cfscript>