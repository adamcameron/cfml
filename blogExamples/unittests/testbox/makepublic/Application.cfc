// Application.cfc
component {

	this.mappings			= {
		"/testbox"		= expandPath("/frameworks/testbox/"),
		"/mxunit"		= expandPath("/frameworks/testbox/system/testing/compat"),
		"/unittests"	= expandPath("/shared/git/blogExamples/unittests")
	};

}