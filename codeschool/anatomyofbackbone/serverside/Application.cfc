component {

	this.name				= "codeschool18";
	this.webAdminPassword	= "123456";
	
	public void function onApplicationStart(){
		restInitApplication(getDirectoryFromPath(getCurrentTemplatePath()) & "api", "api");
	}
	
}