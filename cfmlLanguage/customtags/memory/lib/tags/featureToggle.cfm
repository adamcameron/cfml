<cfscript>
if (!thistag.hasEndtag){
	throw(type="UnmatchedStartTagException" message="Context validation error for the FEATURETOGGLE tag" detail="The start tag must have a matching end tag.");
}

if (thisTag.executionMode == "START"){
	if (!structKeyExists(attributes, "feature")){
		throw(type="RequiredAttributesException" message="Attribute validation error for tag FEATURETOGGLE" detail="It requires the attribute(s): FEATURE.");
	}
	if (!application.featureToggle.featureEnabled(attributes.feature)){
		exit "exittag";
	}
}
</cfscript>