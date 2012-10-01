component {

	this.name					= "bugNotifier17";
	this.dataSource				= "bugNotifier";
	this.invokeImplicitAccessor	= true;
	this.mappings				= {
		"/" = getDirectoryFromPath(getCurrentTemplatePath()) 
	};
	this.ormEnabled				= true;
	this.ormSettings			= {
		dbCreate		= "dropcreate",
		dialect			= "MySQLwithMyISAM",
		logSQL			= true,
		eventhandling	= true
	};
	
	public void function onApplicationStart(){
		application.name = this.name;
		appliaction.mailer = new Mailer();
	}

}