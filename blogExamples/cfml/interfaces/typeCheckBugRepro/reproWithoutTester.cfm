<cfscript>
mockedImpl 	= new Impl();
structClear(mockedImpl);
public string function functionToMock(/*required string s*/){	// does not fulfill interface
	return "";
}
mockedImpl.functionToMock = functionToMock;

writeOutput('isInstanceOf(mockedImpl, "I"): ' & isInstanceOf(mockedImpl, "I") & "<br>");
writeOutput('isInstanceOf(mockedImpl, "Impl"): ' & isInstanceOf(mockedImpl, "Impl") & "<br>");

try {
	function testFunctionToMock(required I impl){
		 impl.functionToMock(s="");
	}
	testFunctionToMock(impl=mockedImpl);

	writeOutput("Mocked object worked<br>");
}
catch (any e){
	writeOutput("Mocked object failed:<br>#e.type#<br>#e.message#<br>#e.detail#<br>#e.tagcontext[1].raw_trace#<br>");
}
</cfscript>