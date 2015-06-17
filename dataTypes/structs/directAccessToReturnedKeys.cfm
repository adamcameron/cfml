<cfscript>
	struct function getSomeStruct(){
		return {key="value"};
	}

	writeOutput(getSomeStruct()["key"]);
</cfscript>