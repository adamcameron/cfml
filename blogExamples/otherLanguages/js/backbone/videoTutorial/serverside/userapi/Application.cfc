component {

	variables.thisDir	= getDirectoryFromPath(getCurrentTemplatePath())
	variables.apiName	= "userapi";
	variables.apiDir	= variables.thisDir & variables.apiName

	this.name				= "backboneVideoTutorial20"
	this.webAdminPassword	= "123456"
	this.datasource			= "scratch_mssql"

	this.ormEnabled			= true
	this.ormSettings		= {
		dbCreate		= "dropcreate",
		dialect			= "SQLServer",
		logSQL			= true,
		cfclocation		= variables.apiDir
	}
	
	public void function onApplicationStart(){
		restInitApplication(variables.apiDir, variables.apiName)
	}
	
}