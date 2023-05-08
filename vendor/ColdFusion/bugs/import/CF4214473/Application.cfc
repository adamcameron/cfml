// Application.cfc
component {

	variables.thisDir = getDirectoryFromPath(getCurrentTemplatePath())

	this.name = "CF4214473";
	this.mappings	= {
		"/com/example"	= variables.thisDir & "/com/example",
		"/me/adamcameron"	= variables.thisDir & "/me/adamcameron"
	};

}
