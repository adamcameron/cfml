component rest=true {

	/**
		@firstName.restargsource path
		@firstName.restargname fName
		@lastName.restargsource path
		@lastName.restargname lName
	*/
	remote query function getPersonAsXml(
		required string firstName,
		required string lastName
	)
		httpmethod	= "get"
		produces	= "text/xml"
		restpath	= "getPerson/{fName}/{lName}"
	{
		var q = queryNew("");
		queryAddColumn(q, "id", [createUuid()]);
		queryAddColumn(q, "firstName", [arguments.firstName]);
		queryAddColumn(q, "lastName", [arguments.lastName]);
		
		return q;
	}

	/**
		@firstName.restargsource path
		@firstName.restargname fName
		@lastName.restargsource path
		@lastName.restargname lName
	*/
	remote query function getPersonAsText(
		required string firstName,
		required string lastName
	)
		httpmethod	= "get"
		produces	= "text/plain"
		restpath	= "getPerson/{fName}/{lName}"
	{
		var q = queryNew("");
		queryAddColumn(q, "id", [createUuid()]);
		queryAddColumn(q, "firstName", [arguments.firstName]);
		queryAddColumn(q, "lastName", [arguments.lastName]);
		
		return q;
	}

	/**
		@firstName.restargsource form
		@firstName.restargname fName
		@lastName.restargsource form
		@lastName.restargname lName
	*/
	remote query function getPersonViaForm(
		required string firstName,
		required string lastName
	)
		httpmethod	= "post"
		produces	= "text/xml"
		restpath	= "getPerson"
	{
		var q = queryNew("");
		queryAddColumn(q, "id", [createUuid()]);
		queryAddColumn(q, "firstName", [arguments.firstName]);
		queryAddColumn(q, "lastName", [arguments.lastName]);
		
		return q;
	}
}
