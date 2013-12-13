component {

	public Local function init(){
		variables.remote = createObject("webservice", "http://#CGI.HTTP_HOST#/shared/git/blogExamples/json/webservices/Remote.cfc?wsdl");
		return this;
	}

	public query function sendQuery(required query query){
		return variables.remote.echo(query);
	}

}