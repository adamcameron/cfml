// Application.cfc
component {
	thisDir	= getDirectoryFromPath(currentTemplatePath());

	structAppend(this, {
		name		= "testDI01",
		mappings	= {
			"/testapp"	= thisDir
		},
		invokeImplicitAccessor = true 
	});

}