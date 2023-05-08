// UserService.cfc
component {

	public UserService function init(required IUserDAO userDAO, required testapp.loggers.Logger auditLog){
		structAppend(variables, arguments);
		return this;
	}

	public User function getUserById(required numeric id){
		var userRecord = userDAO.getUserById(id);
		if (userRecord.recordCount){
			return setFromRecord(userRecord);
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
			auditLog.logEntry("Login attempt failed for user #loginId#, pwd #password#");
			return false;
		}

	}

	private User function setFromRecord(required query record){
		var user = new User();
		user.setId(record.id);
		user.setFirstName(record.firstname);
		user.setLastName(record.lastName);
		user.setLoginId(record.loginId);
		return user;
	}

}