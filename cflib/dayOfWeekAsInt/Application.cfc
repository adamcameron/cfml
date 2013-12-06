// Application.cfc
component {

	this.mappings			= {
		"/dayOfWeekAsInt" = getDirectoryFromPath(getCurrentTemplatePath())
	};

}