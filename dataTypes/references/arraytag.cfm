<cfscript>
	if (thisTag.executionMode == "START"){
		arrayAppend(attributes.array, "toru");
		writeDump(var={caller=caller.array,attributes=attributes.array}, label="Within tag");
		caller[attributes.returnVariable] = attributes.array;
	}
</cfscript>