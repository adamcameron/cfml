// Application.cfc
component {
	variables.thisDir = getDirectoryFromPath(getCurrentTemplatePath());

	this.mappings = {
		"/packageA" = variables.thisDir & "packageA",
		"/packageB" = variables.thisDir & "packageB"
	};
	
}