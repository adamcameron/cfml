// Application.cfc
component {
	variables.thisDir = getDirectoryFromPath(getCurrentTemplatePath());

	this.name = "testCustomTagPaths01";

	this.customTagPaths =
		variables.thisDir & "lib"
		& "," & variables.thisDir & "tags"
	;

	writeDump(var=this);
}