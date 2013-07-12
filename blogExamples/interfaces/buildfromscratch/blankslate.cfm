<cfscript>
metaDataI		= getComponentMetadata("TestInterface");
metaDataImpl	= getComponentMetadata("Impl");
/*
writeDump({
	metaDataI		= metaDataI,
	metaDataImpl	= metaDataImpl
});
writeOutput("<hr>");
*/

metaDataEmpty	= getComponentMetadata("Empty");
//writeDump({metaDataEmpty=metaDataEmpty});

metaDataEmpty.implements = {
	"TestInterface" = metaDataI
};
//writeOutput("<hr>");

empty = new Empty();
public numeric function length(required string s) {
	return len(s);
}
empty.length = length;

metadataEmpty = getMetadata(empty);
//writeDump({metadataEmpty=metadataEmpty});
//writeOutput("<hr>");


writeOutput('isInstanceOf(empty, "TestInterface"): ' & isInstanceOf(empty, "TestInterface") & "<br>");
writeOutput("<hr>");
try {
	boolean function inboundTester(required TestInterface o){
		return true;
	}
	writeOutput("Test passing into function<br>");
	inboundTester(empty);
	writeOutput("inboundTester(empty): OK<br>");
}
catch (any e){
	writeDump(var=e, label="e");
}

try {
	TestInterface function outboundTester(required any o){
		return o;
	}
	writeOutput("Test passing back from function<br>");
	outboundTester(empty);
	writeOutput("outboundTester(empty): OK<br>");
}
catch (any e){
	writeDump(var=e, label="e");
}
</cfscript>