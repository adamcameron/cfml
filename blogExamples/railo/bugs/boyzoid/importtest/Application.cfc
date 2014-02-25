component 
{
	
	this.name = 'boyzoid06';
	this.sessionManagement = true;
	rootDir = getDirectoryFromPath(getCurrentTemplatePath());
	
	//mappings
	//this.mappings[ "/ui" ] =  rootDir & '../ui';

	this.mappings	= {
		"/ui" =  rootDir & '../ui'
	};
	
}