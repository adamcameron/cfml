component {

	this.name				= "codeschool18";
	this.webAdminPassword	= "12345678";
	
	public void function onApplicationStart(){
		restInitApplication(getDirectoryFromPath(getCurrentTemplatePath()) & "api", "api");
	}
	
}