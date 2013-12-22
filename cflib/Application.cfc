// Application.cfc
component {
	variables.currentDir = getDirectoryFromPath(getCurrentTemplatePath());
	this.name		= "cflib02";
	this.mappings	= {
		"/cflib"	= variables.currentDir,
		"/tests"	= variables.currentDir & "tests",
		"/testbox"	= expandPath("/frameworks/testbox/1.0.0/testbox")
	};

}