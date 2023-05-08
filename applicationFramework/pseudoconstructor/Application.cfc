component {

	writeOutput("from pseudoconstructor<br>");
	this.name = "testExecution02";
	this.mappings = {
		"/sub" = getDirectoryFromPath(getCurrentTemplatePath()) & "sub1"
	};

	function onApplicationStart(){
		writeOutput("from #getFunctionCalledName()#()<br>");
	}

	function onRequesttart(){
		writeOutput("from #getFunctionCalledName()#()<br>");
	}

}