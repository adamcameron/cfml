component {

	this.name				= "testAdminApi";
	this.sessionManagement	= true;

	public void function onSessionStart(string template){
		createObject("component", "CFIDE.adminapi.administrator").login("A1//////");
	}
}