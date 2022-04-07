// MyDump.cfc
component {

	static {
		first = 1
		second = 2
	}

	public static function dumpStatic(){
		dump(static)
	}

	public function dumpClass(){
		dump(static.getClass().getName())
	}

	public static function dumpMetadata(){
		dump(getMetadata(static))
	}
}