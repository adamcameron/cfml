// Application.cfc
component {

	this.name				= "restEncodingTest4";
	this.restSettings = {
		cfclocation			= "api",
		skipCfcWithError	= true
	};
	this.webAdminPassword	= "123456";	// needed for Railo (which SUX)
	
	public void function onApplicationStart(){
		restInitApplication(getDirectoryFromPath(getCurrentTemplatePath()) & "services", "services");
	}
	
}