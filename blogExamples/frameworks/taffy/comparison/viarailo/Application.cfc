component {

	variables.thisDir	= getDirectoryFromPath(getCurrentTemplatePath());
	variables.baseDir	= listDeleteAt(variables.thisDir, listLen(variables.thisDir, "\/"), "\/") & "/";
	variables.ormDir	= variables.baseDir & "DAO";

	this.name				= "restComparison08";
	this.datasource			= "scratch_mssql";
	this.webAdminPassword	= "123456";

	this.mappings	= {
		"/DAO"		= variables.ormDir,
		"/service"	= variables.baseDir & "service"
	};

	this.ormEnabled			= true;
	this.ormSettings		= {
		dbCreate		= "update",
		dialect			= "MicrosoftSQLServer",
		cfclocation		= variables.ormDir
	};

	function onApplicationStart(){
		var restName	= "via" & (structKeyExists(server, "railo") ? "railo": "coldfusion");
		var restDir	= variables.thisDir;
		restInitApplication(restDir, restName);
	}

}