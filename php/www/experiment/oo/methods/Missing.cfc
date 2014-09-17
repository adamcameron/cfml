// Missing.cfc
component {
	public function onMissingMethod(name, args) {
		writeDump(arguments);
	}
}
