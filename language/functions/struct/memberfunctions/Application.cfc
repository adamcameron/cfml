// Application.cfc
component {

	variables.thisDir	= getDirectoryFromPath(getCurrentTemplatePath()); 
	variables.thisSubdir= listLast(variables.thisDir,"\/"); 

	this.mappings		= {
		"/testbox" = expandPath("/frameworks/testbox/"),
		"/#variables.thisSubdir#" = variables.thisDir
	};

	function onRequest(required string requestedFile){
		include arguments.requestedFile;
	}

}