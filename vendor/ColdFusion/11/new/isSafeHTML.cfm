<cfscript>
// isSafeHTML.cfm
markup = '<td>a</td>'; // apparently not safe?
try {
	isItSafe = isSafeHtml(markup);
	writeDump([isItSafe]);
} catch(any e){
	writeDump([e.type,e.message,e.detail]);
}

try {
	isItSafe = markup.isSafeHtml();
	writeDump([isItSafe]);
} catch(any e){
	writeDump([e.type,e.message,e.detail]);
}

</cfscript>