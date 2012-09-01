<cfscript>
	if (structKeyExists(URL, "callback") && structKeyExists(URL, "handler") && structKeyExists(URL, "proxiedUrl")){
		// grab the "special" ones and put them aside
		callback = URL.callback;
		structDelete(URL, "callback");
		handler = URL.handler;
		structDelete(URL, "handler");
		proxiedUrl = URL.proxiedUrl;
		structDelete(URL, "proxiedUrl");
		// all the rest of the URL args are intended for the remote call

		httpService = new com.adobe.coldfusion.Http(
			method		= "get",
			url			= proxiedUrl
		);
		for (param in URL){
			httpService.addParam(
				type	= "url",
				name	= param,
				value	= URL[param]
			);
		}
	
		httpResponse = httpService.send().getPrefix();	// it's not the "prefix" (whatever that is), it's the HTTP RESPONSE

		if (httpResponse.responseHeader.status_code == 200){
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
	}
</cfscript>