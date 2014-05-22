// Application.cfc
component {

	this.name = "DSNTest02";
	this.datasources = {
		scratch_mssql_app	= {
			database	= "scratch",
			host		= "localhost",
			port		= "1433",
			driver		= "MSSQLServer",
			username	= "scratch",
			password	= "scratch"
		},
		scratch_embedded_app	= {
			database	= "C:\apps\adobe\ColdFusion\11\full\cfusion\db\scratch",
			driver		= "Apache Derby Embedded"
		}
	};
	this.datasource	= "scratch_mssql_app";

}