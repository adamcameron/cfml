component extends="shared.CF.other.appcfc.applicationMetaDataGet.subapp1.Application" {

	this.name				= "subapp2";
	this.sessionManagement	= false;

	variables.stMappings	= {
		"/java"	= "C:\java"
	};
	
	structAppend(this.mappings, variables.stMappings);
}