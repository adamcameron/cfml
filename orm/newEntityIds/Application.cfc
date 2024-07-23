component {

	this.name				= "test01";
	this.datasource			= "scratch_mssql";

	this.ormEnabled			= true;
	this.ormSettings		= {
		dbCreate		= "dropcreate",
		dialect			= "MicrosoftSQLServer"
	};
	
}