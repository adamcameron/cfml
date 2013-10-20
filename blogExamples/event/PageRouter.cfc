// PageRouter.cfc
component{
	public void function pageRequestHandler(required string event, required struct data){
		writeDump(arguments);
	}
}
