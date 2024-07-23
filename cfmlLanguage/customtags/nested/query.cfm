<cfscript>
// make sure the code is well-formed: must have an end tag & we must have a datasource
if (!thistag.hasEndtag){
	throw(type="UnmatchedStartTagException" message="Context validation error for the query tag" detail="The start tag must have a matching end tag.");
}
if (!structKeyExists(attributes, "datasource")){
	throw(type="RequiredAttributesException" message="Attribute validation error for tag QUERY" detail="It requires the attribute(s): DATASOURCE.");
}


if (thisTag.executionMode == "START"){
	include "helpers.cfm";	// this just abstracts out some mocked functionality to keep this file to-the-point
	dbConnector = getDbConnector(attributes.datasource);	// (UDF)
}else{
	// by the time we're here the queryparams have been processed, so the generatedContent is a value SQL string, and we have a collection of parameters
	
	result = dbConnector.execute(sql=thisTag.generatedContent, parameters=thisTag.queryparams);	// (UDF)
	
	// send some stuff back to the calling code
	if (structKeyExists(attributes, "name")){
		caller[attributes.name] = result; 
	}
	
	param name="attributes.result" default="cfquery";
	caller[attributes.result] = {
		sql		= thisTag.generatedContent,
		params	= thisTag.queryparams
	};
	thisTag.generatedContent = "";
}
</cfscript>