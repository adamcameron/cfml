// User.cfc
component accessors=true {
	string property firstName;
	string property lastName;
	string property loginId;
	string property isAuthenticated=false;

	public User function init() {
		return this;
	}

}