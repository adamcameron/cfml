<form method="post">
	<input type="text" name="txt1" value="">
	<input type="submit" name="btnSubmit" value="Submit">
</form>

<cfscript>
if (structKeyExists(form, "txt1")) {
	writeOutput("<h3>FORM</h3>");
	writeDump(var=form, label="form");

	pc = getPageContext();
	req = pc.getRequest();

	writeOutput("<h3>getParameter() via getParameterNames()</h3>");
	params =req.getParameterNames();
	writeOutput("params.hasMoreElements(): " & params.hasMoreElements());

	while (params.hasMoreElements()){
		thisParam = params.nextElement();
		writeDump(var=[thisParam, req.getParameter(thisParam)], label=thisParam);
	}


	writeOutput("<h3>getParameter() via form fields</h3>");
	for (field in form){
		writeDump(var=[field, req.getParameter(field)], label=field);
	}
}
</cfscript>