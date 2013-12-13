// Application.cfc
component {

	this.mappings = {
		"/createLocalisedDayOfWeekAsInteger" = getDirectoryFromPath(getCurrentTemplatePath())
	};

}