<cfscript>
	include "utils.cfm";

	writeOutput("Manual Clearance<br>");
	impl = new Impl();
	gCopy = impl.g;

	writeOutput("Cleared<br>");
	structClear(impl);
	writeOutput('isInstanceOf(impl, "I"): ' & isInstanceOf(impl, "I") & "<br>");
	writeOutput('isInstanceOf(impl, "Impl"): ' & isInstanceOf(impl, "Impl") & "<br>");

	writeOutput("Restored<br>");
	impl.g = createFunctionFromMetadata(gCopy);
	writeOutput('isInstanceOf(impl, "I"): ' & isInstanceOf(impl, "I") & "<br>");
	writeOutput('isInstanceOf(impl, "Impl"): ' & isInstanceOf(impl, "Impl") & "<br>");
	writeOutput("<hr>");

	writeOutput("Use Restored<br>");
	try {
		testI(impl);
		writeOutput("testI(impl): true<br>");
	}
	catch (any e){
		writeOutput("testI(impl): false<br>");
	}

	// control
	impl = new Impl();
	writeOutput("Control<br>");
	writeOutput('isInstanceOf(impl, "I"): ' & isInstanceOf(impl, "I") & "<br>");
	writeOutput('isInstanceOf(impl, "Impl"): ' & isInstanceOf(impl, "Impl") & "<br>");
	writeOutput("<hr>");
</cfscript>
