component {
	
	this.name				= "TN";
	this.datasource 		= "TN";

	this.mappings			= {
		"/com/tastingnotes"	= expandPath("/../com/tastingnotes")
	};

	this.ormenabled = true;
	this.ormsettings	= {
		dialect				= "MicrosoftSQLServer",
		savemapping			= false,
		dbcreate			= "dropcreate",	// 
		cfclocation	= [
			expandPath("/../com/tastingnotes/model/pets/")
		]
	};
/**/

}
