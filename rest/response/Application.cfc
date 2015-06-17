component {

	variables.thisDir	= getDirectoryFromPath(getCurrentTemplatePath());
	variables.apiName	= "responseapi";
	variables.apiDir	= variables.thisDir;

	this.name				= "response18";
	this.webAdminPassword	= "123456";
	this.datasource			= "scratch_mssql";

	this.ormEnabled			= true;
	this.ormSettings		= {
		dbCreate		= "update",
		dialect			= "MicrosoftSQLServer",
		logSQL			= true,
		cfclocation		= variables.apiDir
	};
	
	public void function onApplicationStart(){
		restInitApplication(variables.apiDir, variables.apiName);
	}
	
}