<cfscript>
	mockbox = new mockbox.system.testing.MockBox();
	mockedImpl 	= mockbox.createEmptyMock("Impl");
	mockedImpl.$("g");

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
</cfscript>