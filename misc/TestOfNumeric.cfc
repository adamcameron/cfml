component accessors=true {
	
	/** @default 42 */
	property numeric myNumericProperty;

	function test() {
		writeDump([
			myNumericProperty,
			getMetaData(this).properties[1].name,
			getMetaData(this).properties[1].type
		]);
	}
	
}