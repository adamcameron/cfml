// UserService.cfc
component {

	public UserService function init(required IUserDAO userDAO){
		structAppend(variables, arguments);
		return this;
	}

	public User function getUserById(required numeric id){
		var userRecord = userDAO.getUserById(id);
		if (userRecord.recordCount){
			var user = new User();
			setFromRecord(user, userRecord);
			return user;
		}else{
			throw(type="InvalidUserException", message="User does not exist", detail="No user with ID #id# was found");
		}
	}

	public boolean function authenticate(required string loginId, required string password){
		var userRecord = userDAO.getUserByLogin(loginId, password);
		if (userRecord.recordCount){
			setFromRecord(user, userRecord);
			return true;
		}else{
			return false;
		}

	}

	private void function setFromRecord(required User user, required query record){
		user.setId(record.id);
		user.setFirstName(record.firstname);
		user.setLastName(record.lastName);
		user.setLoginId(record.loginId);
	}

}