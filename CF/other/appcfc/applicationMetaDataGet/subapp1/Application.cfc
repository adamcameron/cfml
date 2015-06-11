component extends="shared.CF.other.appcfc.applicationMetaDataGet.Application" {

	this.name				= "subapp1";
	this.clientManagement	= false;
	this.sessionManagement	= true;
	this.sessionTimeout		= createTimeSpan(0,0,20,0);

	variables.stMappings	= {
		"/windows"	= "C:\windows"
	};
	
	structAppend(this.mappings, variables.stMappings);
}