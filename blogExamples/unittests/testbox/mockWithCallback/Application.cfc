// Application.cfc
component {
	this.name		= "testMockWithCallback02";
	this.mappings	= {
		"/testbox"	= expandPath("/scribble/frameworks/testbox"),
		"/mxunit"	= expandPath("/scribble/frameworks/testbox/system/testing/compat")
	};
}