<cfscript>
	mockbox = new MockBox();

	// control
	impl = new Impl();
	writeOutput("Control<br>");
	writeOutput('isInstanceOf(impl, "I"): ' & isInstanceOf(impl, "I") & "<br>");
	writeOutput('isInstanceOf(impl, "Impl"): ' & isInstanceOf(impl, "Impl") & "<br>");
	writeOutput("<hr>");

	writeOutput("Manual Clearance<br>");
	impl = new Impl();
	gCopy = impl.g;

	writeOutput("Cleared<br>");
	structClear(impl);
	writeOutput('isInstanceOf(impl, "I"): ' & isInstanceOf(impl, "I") & "<br>");
	writeOutput('isInstanceOf(impl, "Impl"): ' & isInstanceOf(impl, "Impl") & "<br>");

	writeOutput("Restored<br>");
	impl.g = createFunctionFromMetadata(gCopy);
	writeOutput('isInstanceOf(impl, "I"): ' & isInstanceOf(impl, "I") & "<br>");
	writeOutput('isInstanceOf(impl, "Impl"): ' & isInstanceOf(impl, "Impl") & "<br>");
	writeOutput("<hr>");
	
	writeOutput("Use Restored<br>");
	try {
		testI(impl);
		writeOutput("testI(impl): true<br>");
	}
	catch (any e){
		writeOutput("testI(impl): false<br>");
	}


	exit;
	writeOutput("Mockbox Test<br>");
	mockedImpl 	= mockbox.createEmptyMock("Impl");
	mockedImpl.$("g");
	writeOutput('isInstanceOf(mockedImpl, "I"): ' & isInstanceOf(mockedImpl, "I") & "<br>");
	writeOutput('isInstanceOf(mockedImpl, "Impl"): ' & isInstanceOf(mockedImpl, "Impl") & "<br>");

	testC = new C();
	testC.f(o=mockedImpl);


	any function createFunctionFromMetadata(required any f){
		var md			= getMetadata(f);
		var code		= "<cfscript>";
		var delim		= "";
		var functionName= "_#hash(createUuid())#";
		var newFunction	= false;

		if (structKeyExists(md, "access")){
			code &= md.access;
		}
		if (structKeyExists(md, "returntype")){
			code &= " " & md.returntype;
		}

		code &= " function #functionName#(";

		for (var arg in md.parameters){
			code &= delim;
			if (structKeyExists(arg, "required") && arg.required){
				code &= " required ";
			}
			if (structKeyExists(arg, "type")){
				code &= " " & arg.type;
			}
			code &= " " & arg.name;
			delim = ",";
		}

		code &= "){";
		
		// deal with return type
		code &= generateReturnStatement(md);
		code &= "}</cfscript>";
		
		var basePath = getDirectoryFromPath(getCurrentTemplatePath());
		var fileName = functionName & ".cfm";
		var filePath = basePath & fileName;
		fileWrite(filePath, code);
		include fileName;
		newFunction = variables[functionName];
		structDelete(variables, functionName);
		fileDelete(filePath);
		return newFunction;
		
	}
	
	string function generateReturnStatement(required struct md){
		var returnStatement = "return ";
		if (structKeyExists(md, "type")){
			switch (md){
				// TBC as required
			}
			
		}
		returnStatement &= ";";
		return returnStatement;
	}


	I function testI(required I o){
		return o;
	}

</cfscript>
