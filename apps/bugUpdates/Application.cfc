component {

	this.name		= "bugUpdates01";
	this.datasource	= "bugUpdates";
	this.ormEnabled	= true;
	this.ormSettings	= {
		cfcLocation	= getDirectoryFromPath(getCurrentTemplatePath()) & "components\orm",
		dbCreate	= "update",
		dialect		= "MySQL"
	};


}