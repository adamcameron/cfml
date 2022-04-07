component {

	this.name				= "ORM";
	this.datasource			= "cfartgallery";
	this.ormEnabled			= true;
	this.ormSettings		= {
		dialect			= "Derby",
		cfclocation		= expandPath(".")
	};
}