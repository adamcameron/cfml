component {

	this.name		= "bugUpdates03";
	this.datasource	= "bugUpdates";
	this.ormEnabled	= true;
	this.ormSettings	= {
		cfcLocation	= getDirectoryFromPath(getCurrentTemplatePath()) & "components\orm",
		dbCreate	= "update",
		dialect		= "derby"
	};


}