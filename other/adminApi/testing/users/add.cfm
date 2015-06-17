<cfscript>
	application.oApiSecurity.setUser(
		username			= "adam",
		password			= "123",
		description			= "Testing API",
		allowRdsAccess		= true,
		allowAdminAccess	= true,
		allowAdminApiAccess	= true,
		roles				= [
			"coldfusion.datasources",
			"coldfusion.webservices",
			"coldfusion.logging",
			"coldfusion.customtagpaths"
		],
		services			= ["image", "chart"]
	);
</cfscript>