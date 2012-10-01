component {
	variables.emailAddress	= "bugNotifier@gmail.co.uk";
	variables.validationUrl	= "http://#CGI.server_name#/bugNofitier/validateEmail.cfm";


	public Mailer function init(){
		return this;
	}
	
	remote void function setPassword(emailPwd){
		if (hash(arguments.emailPwd == "C7BFB6AE3B755AA332E686C89FB55AAE")){
			variables.emailPwd = arguments.emailPwd;
		}
	}
	
	public boolean function isActive(){
		return structKeyExists(variables, "emailPwd");
	}
	
	public void function sendValidation(string email, string validationToken){
		var fullUrl = "#variables.validationUrl#?email=#urlEncodedFormat(email)#&validationToken=#validationToken#";
		var mailService = new Mail(
			
		);
	}

}