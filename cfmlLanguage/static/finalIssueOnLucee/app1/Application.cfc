component {
	this.name = "app1"
	this.mappings = [
		"/stuff" = getCanonicalPath(getDirectoryFromPath(getCurrentTemplatePath()) & "..")
	]
}
