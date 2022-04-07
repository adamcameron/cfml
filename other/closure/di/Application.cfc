// Application.cfc
component {

	this.name				= "DI01";
	this.applicationTimeout	= createTimespan(0, 0, 1, 0);
	this.mappings			= {
		"/testDI" = getDirectoryFromPath(getCurrentTemplatePath()),
		"/unittests" = expandPath("/shared/git/blogExamples/unittests")
	};

}