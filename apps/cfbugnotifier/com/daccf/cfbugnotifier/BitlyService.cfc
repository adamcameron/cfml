component {

	public BitlyService function init(required string login, required string apiKey){

		variables.login		= arguments.login;
		variables.apiKey	= arguments.apiKey;
		variables.inited	= true;

		return this;
	}

	public string function shorten(required string url){
		if (!structkeyExists(variables, "inited")){
			throw(
				type	= "ObjectNotInitializedException",
				message	= "The BitlyService has not been initialised",
				detail	= "The BitlyService object needs to be initialised with authorsation credentials before it can be used"
			);
		}
		
		var bitlyShortenUrl = "http://api.bit.ly/v3/shorten?login=#variables.login#&apiKey=#variables.apiKey#&uri=#urlEncodedFormat(arguments.url)#";
		
		try {
			var response = new Http(
				method	= "get",
				url		= bitlyShortenUrl
			).send().getPrefix();
			
			var result = deserializeJson(response.fileContent);
			return result.data.url;
		}
		catch (any e){
			throw(type="RemoteServiceFailureException", message="Error calling remote bit.ly service", detail="#e.message# #e.detail#");
		}
	}

}

