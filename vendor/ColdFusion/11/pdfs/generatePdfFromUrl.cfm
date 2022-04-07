<cfscript>
// generatePdfFromUrl.cfm

param URL.htmlUrl;

pdfDir = expandPath("./pdfs/");
pageName = listLast(URL.htmlUrl, "/");
pdfPath = pdfDir & pageName & ".pdf";
try {
	startTime = getTickCount();
	cfhtmltopdf(source=URL.htmlUrl, destination=pdfPath, overwrite=true);
	totalTime =getTickCount() - startTime;
	writeOutput("Execution time: #totalTime#ms<br>");
}catch (any e){
	writeDump(e);
}
</cfscript>