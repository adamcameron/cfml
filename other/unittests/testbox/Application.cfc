// Application.cfc
component {

	this.name				= "testapp01";
	this.mappings			= {
		"/testbox"		= expandPath("/shared/frameworks/testbox/1.0.0/testbox"),
		"/mxunit"		= expandPath("/shared/frameworks/testbox/1.0.0/testbox/system/testing/compat"),
		"/unittests"	= expandPath("/shared/git/blogExamples/unittests")
	};

}