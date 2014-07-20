// Application.cfc
component {

	request.baseDirPath	= getDirectoryFromPath(getBaseTemplatePath());
	request.baseDirName	= listLast(request.baseDirPath, "\/");

	this.mappings = {
		"/testbox"	= expandPath("/shared/frameworks/testbox"),
<<<<<<< HEAD
		//"/mxunit"	= expandPath("/shared/frameworks/testbox/1_0_0/testbox/system/testing/compat"),
=======
		"/mxunit"	= expandPath("/shared/frameworks/testbox/system/compat"),
>>>>>>> 4240f4295beec3481cfed35d9355bf2121967eb7
		"/#request.baseDirName#" = request.baseDirPath 
	};

	function onRequest(){
		include arguments[1];
	}

}