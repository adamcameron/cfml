//Client side CFC to fetch tweets containing cfsummit2013

component client="true"
{
	var cb = new Codebird(); //JS library to fetch tweets
	var bearerToken = "";
	
	function search_tweets (searchText, callbackFunc)
	{
		try
		{
			cb.setBearerToken(bearerToken);
			cb.__call(
	    		"search_tweets",
	    		"count=100&q=" + searchText,
	    		callbackFunc,
	    		true 
			); 
		} 
		catch (any e)
		{
			alert("Error : " + e);
		}
	}
	
	function setBearerToken (token)
	{
		bearerToken = token;
	}
	
	function getBearerToken (consumer_key, consumer_secret, callback_func)
	{
		cb.setConsumerKey(consumer_key,consumer_secret);
		cb.__call(
		   	"oauth2_token",
		   	{},
		   	callback_func
		);
	}
	
}