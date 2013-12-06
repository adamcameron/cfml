component {

	void function onIncomingMessage(required struct event){
		try {
			throw(type="ForcedException", message="An exception was forced");
		}
		catch (any e){
			var debugInfo = "";
			savecontent variable="debugInfo" {
				writeDump(local);
			}

			var ts = timeFormat(now(),'HHmmss');
			var fileDirectory = expandPath("./");
			var filePath = fileDirectory & "errorDump_#ts#.html"; 
			fileWrite(filePath, debugInfo);

			rethrow;
		}
	}
	
}