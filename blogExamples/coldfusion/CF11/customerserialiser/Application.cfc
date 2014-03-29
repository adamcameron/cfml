// Application.cfc
component {
	this.name = "testSerialiser03";
	this.mappings = {
		"/cfcs" = expandPath("mappingsToHere/cfcs")
	};
	this.customSerializer = "cfcs.Serialiser";
}