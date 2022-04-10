<cfscript>
	mockedImpl 	= new Impl();
	structClear(mockedImpl);
	mockedImpl.g = g;

	writeOutput('isInstanceOf(mockedImpl, "I"): ' & isInstanceOf(mockedImpl, "I") & "<br>");
	writeOutput('isInstanceOf(mockedImpl, "Impl"): ' & isInstanceOf(mockedImpl, "Impl") & "<br>");

	try {
		testC = new C();
		testC.f(o=mockedImpl);
		writeOutput("Mocked object worked<br>");
	}
	catch (any e){
		writeOutput("Mocked object failed: #e.type# #e.message# #e.detail#<br>");
	}


	public string function g(){
		return "";
	}
</cfscript>