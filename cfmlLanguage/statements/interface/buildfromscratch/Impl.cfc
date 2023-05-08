// Impl.cfc
component implements="TestInterface" {

	public numeric function length(required string s) {
		return len(s);
	}

}