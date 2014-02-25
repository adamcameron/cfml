// Application.cfc
component {

	variables.thisDir = getDirectoryFromPath(getCurrentTemplatePath());

	this.name = "importBug01";
	this.mappings	= {
		"/ui"	= variables.thisDir & "/lib/tags"
	};

	sleep(60*1000);

}