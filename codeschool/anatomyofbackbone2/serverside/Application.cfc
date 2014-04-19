component extends="api.Application" {

	variables.thisDir = getDirectoryFromPath(getCurrentTemplatePath())
	variables.apiDir = variables.thisDir & "api"

}