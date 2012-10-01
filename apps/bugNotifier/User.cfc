component persistent=true {
	property name="id" fieldtype="id" generator="native";
	property name="email" unique=true;
	property name="password";
	property name="validationToken";
	property name="active" ormtype="boolean" default=false;	// TRUE if the email has been validated
	property name="bugs" fieldtype="many-to-many" cfc="Bug" linktable="UserBugs" fkcolumn="UserId";
	
	public User function init(){
		variables.validationToken = createUuid();
		return this;
	}
	
	public User function setPassword(required string password){
		variables.password = hash(arguments.password);
		return this;
	}

}