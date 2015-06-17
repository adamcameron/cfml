<cfscript>
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

		for (var i=1; i <= arrayLen(md.parameters); i++){
			var arg = md.parameters[i];
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