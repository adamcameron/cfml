// Application.cfc
component {
	this.name				= "testapp01";
	this.mappings			= {
		"/testbox"	= expandPath("/frameworks/testbox/1.0.0/testbox"),
		"/mxunit"	= expandPath("/frameworks/testbox/1.0.0/testbox/system/testing/compat")
	};

}