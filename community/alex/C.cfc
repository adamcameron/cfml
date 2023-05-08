component {

	function f(){
		var requestData = GetHttpRequestData();
		var requestUrl  = requestData.headers['X-Original-URL'] ?: server.coldfusion.productVersion;

		writeOutput(requestUrl);
	}

}