component rest=true {

	/**
		@firstName.restargsource path
		@firstName.restargname fName
		@lastName.restargsource path
		@lastName.restargname lName
	*/
	remote boolean function auth(
		required string firstName,
		required string lastName
	)
		httpmethod	= "get"
		restpath	= "auth/{fName}/{lName}"
		produces	= "text/plain"
	{
		session.auth = {
			token		= createUuid(),
			firstName	= arguments.firstName,
			lastName	= arguments.lastName 
		};
		return true;
	}

	remote struct function getAuth()
		httpmethod	= "get"
		restpath	= "getAuth"
		produces	= "text/xml"
	{
		for (var key in session){
			var st[key] = session[key];
		}
		return session.auth;
	}

}
