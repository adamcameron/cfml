<cfsetting showdebugoutput="false">
<cfscript>
	if (
			structKeyExists(URL, "callback")
		&&	structKeyExists(URL, "handler")
		&&	(structKeyExists(URL, "proxiedUrl") && hash(URL.proxiedUrl) == "0FA03B66958F53E17648A08D332385FB")	// ensure this is only used to proxy the intended URL
	){ 
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
			
			if (left(httpResponse.fileContent, 2) == "//"){	// it's a search
				amendedJson = removeChars(httpResponse.fileContent, 1, 2);	// gets rid of the // at the beginning of the string
			}else{// it's just HTML
				amendedJson = '"#jsStringFormat(httpResponse.fileContent)#"';
			}
			
			// echo all the passed-in args back, and send the actual result as PAYLOAD
			jsResponse = "";
			for (key in URL){
				jsResponse = listAppend(jsResponse, '"#key#": "#URL[key]#"');	
			}
			jsResponse = listAppend(jsResponse, '"payload": #amendedJson#');
			
			jsResponse = "#callback#(#handler#({#jsResponse#}));";			
			

			// can't do CFCONTENT in script yet :-(
			pageContext = getPageContext();
			pageContext.getResponse().setContentType("application/json");
			pageContext.getCFOutput().clearAll();
			writeOutput(jsResponse);
		}
	}
</cfscript>