// Application.cfc
component {

	request.baseDirPath	= getDirectoryFromPath(getBaseTemplatePath());
	request.baseDirName	= listLast(request.baseDirPath, "\/");

	this.mappings = {
		"/testbox"	= expandPath("/shared/frameworks/testbox"),
		//"/mxunit"	= expandPath("/shared/frameworks/testbox/1_0_0/testbox/system/testing/compat"),
		"/#request.baseDirName#" = request.baseDirPath 
	};
	function onRequest(){
		include arguments[1];
	}

}