// Application.cfc
component {

	this.name					= "orm06";
	this.datasource				= "scratch_mysql";
	this.ormEnabled				= true;
	this.ormSettings			= {
		dialect			= "mysql",
		cfclocation		= expandPath("./entities/"),
		dbcreate		= "update"
	};
	this.invokeImplicitAccessor	= true;
	
}