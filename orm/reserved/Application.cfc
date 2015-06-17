component {

	this.name			= "app7";
	this.ormenabled 	= true;
	this.datasource		= "scratch";
	this.ormSettings	= {
		cfclocation	= getDirectoryFromPath(getCurrentTemplatePath()),
		dbcreate	= "dropcreate",
		dialect		= "MySQL"
	};
	
}