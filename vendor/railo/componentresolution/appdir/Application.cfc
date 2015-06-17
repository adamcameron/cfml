// Application.cfc
component {

	this.mappings = {
		"/differentpackage" = getDirectoryFromPath(getCurrentTemplatePath()) & "../differentpackage"
	};

}