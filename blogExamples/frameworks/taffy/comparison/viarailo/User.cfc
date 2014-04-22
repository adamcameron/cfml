component rest="true" restpath="user" {

	variables.userService = new service.User();

	/**
	* @httpmethod 	GET
	* @restPath		""
	*/
	remote array function getAll() {
		return variables.userService.getAll();
	}

	/**
	* @httpmethod		GET
	* @restPath			{id}
	* @id.restargsource	path
	*/ 
	remote User function getById(required numeric id){
		try {
			return variables.userService.get(id);
		}catch(UserNotFoundException e){
			throw(type=e.type, errorcode=404, message="Not found", detail=e.detail);
		}
	}

	/**
	* @httpmethod		DELETE
	* @restPath			{id}
	* @id.restargsource	path
	*/ 
	remote void function deleteById(required numeric id){
		try {
			return variables.userService.delete(id);
		}catch(UserNotFoundException e){
			throw(type=e.type, errorcode=404, message="Not found", detail=e.detail);
		}
	}

	/**
	* @httpmethod			POST
	* @restpath				""
	* @body.restargsource	body
	*/
	remote  function create(required string body) {
		var postData = queryString2Struct(body)
		var newUser = variables.userService.create(argumentCollection=postData);
		restSetResponse({status=200,headers={location=makeGetUrl() & newUser.getid()}})
	}

	/**
	* @httpmethod			PUT
	* @restpath				{id}
	* @id.restargsource		path
	* @body.restargsource	body
	*/
	remote void function putById(required numeric id, required string body) {
		var putData = deserializeJson(body)
		variables.userService.update(id=id, argumentCollection=putData);
	}

	private struct function queryString2Struct(required string queryString){
		var result = {}
		queryString = urlDecode(queryString)
		queryString.each(function(pair,index,queryString){
			result[listFirst(pair,"=")] = listLast(pair,"=")
		},"&")
		return result
	}

	private string function makeGetUrl(){
		return CGI.http_host & CGI.script_name & CGI.path_info;
	}

}