<cfscript>
// hierarchicalExceptions.cfm

param URL.type;
try {
	writeOutput(htmlEditFormat("<code>Throwing a <strong>#URL.type#</strong> exception<br>"));
	throw(type=URL.type);

}catch (com.theapplication.thepackage.TheComponent.TheException e) {
	message = "name-spaced exception";
}catch (com.theapplication.thepackage.TheComponent e) {
	message = "component";
}catch (com.theapplication.thepackage e){
	message = "package";
}catch (com.theapplication e){
	message = "application";
}catch(any e){
	message = "default";
}

writeOutput(htmlEditFormat("The <strong>#URL.type#</strong> exception was caught by the <strong>#message#</strong> exception handler<br></code><hr>"));
</cfscript>