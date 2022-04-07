component {

	this.number			= "rima";
	session.scopes.this = this;
	
	public void function f(number){
		local.number			= "ono";
		session.scopes.arguments= arguments;
		session.scopes.local	= local;
	}

}