component {

	this.name = "DSNTest05";
	this.datasources = {
		scratch_mssql_app	= {
			database	= "scratch",
			host		= "localhost",
			port		= "1433",
			type		= "MSSQL",
			username	= "scratch",
			password	= "encrypted:3c5501c80c3f07ac0d0f8b745a28c439c7ddb1b2de5bf701"
		}
	};
	this.datasource	= "scratch_mssql_app";

}