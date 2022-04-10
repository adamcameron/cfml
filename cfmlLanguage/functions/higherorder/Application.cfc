component {

	this.name = hash(getCurrentTemplatePath());
	this.datasource = "scratch_mysql";
	this.mappings = {
		"/testbox" = "C:\src\vendor\ortus\testbox",
		"/me/adamcameron/higherOrderFunctionsBugs" = getDirectoryFromPath(getCurrentTemplatePath())
	};
}