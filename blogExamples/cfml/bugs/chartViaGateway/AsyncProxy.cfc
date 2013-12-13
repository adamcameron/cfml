// AsyncProxy.cfc
component {

	void function onIncomingMessage(required struct event){
		try {
			new Chart().writeChartToFile(event.data.fileName);
		}
		catch (any e){
			var debugInfo = "";
			savecontent variable="debugInfo" {
				writeDump(local);
			}

			var ts = timeFormat(now(),'HHmmss');
			var fileDirectory = "C:\temp\";
			var filePath = fileDirectory & "errorDump_#ts#.html"; 
			fileWrite(filePath, debugInfo);

			rethrow;
		}
	}
	
}