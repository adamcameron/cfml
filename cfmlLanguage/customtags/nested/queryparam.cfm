<cfscript>
// make sure the code is well-formed: no closing tag, and nested within a query tag
if (thistag.hasEndtag){	
	throw(type="UnmatchedEndTagException" message="Context validation error for the queryparam tag" detail="The queryparam tag does not support an end tag.");
}
if (listLast(getBasetagList()) != "cf_query"){
	throw(type="UnmatchedEndTagException" message="Context validation error for the queryparam tag" detail="The tag must be nested inside a query tag.");
}

// if we're here, we've got a legit queryparam tag
if (thisTag.executionMode == "START"){
	include "helpers.cfm";	// this just abstracts out some mocked functionality to keep this file to-the-point

	validateParam(attributes);	// (UDF) will raise an exception if everything ain't legit for this param
	
	// the query tag will have worked out which DB we're dealing with, so get a DB-specific object to help "translate" the param from CF-speak to JDBC-speak
	dbConnector = getBaseTagData("cf_query").dbConnector;
	jdbcParam = dbConnector.createJdbcParam(attributes);

	// CFASSOCIATE is not as granular as it could be, so get rid of ALL the attributes and just pop back in the one we actually want to give back to the calling code
	attributes = jdbcParam; 
	cfassociate(basetag="cf_query", datacollection="queryparams");	// (UDF)

	// put in a parameter placeholder in place of the tag 
	writeOutput("?");
}
// there is no closing tag, so no "ELSE"
</cfscript>