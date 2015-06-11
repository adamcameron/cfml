// Application.cfc
component {

	this.name				= "restMinimal19";
	this.applicationTimeout	= createTimespan(0,0,1,0);
	
	public void function onApplicationStart(){
		restInitApplication(getDirectoryFromPath(getCurrentTemplatePath()) & "../components", "components");
	}
	
}