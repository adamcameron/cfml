// Application.cfc
component {

	request.thisDirPath = getDirectoryFromPath(getCurrentTemplatePath());
	request.thisDir = listLast(request.thisDirPath, "\/");

	this.name				= "testapp01";
	this.mappings			= {
		"/testbox"		= expandPath("/shared/frameworks/testbox/1.0.0/testbox"),
		"/mxunit"		= expandPath("/shared/frameworks/testbox/1.0.0/testbox/system/testing/compat"),
		"/#request.thisDir#"	= request.thisDirPath
	};

}