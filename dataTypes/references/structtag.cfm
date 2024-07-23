<cfscript>
	if (thisTag.executionMode == "START"){
		attributes.struct.three = "toru";
		writeDump(var={caller=caller.struct,attributes=attributes.struct}, label="Within tag");
		caller[attributes.returnVariable] = attributes.struct;
	}
</cfscript>