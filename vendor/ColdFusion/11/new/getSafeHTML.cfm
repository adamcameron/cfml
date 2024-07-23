<cfscript>
// getSafeHTML.cfm
markup = '<td align="invalid">G''day World</td>';
try {
	safe = getSafeHtml(markup, "", true);
	writeDump([safe]);
} catch(any e){
	writeDump([e.type,e.message,e.detail]);
}

try {
	safe = markup.getSafeHtml("", true);
	writeDump([safe]);
} catch(any e){
	writeDump([e.type,e.message,e.detail]);
}

</cfscript>