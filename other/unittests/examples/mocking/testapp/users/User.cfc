// User.cfc
component accessors=true {

	property id;
	property firstName;
	property lastName;
	property loginId;
	property name="isAuthenticated" default=false;

	public User function init() {
		return this;
	}

}