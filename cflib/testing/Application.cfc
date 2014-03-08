// Application.cfc
component {
	this.name = "testingForCflib01";
	this.mappings = {
		"/testbox" = expandPath("/frameworks/testbox/be/testbox")
	};
}