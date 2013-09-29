component {

	public MailService function init(required string username, required string password){
		variables.server	= "smtp.googlemail.com";
		variables.port		= "465";
		variables.useSsl	= true;
		variables.useTls	= true;
		variables.username	= arguments.username;
		variables.password	= arguments.password;
		return this;
	}
	
	public void function send(required string to, required string subject, required string body){
		new Mail(
			from	= variables.username,
			to		= arguments.to,
			subject	= arguments.subject,
			body	= arguments.body,
			server	= variables.server,
			port	= variables.port,
			useSsl	= variables.useSsl,
			useTls	= variables.useTls,
			username= variables.username,
			password= variables.password
		).send();
	}
}