component {

	variables.thisDir = getDirectoryFromPath(getCurrentTemplatePath());

	this.name				= "entitySave05";
	this.datasource			= "scratch_mssql";

	this.ormEnabled			= true;
	this.ormSettings		= {
		dbCreate		= "dropcreate",
		dialect			= "MicrosoftSQLServer",
		cfclocation		= variables.thisDir
	};
	
}