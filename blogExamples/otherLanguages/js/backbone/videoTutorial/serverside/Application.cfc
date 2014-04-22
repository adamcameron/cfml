component extends="userapi.Application" {

	variables.thisDir = getDirectoryFromPath(getCurrentTemplatePath())
	variables.apiDir = variables.thisDir & variables.apiName

}