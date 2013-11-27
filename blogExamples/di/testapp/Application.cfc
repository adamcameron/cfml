// Application.cfc
component {
	thisDir	= getDirectoryFromPath(getCurrentTemplatePath());

	structAppend(this, {
		name		= "testDI01",
		mappings	= {
			"/testapp"	= thisDir
		},
		invokeImplicitAccessor = true 
	});

}