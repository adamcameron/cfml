// Application.cfc
component {

	this.name				= "restTestSerialiser08";
	this.applicationTimeout	= createTimespan(0,0,1,0);
	//this.customSerializer	= "testing.rest.components.Serialiser";
	
	public void function onApplicationStart(){
		restInitApplication(getDirectoryFromPath(getCurrentTemplatePath()) & "../components", "components");
	}
	
}