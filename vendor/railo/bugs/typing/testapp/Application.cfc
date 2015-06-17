// Application.cfc
component {
	this.mappings = {
		"/testapp" = getDirectoryFromPath(getCurrentTemplatePath())
	};
}