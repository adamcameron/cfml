<cfscript>
	param name="URL.size" type="integer";

	public string function makeFileName(){
		var sName	= "";
		var i		= 0;
		
		for (i=1; i <= 8; i++){
			sName &= chr(randRange(65,90));
		}
		return sName & ".dat";
	}

	public string function makeData(numeric size){
		var sData	= "";
		var i		= 0;
		
		for (i=1; i <= arguments.size; i++){
			sData &= chr(randRange(65,90));
		}
		return sData;
	}

	sBasePath = "ram:///";
//	fileWrite(sbasePath & makeFileName(), makeData(URL.size));

	qDir = directoryList(sBasePath, true, "query");
	writeDump(var=qDir, label="qDir");
	writeDump(var=getVFSMetaData("RAM"), label="getVFSMetaData");
</cfscript>