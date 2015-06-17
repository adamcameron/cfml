// Application.cfc
component extends= "" {

	this.mappings	= {
		"/mockbox"	= expandPath("/frameworks/mockbox/"),
		"/testbox"	= expandPath("/frameworks/testbox/"),
		"/mxunit"	= expandPath("/frameworks/testbox/system/testing/compat"),
		"/testapp" = getDirectoryFromPath(getCurrentTemplatePath())
	};

}