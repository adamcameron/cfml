<cfscript>
	if (structKeyExists(URL, "callback") && structKeyExists(URL, "handler") && structKeyExists(URL, "proxiedUrl")){
		httpResponse.fileContent = fileRead(expandPath("./data/cf1000_array.json"), "UTF-8");

		adobeJson = removeChars(httpResponse.fileContent, 1, 2);	// gets rid of the // at the beginning of the string
		amendedJson = "{"
					& "product : " & URL.product & "," 
					& "version : " & URL.version & "," 
					& "results : " & adobeJson
					& "}"
		;
		
		response = "#callback#(#handler#(#amendedJson#));";

		// can't do CFCONTENT in script yet :-(
		pageContext = getPageContext();
		pageContext.getResponse().setContentType("application/json");
		pageContext.getCFOutput().clearAll();
		writeOutput(response);
	}	
</cfscript>