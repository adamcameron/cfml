component persistent=true rest=true restPath="user" table="t_user" {

	property name="id" fieldtype="id" ormtype="integer" unique=true generator="native";
	property name="firstName";
	property name="lastName";
	property name="age" ormtype="integer";

	remote array function getAll() httpmethod="GET" restpath="" {
		return entityLoad("User");
	}

	remote User function getById(required numeric id restargsource="path") httpmethod="GET" restpath="{id}" {
		var user = entityLoad("User", arguments.id, true);
		if (!isNull(user)) {
			return user;
		}
		throw(type="UserNotFoundException", errorcode="404", message="Not found", detail="No User with that ID was found in the system");
	}

	/**
	* @body.restargsource	body
	*/
	remote void function create(required string body) httpmethod="POST" restpath="" {
		var postData = queryString2Struct(body);
		var newUser = new User();
		newUser.setFirstName(postData.firstName);
		newUser.setLastName(postData.lastName);
		newUser.setAge(postData.age);

		entitySave(newUser, true);
		restSetResponse({status=200,headers={location=makeGetUrl() & newUser.getId()}});
	}


	private struct function queryString2Struct(required string queryString){
		var result = {};
		queryString = urlDecode(queryString);
		paramsArray = listToArray(queryString, "&");
		for (var pair in paramsArray){
			result[listFirst(pair,"=")] = listLast(pair,"=");
		}
		return result;
	}

	private string function makeGetUrl(){
		return CGI.http_host & CGI.script_name & CGI.path_info & "/";
	}

}