// Application.cfc
component {

	thisDir	= getDirectoryFromPath(getCurrentTemplatePath());
	appDir	= thisDir & "src/app";

	this.name					= "personSite23";
	this.applicationTimeout		= createTimespan(0,0,0,10);
	this.mappings				= {
		"/app"	= appDir
	};
	this.datasource				= "scratch_mysql";
	this.ormEnabled				= true;
	this.ormSettings			= {
		dialect			= "mysql",
		cfclocation		= appDir,
		dbcreate		= "update"
	};
	this.invokeImplicitAccessor	= true;
	this.webAdminPassword		= "123456";
	
	public void function onApplicationStart(){
		reinitRest();
	}
	
	public void function onRequestStart(){
		if (URL.reinitRest ?: false){
			reinitRest();
		}
	}

	private void function reinitRest(){
		restInitApplication(thisDir & "public/rest", "api");
	}
	
}