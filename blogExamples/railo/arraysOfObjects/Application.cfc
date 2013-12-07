// Application.cfc
component {

	this.name				= "testCreateEventObject06";
	this.applicationTimeout	= createTimespan(0, 0, 1, 0);
	this.mappings			= {
		"/arraysOfObjects" = getDirectoryFromPath(getCurrentTemplatePath())
	};

}