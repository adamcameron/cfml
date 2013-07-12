<cfscript>
	impl = new Impl();
	writeOutput('isInstanceOf(impl, "I"): ' & isInstanceOf(impl, "I") & "<br>");
	writeOutput('isInstanceOf(impl, "Impl"): ' & isInstanceOf(impl, "Impl") & "<br>");
	writeOutput("<hr>");
</cfscript>
