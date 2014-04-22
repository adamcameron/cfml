component  {

	public array function getAll() {
		return entityLoad("User");
	}

	public User function get(required numeric id) {
		var user = entityLoad("User", id, true);
		if (isNull(user)) {
			throw(type="UserNotFoundException", message="Not found", detail="No User with ID #id# was found");
		}
		return user;
	}

	public User function create(required string firstName, required string lastName, required numeric age) {
		var newUser = new DAO.User();
		newUser.setFirstName(firstName);
		newUser.setLastName(lastName);
		newUser.setAge(age);

		entitySave(newUser, true);
		return newUser;
	}

	public void function delete(required numeric id) {
		var user = entityLoad("User", id, true);
		if (isNull(user)) {
			throw(type="UserNotFoundException", message="Not found", detail="No User with ID #id# was found");
		}
		entityDelete(user);
	}

	public User function update(required numeric id, string firstName, string lastName, numeric age) {
		var user = entityLoad("User", id, true);
		if (isNull(user)) {
			throw(type="UserNotFoundException", message="Not found", detail="No User with ID #id# was found");
		}
		if (structKeyExists(arguments, "firstName")){
			user.setFirstName(firstName);
		}
		if (structKeyExists(arguments, "lastName")){
			user.setLastName(lastName);
		}
		if (structKeyExists(arguments, "age")){
			user.setAge(age);
		}
		entitySave(user);
		return user;
	}

}