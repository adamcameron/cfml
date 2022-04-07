component {

	this.name = "constructor_1";
	this.datasource = "scratch_mysql";
	this.ormEnabled = true;
	this.ormSettings = {
		dialect = "MySQL",
		dbcreate = "dropcreate",
		cfclocation = getDirectoryFromPath(getCurrentTemplatePath())
	};

}