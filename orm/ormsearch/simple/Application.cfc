component {

	this.name			= "SimpleDocument";
	this.datasource		= "scratch_mysql";
	this.ormEnabled		= true;
	this.ormSettings	= {
		cfclocation		= getDirectoryFromPath(getCurrentTemplatePath()),
		dialect			= "MySQL",
		logsql			= true,
		searchenabled	= true,
		search			= {
			autoIndex	= true
		},
		dbcreate		= "update"
	};

}