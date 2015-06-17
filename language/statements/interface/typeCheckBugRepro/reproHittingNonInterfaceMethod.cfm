<cfscript>
	mockedImpl 	= new Impl();
	structClear(mockedImpl);
	mockedImpl.otherFunction = otherFunction;

	writeOutput('isInstanceOf(mockedImpl, "I"): ' & isInstanceOf(mockedImpl, "I") & "<br>");
	writeOutput('isInstanceOf(mockedImpl, "Impl"): ' & isInstanceOf(mockedImpl, "Impl") & "<br>");

	try {
		tester = new Tester();
		tester.testOtherFunction(impl=mockedImpl);
		writeOutput("Mocked object worked<br>");
	}
	catch (any e){
		writeOutput("Mocked object failed:<br>#e.type#<br>#e.message#<br>#e.detail#<br>#e.tagcontext[1].raw_trace#<br>");
	}


	public string function otherFunction(){
		return "";
	}
</cfscript>