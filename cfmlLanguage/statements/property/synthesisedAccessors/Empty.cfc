// Empty.cfc
component {

	function dump(){
		writeDump(var=variables, label="variables");
		writeDump(var=this, label="this");
	}

}
