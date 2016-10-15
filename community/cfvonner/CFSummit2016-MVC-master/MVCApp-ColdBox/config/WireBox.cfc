component extends='coldbox.system.ioc.config.Binder' {
	
	function configure() {
		// Recursively map models folder
		mapDirectory( 'root.models' );
		
		// Anything in services folder is a singleton by convention
		mapDirectory( 'root.models.services' )
			.asSingleton();
	}
	
}