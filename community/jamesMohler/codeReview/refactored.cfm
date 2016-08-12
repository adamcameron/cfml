<cfscript>
function extractCodeCentricAttributesToMarkupSafeAttributes(attributes){
	var relevantAttributePattern = "^(?:data-|ng-|on)(?=\S)";

	return attributes.filter(function(attribute){
		return attribute.reFindNoCase(relevantAttributePattern);
	}).reduce(function(attributeString, attributeName, attributeValue){
		return attributeString & ' #attributeName#="#attributeValue#"';
	}, "");
}
</cfscript>