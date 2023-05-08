<cfscript>
// imageGetMetadata.cfm
image = imageRead(expandPath("../pdfs/thumbs/bbc_page_1.jpg"));
try {
	md = imageGetMetadata(image);
	writeDump(md);
} catch(any e){
	writeDump([e.type,e.message,e.detail]);
}

try {
	md = image.getMetadata();
	writeDump(md);
} catch(any e){
	writeDump([e.type,e.message,e.detail]);
}

</cfscript>