component {

	variables.emailAddress	= "cfbugsubscriber@gmail.com";

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

	public void function sendActivation(required string email, required string activationToken, required string activationUrl){
		var fullUrl = "#activationUrl#&email=#urlEncodedFormat(email)#&activationToken=#activationToken#";
		var mailService = new Mail(
			from	= variables.emailAddress,
			to		= email,
			subject = "Please validate your email"
		);
		var htmlMsg = "";
		var textMsg = "";
		savecontent variable="htmlMsg" {
			include "mailer/activationEmailHtml.cfm";
		};
		savecontent variable="textMsg" {
			include "mailer/activationEmailtext.cfm";
		};
		mailService.addPart(type="html", body=htmlMsg);
		mailService.addPart(type="text", body=textMsg);

		mailService.send();
	}

	public void function sendResetRequest(required string email, required string resetToken, required string resetUrl){
		var fullUrl = "#resetUrl#&email=#urlEncodedFormat(email)#&resetToken=#resetToken#";
		var mailService = new Mail(
			from	= variables.emailAddress,
			to		= email,
			subject = "Password reset request"
		);
		var htmlMsg = "";
		var textMsg = "";
		savecontent variable="htmlMsg" {
			include "mailer/passwordResetRequestEmailHtml.cfm";
		};
		savecontent variable="textMsg" {
			include "mailer/passwordResetRequestEmailtext.cfm";
		};
		mailService.addPart(type="html", body=htmlMsg);
		mailService.addPart(type="text", body=textMsg);

		mailService.send();
	}

}
