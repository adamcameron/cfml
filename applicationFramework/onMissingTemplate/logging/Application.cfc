component {

	this.name = "onMissingTemplateLogging01";

	function onError(){
		writeDump(arguments);
	}

	function onMissingTemplate(){
		writeDump(arguments);
	}

}