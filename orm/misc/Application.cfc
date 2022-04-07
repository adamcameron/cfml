component {

	this.name			= "app11";
	this.ormenabled 	= true;
	this.datasource		= "scratch_sqlsvr";
	this.ormSettings	= {
		cfclocation	= getDirectoryFromPath(getCurrentTemplatePath()),
		dbcreate	= "dropcreate",
		dialect		= "MicrosoftSQLServer"
	};
	
}