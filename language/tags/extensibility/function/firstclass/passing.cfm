<cfscript>
// passing.cfm
function stringTransformer(required string text, required function transformer){
	return transformer(text);
}

string = "G'day World!";
handler = ucase;
transformed = stringtransformer(string, handler);

writeDump([string, transformed]);
</cfscript>