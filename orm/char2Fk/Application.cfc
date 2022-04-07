component {

	this.name				= "testing1";
	this.datasource			= "scratch";

	this.ormenabled = true;
	this.ormsettings	= {
		dialect				= "MicrosoftSQLServer",
		savemapping			= false,
		dbcreate			= "dropcreate"/**/, 
		cfclocation	= [
			expandPath("/cf/other/orm/char2Fk/")
		]
	};
}
