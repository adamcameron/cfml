component {

	this.name			= "app2";
	this.ormenabled 	= true;
	this.datasource		= "scratch";
	this.ormSettings	= {
		cfclocation	= getDirectoryFromPath(getCurrentTemplatePath()),
		dbcreate	= "dropcreate",
		dialect		= "MicrosoftSQLServer"
	};
	
}