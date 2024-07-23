// C.cfc
component {

	static {
		final static.usingLiteral = {
			subKey = "value"
		}
		final static.usingDots.subKey = "value"
	}

	public static function dumpStatic() {
		writeDump(static)
	}
}
