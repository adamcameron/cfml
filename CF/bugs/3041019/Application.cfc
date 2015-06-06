component {
	this.name = "testHql1";

	this.datasource			= "scratch_mysql";
	this.ormEnabled			= true;
	this.ormSettings		= {
		dbCreate		= "update",
		dialect			= "MSSQL",
		logSQL			= true,
		cfclocation		= expandPath("./model/")
	};
	
}