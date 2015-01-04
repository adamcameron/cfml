// Person.cfc
component rest=true restPath="person" {

	remote struct function getById(required numeric id restargsource="path") httpmethod="get" restpath="{id}" produces="application/json" {
		var person = entityLoad("Person", id, true);
		sleep(5000);
		return {id=person.id,firstName=person.firstName,lastName=person.lastName};
	}

	remote array function getAll() httpmethod="get" restpath="" produces="application/json" {
		var people = entityLoad("Person");
		return people.reduce(function(people,person){
			people.append({id=person.id,firstName=person.firstName,lastName=person.lastName});
			return people;
		},[]);
	}

	remote void function create(required string firstName restargsource="form", required string lastname restargsource="form") httpmethod="post" {
		var person = new app.Person();
		person.firstname = firstName;
		person.lastname = lastName;
		entitySave(person);

		restSetResponse({
			status	= 201,
			content	= "",
			headers= {
				location="#CGI.HTTP_HOST##CGI.SCRIPT_NAME##CGI.PATH_INFO##person.id#"
			}
		});
	}

}