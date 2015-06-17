component {
	this.name		= "cfscript02";
	this.datasource	= "scratch_mysql";

	function onApplicationStart(){
		application.datasource = this.datasource;
	}
}