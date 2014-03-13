<cfscript>
if (thisTag.executionMode == "start"){
	thisTag.generatedContent = "";
	if (!getBaseTagData('cf_if').result){
		exit "exittag";
	}
}else{
	writeOutput(thisTag.generatedContent);
	thisTag.generatedContent = "";
}
</cfscript>