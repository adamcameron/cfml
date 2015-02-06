// Application.cfc
component {

	writeLog(file="phpguzzle.local2", text="Application.cfc top");

	thisDir	= getDirectoryFromPath(getCurrentTemplatePath());
	appDir	= thisDir & "src/app";

	this.name					= "blogsite24";
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
	
	public void function onApplicationStart(){
		reinitRest();
	}
	
	private void function reinitRest(){
		restInitApplication(thisDir & "public/rest", "blog");
	}
	
}