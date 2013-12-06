<cfscript>
cfmlStruct = {
	unQuotedKeyName	= "yes",
	"quotedKeyName"	= true
};
jsCode = toScript(cfmlStruct, "jsObject");
writeDump([cfmlStruct, jsCode]);
</cfscript>