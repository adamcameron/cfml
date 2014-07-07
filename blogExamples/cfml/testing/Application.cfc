// Application.cfc
component {
	this.name = "testing";
	this.mappings = {
		"/testbox"	= expandPath("/shared/frameworks/testbox")
	};
}