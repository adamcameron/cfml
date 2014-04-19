component {

	variables.thisDir = getDirectoryFromPath(getCurrentTemplatePath())
	variables.apiDir = variables.thisDir & "api"

	this.name				= "codeschool26"
	this.webAdminPassword	= "123456"
	this.datasource			= "scratch_mssql"

	this.ormEnabled			= true
	this.ormSettings		= {
		dbCreate		= "update",
		dialect			= "SQLServer",
		logSQL			= true,
		cfclocation		= variables.apiDir
	}
	
	public void function onApplicationStart(){
		restInitApplication(variables.apiDir, "api")
	}
	
}