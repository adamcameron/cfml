<cfscript>
	postData = {
		id	= 1,
		firstname	= "Zachary",
		lastname	= "Cameron Lynch",
		age	= 3
	}
	bodyJson=serializeJson(postData)
	user = new userapi.User();
	user.create(body=bodyJson);
</cfscript>