// Application.cfc
component {

	request.baseDirPath	= getDirectoryFromPath(getBaseTemplatePath());
	request.baseDirName	= listLast(request.baseDirPath, "\/");

	this.mappings = {
		"/testbox"	= expandPath("/shared/frameworks/testbox"),
		"/mxunit"	= expandPath("/shared/frameworks/testbox/system/compat"),
		"/#request.baseDirName#" = request.baseDirPath 
	};

	function onRequest(){
		include arguments[1];
	}

}