<cfscript>
mockedImpl 	= new Impl();
writeOutput("Before Mocking<br>");
writeOutput('isInstanceOf(mockedImpl, "I"): ' & isInstanceOf(mockedImpl, "I") & "<br>");
writeOutput('isInstanceOf(mockedImpl, "Impl"): ' & isInstanceOf(mockedImpl, "Impl") & "<br>");
writeOutput("<hr>");

structClear(mockedImpl);
public string function functionToMock(/*required string s*/){	// does not fulfill interface
	return "";
}
mockedImpl.functionToMock = functionToMock;

writeOutput("After Mocking<br>");
writeOutput('isInstanceOf(mockedImpl, "I"): ' & isInstanceOf(mockedImpl, "I") & "<br>");
writeOutput('isInstanceOf(mockedImpl, "Impl"): ' & isInstanceOf(mockedImpl, "Impl") & "<br>");
writeOutput("<hr>");

try {
	writeOutput("Run test<br>");
	function testFunctionToMock(required I impl){
		writeOutput("In testFunctionToMock()<br>");
		impl.functionToMock(s="");
	}
	testFunctionToMock(impl=mockedImpl);

	writeOutput("Mocked object worked<br>");
}
catch (any e){
	writeOutput("Mocked object failed:<br>Exception type: #e.type#<br>Exception message: #e.message#<br>Exception detail: #e.detail#<br>Exception occurred at: #e.tagcontext[1].raw_trace#<br>");
}
</cfscript>