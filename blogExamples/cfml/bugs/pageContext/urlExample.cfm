<cfscript>
	writeOutput("<h3>URL</h3>");
	writeDump(var=URL, label="URL");

	pc = getPageContext();
	req = pc.getRequest();

	writeOutput("<h3>getParameter() via getParameterNames()</h3>");
	params =req.getParameterNames();
	writeOutput("params.hasMoreElements(): " & params.hasMoreElements());

	while (params.hasMoreElements()){
		thisParam = params.nextElement();
		writeDump(var=[thisParam, req.getParameter(thisParam)], label=thisParam);
	}


	writeOutput("<h3>getParameter() via URL keys</h3>");
	for (field in URL){
		writeDump(var=[field, req.getParameter(field)], label=field);
	}
</cfscript>