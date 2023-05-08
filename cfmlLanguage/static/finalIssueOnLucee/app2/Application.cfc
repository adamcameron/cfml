component {
	this.name = "app2"
	this.mappings = [
		"/stuff" = getCanonicalPath(getDirectoryFromPath(getCurrentTemplatePath()) & "..")
	]
}
