component accessors=true {
	
	/** @default ["G'day", "World"] */
	property array myArrayProperty;

	function test() {
		writeDump([
			myArrayProperty,
			getMetaData(this).properties[1].name,
			getMetaData(this).properties[1].type
		]);
	}
	
}