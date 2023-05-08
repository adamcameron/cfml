component {
 
	this.name = 'repro201';
	this.datasource = 'scratch_mysql';
	this.sessionManagement = false;
	this.clientManagement = false;
 
	//canonicalize mapping base path between platforms
	this.mapping_base = replace(expandPath('.'), '\', '/', 'all');
	this.mappings['/orm'] = this.mapping_base & '/orm';
 
	this.ormenabled = true;
	this.ormsettings = {
		dbcreate='update'
		, logsql=false
		, cfclocation= ['/orm']
		, flushAtRequestEnd=false
		, useDBForMapping=false
	};
 
}