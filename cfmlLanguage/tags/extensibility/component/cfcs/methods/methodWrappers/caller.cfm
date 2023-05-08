<cfscript>
	oTest		= new Test();
	oInjector	= new EventInjector();
	oInjector.insertInjector(obj=oTest);

	// basic, unadulterated call
	writeOutput(oTest.returnString(str="Hello World<br />"));


	// inject a "before" event hook & handler, and run method again
	oTest.injectEvent(method="returnString", event="before", handler=beforeHandler);
	writeOutput(oTest.returnString(str="Hello World<br />"));	// now with bold


	// inject an "after" event hook & handler, and run method again
	oTest.injectEvent(method="returnString", event="after", handler=afterHandler);
	writeOutput(oTest.returnString(str="Hello World<br />"));	// now with bold and italics


	// these are the handlers we'll inject

	public struct function beforeHandler(string str){
		arguments.str = "<strong>#arguments.str#</strong>";
		return arguments;
	}

	public string function afterHandler(any args, any result){
		return "<em>#arguments.result#</em>";
	}


</cfscript>