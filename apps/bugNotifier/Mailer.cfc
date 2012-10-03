component {
	variables.emailAddress	= "bugNotifier@gmail.co.uk";
	variables.siteUrl		= "http://#CGI.server_name#/";
	variables.validationUrl	= "#variables.siteUrl#bugNofitier/validateEmail.cfm";


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
	
	public void function sendActivation(string email, string activationToken){
		var fullUrl = "#variables.validationUrl#?email=#urlEncodedFormat(email)#&activationToken=#activationToken#";
		var mailService = new Mail(
			from	= variables.emailAddress,
			to		= email,
			subject = "Please validate your email" 
		);
		var htmlMsg = "";
		var textMsg = "";
		savecontent variable="htmlMsg" {
			include "templates/validationEmailHtml.cfm";
		};
		savecontent variable="textMsg" {
			include "templates/validationEmailtext.cfm";
		};
		mailService.addPart(type="html", body=htmlMsg);
		mailService.addPart(type="html", body=textMsg);
		
		mailService.send();
	}

}
