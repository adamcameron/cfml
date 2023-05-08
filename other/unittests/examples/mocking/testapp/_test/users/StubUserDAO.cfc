// StubUserServiceDAO.cfc

component implements="testapp.users.IUserDAO" {

	public query function getUserById(required numeric id){
		return queryNew("");
	}

	public query function getUserByLogin(required string loginId, required string password){
		return queryNew("");
	}

}