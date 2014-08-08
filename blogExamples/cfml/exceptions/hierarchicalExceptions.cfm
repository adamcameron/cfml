<cfscript>
//hierarchicalExceptions.cfm
param URL.type;
try {
	writeOutput("Throwing a <strong>#URL.type#</strong> exception<br>");
	throw(type=URL.type);

	}catch (com.theapplication e){
		message = "application";
	}catch (com.theapplication.thepackage e){
		message = "package";
	}catch (com.theapplication.thepackage.thecomponent e) {
		message = "component";
	}catch(theException e){
		message = "specific exception";
	}catch(any e){
		message = "default";
	}

	writeOutput("The <strong>#URL.type#</strong> exception was caught by the <strong>#message#</strong> exception handler<br>");
</cfscript>