component {
	this.name = "ormPlayground";
	this.datasource = "mingo";
	this.ormEnabled = true;
	this.ormSettings = {
		dbcreate = "dropcreate",
		dialect = "MySQL",
		savemapping=true
	};

	function onRequestStart() {
		ormreload();
	}
}