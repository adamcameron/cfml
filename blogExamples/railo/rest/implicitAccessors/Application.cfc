// Application.cfc
component {

	this.name					= "app05";

	this.mappings				= {
		"/cfcs"	= getDirectoryFromPath(getCurrentTemplatePath()) & "cfcs"
	};
	this.invokeImplicitAccessor	= true;
	this.webAdminPassword		= "123456";

	public void function onApplicationStart(){
		restInitApplication(expandPath("./api"), "api");
	}
	
}