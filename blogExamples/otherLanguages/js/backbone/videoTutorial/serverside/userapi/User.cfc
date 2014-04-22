component persistent=true rest=true restPath="user" table="t_user" {

	property name="id" fieldtype="id" ormtype="integer" unique=true generator="native";
	property name="firstName";
	property name="lastName";
	property name="age" ormtype="integer";

	/**
	* @httpmethod 	GET
	* @restPath		""
	*/
	remote array function getAll() {
		return entityLoad("User")
	}

	/**
	* @httpmethod		GET
	* @restPath			{id}
	* @id.restargsource	path
	*/ 
	remote User function getById(required numeric id){
		var user = entityLoad("User", arguments.id, true)
		if (!isNull(user)) {
			return user
		}
		throw(type="UserNotFoundException", message="Not found", detail="No User with that ID was found in the system");
		//restSetResponse({status=404}) //this errors due to stupidity in CFML
	}

	/**
	* @httpmethod		DELETE
	* @restPath			{id}
	* @id.restargsource	path
	*/ 
	remote void function deleteById(required numeric id){
		var user = entityLoad("User", arguments.id, true)
		if (!isNull(user)){
			entityDelete(user)
			restSetResponse({status=204})
		}
		restSetResponse({status=404})
	}

	/**
	* @httpmethod			POST
	* @restpath				""
	* @body.restargsource	body
	*/
	remote  function create(required string body) {
		var postData = queryString2Struct(body)
		var newUser = new User()
		newUser.setFirstName(postData.firstName)
		newUser.setLastName(postData.lastName)
		newUser.setAge(postData.age)

		entitySave(newUser, true)
		restSetResponse({status=200,headers={location=makeGetUrl() & 1}})
	}

	/**
	* @httpmethod			PUT
	* @restpath				{id}
	* @id.restargsource		path
	* @body.restargsource	body
	*/
	remote void function putById(required numeric id, required string body) {
		var body = deserializeJson(body)
		var entity = new User()
		entity.setId(arguments.id)
		entity.setFirstName(body.firstName)
		entity.setLastName(body.lastName)
		entity.setAge(body.age)

		entitySave(entity)
	}

	/**
	* @httpmethod			PUT
	* @restpath				""
	* @body.restargsource	body
	*/
	remote void function bulkPut(required string body) {
		var body = deserializeJson(body)
		body.each(function(object,index,array){
			var entity = new User()
			entity.setId(arguments.id)
			entity.setFirstName(body.firstName)
			entity.setLastName(body.lastName)
			entity.setAge(body.age)

			entitySave(entity)
		});
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