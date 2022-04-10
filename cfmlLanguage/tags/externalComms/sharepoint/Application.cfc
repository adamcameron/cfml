component {

	this.name	= "cfsharepoint";
	
	public void function onApplicationStart(){
		application.sharepoint.credentials = {username='test_reader', password='test_reader', domain='ws2k3std-test'};
	}
}